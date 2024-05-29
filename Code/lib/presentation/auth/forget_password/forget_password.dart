import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/textfield_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------

  late FocusNode _userEmailFocusNode;

  @override
  void initState() {
    super.initState();

    _userEmailFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFDFE2E5),
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  size: 32, // Adjust the size as per your requirement
                ),
              ),
            ),
          ),
        )

        // actions: _buildBody(context),
        );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : _buildRightSide(),
          // Observer(
          //   builder: (context) {
          //     return _userStore.success
          //         ? navigate(context)
          //         : _showErrorMessage(_formStore.errorStore.errorMessage);
          //   },
          // ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isForgetPasswordLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return CustomScrollView(slivers: [
    SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildHeadingText(),
            SizedBox(height: 24.0),
            _buildUserIdField(),
            SizedBox(height: 12.0),
            _buildSignInButton(),
          ],
        ),
      ),
    )
          ]);
  }

  Widget _buildHeadingText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color(0xfff1c1c1c)),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Opps. It happens to the best of us. Input your email address to fix the issue.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(17, 24, 39, 1)),
          ),
        ],
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('login_user_email'),
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: true,
          focusNode: _userEmailFocusNode,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) => handleForgetPassword,
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: 'Email' '',
          textColor: Theme.of(context).colorScheme.onPrimaryContainer
          ,
        );
      },
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24.0),
      child: RoundedButtonWidget(
        buttonText: AppLocalizations.of(context).translate('submit_btn'),
        buttonColor: const Color.fromRGBO(31, 41, 56, 1),
        textColor: Colors.white,
        onPressed: handleForgetPassword,
      ),
    );
  }

  Future<void> handleForgetPassword() async {
    if (_formStore.canForgetPassword) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value =
            await _userStore.forgotPassword(_userEmailController.text);

        if (value != null) {
          print('check forget password success value are -----> $value');
          showNotification(context, 'success', 'Success', value!.message);

          await Future.delayed(Duration(seconds: 1));
          Navigator.of(context).pushNamed(Routes.setNewPassword);
        }

        print(value);
      } catch (e) {
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        } else {
          showNotification(
              context, 'error', 'Error', e.toString());
        }
      }
    } else {
      showNotification(context, 'error', 'Error', 'Please Enter Email Id.');
    }
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _userEmailFocusNode.dispose();

    super.dispose();
  }
}
