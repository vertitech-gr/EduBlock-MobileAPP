import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/empty_app_bar_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/core/widgets/textfield_widget.dart';
import 'package:edublock/data/sharedpref/constants/preferences.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildRightSide(),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
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
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 72),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
              _buildHeadingText(),
              SizedBox(height: 24.0),
              _buildUserIdField(),
              SizedBox(height: 12.0),
              _buildPasswordField(),
              _buildForgotPasswordButton(),
              _buildSignInButton(),
              SizedBox(height: 12.0),

              // _buildtwoFAWidget(),
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
          Text('Login to your account',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
          const SizedBox(
            height: 24,
          ),
          Text(
              'Welcome back! Enter your details and manage your blockchain-certified certificates',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
        ],
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          labelTextColor: Theme.of(context).colorScheme.primaryContainer,

          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('login_et_user_email'),
          // hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: 'Email Address' '',
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          labelTextColor: Theme.of(context).colorScheme.primaryContainer,
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint:
              AppLocalizations.of(context).translate('login_et_user_password'),
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
          onFieldSubmitted: (value) => {onLogin()},
          isSuffixIcon: true,
          suffixIcon:
              _formStore.visibility ? Icons.visibility : Icons.visibility_off,
          onSuffixIconPressed: () {
            _formStore.handleVisibility();
          },
          labelText: 'Password',
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_forgot_password'),
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: const Color.fromRGBO(19, 196, 159, 1)),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.forgetPassword);
          // _userStore.forgotPassword(
          //     _userEmailController.text);
        },
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: RoundedButtonWidget(
          buttonText:
              AppLocalizations.of(context).translate('login_btn_sign_in'),
          buttonColor: const Color.fromRGBO(19, 196, 159, 1),
          textColor: Colors.white,
          onPressed: onLogin),
    );
  }

  Future<void> onLogin() async {
    if (_formStore.canLogin) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _userStore.login(
            _userEmailController.text, _passwordController.text.trim());
        if (value?.message == 'Verify email using OTP') {
          showNotification(context, 'success', 'success', value!.message);
          Future.delayed(Duration(milliseconds: 3000), () {
            Navigator.of(context).pushNamed(Routes.otpVerify);
          });
        } else {
          navigate(context);
        }
      } catch (e) {
        print('error is $e');
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        }
      }
    } else {
      showNotification(context, 'error', 'Error', 'Please fill in all fields.');
    }
  }

  Widget _buildtwoFAWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildBackToLoginButton(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAuthIconCircle(Assets.googleIcon, () {}),
              const SizedBox(
                width: 12.0,
              ),
              _buildAuthIconCircle(Assets.appleIcon, () {}),
              const SizedBox(
                width: 12.0,
              ),
              _buildAuthIconCircle(Assets.faceBookIcon, () {})
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 32.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         'Don\'t have an account?',
        //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12,
        //             color: const Color(0xFF111827)),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           print('jffjfjffjddddd');
        //           Navigator.of(context).pushNamed(Routes.registration);
        //         },
        //         child: Text(
        //           ' Signup',
        //           style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //               fontWeight: FontWeight.w400,
        //               fontSize: 16,
        //               color: const Color(0xFF13C49F)),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }

  Widget _buildBackToLoginButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 36.0),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 1.0, right: 2.0),
                  child: const Divider(
                    color: Color(0xFFAAACAE),
                  )),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              "Or Log in with",
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFAAACAE)),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 2.0, right: 1.0),
                  child: Divider(
                    color: Color(0xFFAAACAE),
                  )),
            ),
          ]),
        ]));
  }

  Widget _buildAuthIconCircle(String svgIcon, VoidCallback _callBack) {
    return InkWell(
      onTap: _callBack,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFDFE2E5),
            width: 1.0,
          ),
        ),
        child: Center(
          child: SvgWidget(
            path: svgIcon,
            label: svgIcon,
            percentage: 0.09,
          ),
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
