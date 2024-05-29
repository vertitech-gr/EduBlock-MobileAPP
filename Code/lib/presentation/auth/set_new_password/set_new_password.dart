import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/bottom_sheets/success_bottom_sheet.dart';
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

class SetNewPasswordScreen extends StatefulWidget {
  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _otpPinController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------

  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _otpPinFocusNode;

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _otpPinFocusNode = FocusNode();
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
          _buildRightSide(),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isNewPasswordSetLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
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
              _buildOtpField(),
              SizedBox(height: 12.0),
              _buildPasswordField(),
              SizedBox(height: 12.0),
              _buildConfirmPasswordField(),
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
            'Set new password',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color(0xfff1c1c1c)),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Generate a robust password with a mix of letters, numbers, and symbols.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(17, 24, 39, 1)),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('for_et_user_otp'),
          inputType: TextInputType.number,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _otpPinController,
          inputAction: TextInputAction.next,
          autoFocus: true,
          onChanged: (value) {
            print('check userfull name $value');
            _formStore.setForgetPasswordOtp(_otpPinController.text);
            print('check error are ${_formStore.formErrorStore.userFullName}');
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus(_userEmailFocusNode);
            handleChangeNewPassword();
          },
          errorText: _formStore.formErrorStore.otp,
          isSuffixIcon: false,
          labelText: 'OTP',
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('set_new_et_password'),
          isObscure: !_formStore.visibility,
          // padding: EdgeInsets.only(top: 16.0),
          // icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _formStore.formErrorStore.password,
          onChanged: (value) {
            _formStore.setPassword(_passwordController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
          },

          isSuffixIcon: true,
          suffixIcon:
              _formStore.visibility ? Icons.visibility : Icons.visibility_off,
          onSuffixIconPressed: () {
            _formStore.handleVisibility();
          },
          labelText: 'New password',
        );
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint:
              AppLocalizations.of(context).translate('confirm_new_et_password'),
          isObscure: !_formStore.confirmVisibility,
          // padding: EdgeInsets.only(top: 16.0),
          // icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _confirmPasswordController,
          focusNode: _confirmPasswordFocusNode,
          errorText: _formStore.formErrorStore.confirmPassword,
          onChanged: (value) {
            _formStore.setConfirmPassword(_confirmPasswordController.text);
          },
          onFieldSubmitted: (value) => handleChangeNewPassword(),
          isSuffixIcon: true,
          suffixIcon: _formStore.confirmVisibility
              ? Icons.visibility
              : Icons.visibility_off,
          onSuffixIconPressed: () {
            _formStore.handleConfirmVisibility();
          },
          labelText: 'Confirm password',
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
        onPressed: handleChangeNewPassword,
      ),
    );
  }

  Future<void> handleChangeNewPassword() async {
    if (_formStore.canSetNewPassword) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _userStore.newPassword(
            _userStore.registerAuthToken,
            _formStore.otp.trim(),
            _confirmPasswordController.text.trim());

        if (value != null) {
          print('check set new  password success value are -----> $value');
          successBottomSheet(context, 'Password Recovery Successful',
              'Return to the login screen to enter the application','Return to login',
                  () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.login, (Route<dynamic> route) => false);
          });
          // showNotification(context, 'success', 'Success', value!.message);
          // navigate(context);
          // await Future.delayed(Duration(seconds: 1));
          // Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
        }

        print('check user are here for  $value');
      } catch (e) {
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        } else {
          showNotification(context, 'error', 'Error', e.toString());
        }
      }
    } else {
      showNotification(context, 'error', 'Error', 'Please All field .');
    }
  }

  Widget navigate(BuildContext context) {
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool(Preferences.is_logged_in, true);
    // });

    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _passwordController.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }
}
