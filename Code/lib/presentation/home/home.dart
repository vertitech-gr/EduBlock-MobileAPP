import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/widgets/buttons/outline_button_icon/outline_button_icon.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/language/language_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/presentation/screens/requests/request_screen_widget.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final LanguageStore _languageStore = getIt<LanguageStore>();
  final CreateEnvelopesStore _createEnvelopesStore = getIt<CreateEnvelopesStore>();
  final ProfileStore _profileStore = getIt<ProfileStore>();
  final UserStore _userStore = getIt<UserStore>();
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      List results = await Future.wait([
      _certificateRequestStore.getAllRequestLists(_userStore.currentUser?.existingUser.id as String),
        _certificateRequestStore.getStudentRequest(_userStore.currentUser!.existingUser.id)
    ]);
    } catch (e) {
      if (e is ApiResponse) {
        // showNotification(context, 'error', 'Error', e.message);
      } else {
        // showNotification(
        //     context, 'error', 'Error', e.toString());
      }
      print('check error are occur $e');
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

          Observer(
            builder: (context) {
              return Visibility(
                visible: _createEnvelopesStore.isEnvelopeListsLoading || _certificateRequestStore.isAllRequestListsLoading || _certificateRequestStore.isCertificateLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }




  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildTopHeader(),
          _buildRequestDashboard(),
          _buildActivity(),
          _buildMyActivity(),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Requests',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          // CustumTextButton(-
          //   isWhite: true,
          //     buttonName: 'Purchase Coins', callback: () {
          //
          // })
        ],
      ),
    );
  }

  Widget _buildRequestDashboard() {
    return Card(
      elevation: 4.0, // Add elevation for a shadow effect
      margin: EdgeInsets.all(8.0),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    radius: 14.0, // Adjust the radius as needed
                    child: Icon(
                      Icons.folder,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Recent Requests',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 32.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Observer(builder: (context) {
                          return RichText(
                            text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 0.5),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Incoming'),
                                  TextSpan(
                                    text:
                                        '  ${_certificateRequestStore.allRecievedRequestLists.length}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondaryContainer,
                                            height: 1.5),
                                  ),
                                ]),
                          );
                        }),
                        SizedBox(
                          width: 36.0,
                        ),
                        SizedBox(width: 36.0,),

                        Observer(
                          builder: (context) {
                            return RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).colorScheme.primary,
                                      letterSpacing: 0.5
                                  ),
                                  children:  <TextSpan>[
                                    const TextSpan(text: 'Outgoing '),
                                    TextSpan(text: ' ${ _certificateRequestStore.studentRequestLists.length}',
                                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                          height: 1.5

                                      ),
                                    ),
                                  ]),
                            );
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //       style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  //           fontWeight: FontWeight.w700,
                  //           color: Theme.of(context).colorScheme.primary,
                  //           letterSpacing: 0.5
                  //       ),
                  //       children:  <TextSpan>[
                  //         const TextSpan(text: 'Employer Requests'),
                  //         TextSpan(text: ' 0',
                  //           style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  //               fontWeight: FontWeight.w700,
                  //               color: Theme.of(context).colorScheme.secondaryContainer,
                  //               height: 1.5
                  //
                  //           ),
                  //         ),
                  //       ]),
                  // ),
                  CustumTextButton(
                    buttonName: 'View All',
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RequestWidgetScreen(),
                        ),
                      );
                    },
                    IsCircleIcon: true,
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildActivity() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activities',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButtonIconWidget(
                  buttonName: 'Create Envelope',
                  callback: () {
                    Navigator.of(context)
                        .pushNamed(Routes.createEvelopesScreen);
                  },
                ),
                OutlineButtonIconWidget(buttonName: 'Request Certificates', callback: () {
                Navigator.of(context).pushNamed(Routes.insitutionalDetailScreen);
              },)
              ],
            ),
          ],
        ));
  }

  Widget _buildMyActivity() {
    return MyWalletScreen();
  }
}
