import 'dart:async';

import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/stores/request_chat_store/request_chat_store.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/student_chat_screen/chat_screen/chat_screen.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/outgoing-request/outgoing_request.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';

class StudentChatScreen extends StatefulWidget {
  final StudentRequest studentRequest;

  StudentChatScreen({super.key, required this.studentRequest});

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {
  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();

  final UserStore _userStore = getIt<UserStore>();
  final RequestChatStore _requestChatStore = getIt<RequestChatStore>();
  final RequestChatErrorStore _requestChatErrorStore =
      getIt<RequestChatErrorStore>();
  final ProfileStore _profileStore = getIt<ProfileStore>();

  // final InstitutionRegistrationFormStore _formStore =
  // getIt<InstitutionRegistrationFormStore>();'
  TextEditingController _messageController = TextEditingController();
  late FocusNode _messsageFocusNode;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _messsageFocusNode = FocusNode();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchData();
    });
    fetchData();
  }

  void fetchData() async {
    try {
      // Fetch data only if the widget is not disposed and not currently editing message
      if (!mounted || _messsageFocusNode.hasFocus) return;

      _messageController.text='';
      List results = await Future.wait([
        _requestChatStore.getRequestChat(widget.studentRequest.id),
        _profileStore.getProfileDetails("")
      ]);
    } catch (error) {
      _messageController.text='';
      print('check error are occur $error');
      // Handle errors
    }
  }
  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildRightSide(context),
          // Observer(
          //   builder: (context) {
          //     return Visibility(
          //       visible: _requestChatStore.isRequestChatLoading ||
          //           _requestChatStore.isSendMessageLoading,
          //       child: const CustomProgressIndicatorWidget(),
          //     );
          //   },
          // ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: _buildInputFieldAndSendButton()))
        ],
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 32.0),
        constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height*0.8, // Set minimum height here
            minWidth: MediaQuery.of(context).size.width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                widget.studentRequest.remark,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildRequestChat(),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Expanded(child: _buildChatScreen()),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatScreen() {
    return Observer(builder: (context) {
      return _requestChatStore.studentRequestChatLists.isNotEmpty
          ? GroupedListView<dynamic, String>(
              elements: _requestChatStore.studentRequestChatLists,
              groupBy: (element) => element.requestMessages.senderId,
              groupSeparatorBuilder: (String groupByValue) =>
                  Text(groupByValue),
              itemBuilder: (context, dynamic element) => Text(element['name']),
              itemComparator: (item1, item2) => item1['requestMessages']
                      ['senderId']
                  .compareTo(_userStore.currentUser!.existingUser.id),
              // optional
              useStickyGroupSeparators: true,
              // optional
              floatingHeader: true,
              // optional
              // element.commanUser.name
              order: GroupedListOrder.ASC,
              // optional
              indexedItemBuilder: (context, element, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    // Background color for the chat bubble
                    borderRadius: BorderRadius.circular(
                        8.0), // Rounded corners for the chat bubble
                  ),
                  child: Text('${element.commanUser.name}'),
                );
              },
            )
          : Container(
              child: Text(
                'No conversations started yet',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
              ),
            );
    });
  }

  Widget _buildRequestChat() {
    return Observer(builder: (context) {
      return _requestChatStore.studentRequestChatLists.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.77,
                child: ListView.separated(
                  shrinkWrap: false,
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(bottom: 16.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _requestChatStore.studentRequestChatLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(
                        '_requestChatStore.studentRequestChatLists.length ${_requestChatStore.studentRequestChatLists.length}');
                    return ChatScreen(
                      requestChat:
                          _requestChatStore.studentRequestChatLists[index],
                      currentUserID: _userStore.currentUser!.existingUser.id,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0));
                  },
                ),
              ),
            )
          : Container(
              child: Text(
                'No conversations started yet',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                textAlign: TextAlign.center,
              ),
            );
    });
  }

  Widget _buildInputFieldAndSendButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildMessage(),
            ),
            SizedBox(width: 8.0),
            IconButton(
              autofocus: true,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.send_sharp,
                color: Theme.of(context).colorScheme.secondaryContainer,
                size: 48,
              ),
              disabledColor: Theme.of(context).colorScheme.onSecondaryContainer,
              onPressed: widget.studentRequest.status == 2 ||
                      widget.studentRequest.status == 3
                  ? null
                  : sendMessage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          // textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          textColor: Colors.black,
          isReadOnly: widget.studentRequest.status == 2 ||
                  widget.studentRequest.status == 3
              ? true
              : false,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: widget.studentRequest.status == 2 ||
                  widget.studentRequest.status == 3
              ? ' Chat  End '
              : 'Enter Message ',
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.text,
          focusNode: _messsageFocusNode,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _messageController,
          inputAction: TextInputAction.next,
          onChanged: (value) {
            _requestChatStore.setMessage(_messageController.text);
          },
          onFieldSubmitted: (value) {
            sendMessage();
          },
          errorText: widget.studentRequest.status == 2 ||
              widget.studentRequest.status == 3?null: _requestChatStore.requestChatErrorStore.message,
          isSuffixIcon: false,
          // labelText: AppLocalizations.of(context).translate(
          //     'college_info_other_form_institution_course_first_name'),
          labelText: '',
        );
      },
    );
  }

  Future<void> sendMessage() async {
    if (_requestChatStore.canSendMessage) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _requestChatStore.sendMessage(
            _profileStore.currentUser!.existingUser.id,
            widget.studentRequest.id,
            _messageController.text,
            _userStore.authToken!);
        if (value?.message != null) {
          // showNotification(context, 'success', 'success', value!.message);
          Future.delayed(Duration(milliseconds: 1000), () {
            fetchData();
            // Navigator.of(context).pushNamed(Routes.otpVerify);
          });
        }
        print(value);
      } catch (e) {
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        } /*else {
                showNotification(
                    context, 'error', 'Error', e.response?.data['message']);
              }*/
      }
    } else {
      showNotification(context, 'error', 'Error', 'Please enter message .');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    _messageController?.dispose();
    super.dispose();
  }
}
