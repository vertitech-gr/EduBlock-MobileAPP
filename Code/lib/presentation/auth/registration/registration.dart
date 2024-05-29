import 'package:another_flushbar/flushbar_helper.dart';
import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/form/form_store.dart';
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

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userFullName = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _userFullNameFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _userEmailFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _userEmailFocusNode = FocusNode();
    _userFullNameFocusNode = FocusNode();
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
                visible: _userStore.isRegisterLoading,
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
              // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
              _buildHeadingText(),
              SizedBox(height: 24.0),

              _buildUserFullNameField(),
              SizedBox(height: 12.0),
              _buildUserIdField(),
              SizedBox(height: 12.0),
              _buildPasswordField(),
              // _buildForgotPasswordButton(),
              SizedBox(height: 18.0),

              _buildTermAndCondition(),
              _buildSignInButton(),

              _buildtwoFAWidget(),
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
            'Create an account',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color(0xfff1c1c1c)),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Your certificates, your control – experience it on our blockchain app',
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
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          hint: AppLocalizations.of(context).translate('login_et_user_email'),
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          focusNode: _userEmailFocusNode,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
            _userStore.setUserEmailID(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: 'Email Address' '',
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }

  Widget _buildUserFullNameField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('login_et_user_name'),
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userFullName,
          inputAction: TextInputAction.next,
          autoFocus: true,
          onChanged: (value) {
            print('check userfull name $value');
            _formStore.setUserFullName(_userFullName.text);
            print('check error are ${_formStore.formErrorStore.userFullName}');
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_userEmailFocusNode);
          },
          errorText: _formStore.formErrorStore.userFullName,
          isSuffixIcon: false,
          labelText: 'Name',
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
          onFieldSubmitted: (value) => handleRegistration(),
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


  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 28.0),
      child: RoundedButtonWidget(
        buttonText: AppLocalizations.of(context)
            .translate('registration_btn_registration'),
        buttonColor: Color.fromRGBO(19, 196, 159, 1),
        textColor: Colors.white,
        onPressed: handleRegistration

      ),
    );
  }
  Future<void> handleRegistration() async {
     print('check user email form registration --->${_formStore.userEmail}');

    if (_formStore.canRegister) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _userStore.register(
            _userFullName.text ,_passwordController.text.trim(),_userEmailController.text);
        if(value != null){
          print('check registration success value are -----> $value');
          showNotification(context, 'success', 'Success', value!.message);

          Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);

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
      showNotification(
          context, 'error', 'Error', 'Please fill in all fields.');

    }
  }





  Widget _buildtwoFAWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildBackToLoginButton(),
        Row(
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color(0xFF111827)),
              ),
              InkWell(
                onTap: () {
                  print('jffjfjffjddddd');

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => RegistrationScreen(),
                  // ),
                  // );
                  Navigator.of(context).pushNamed(Routes.login);
                },
                child: Text(
                  ' Sign in',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF13C49F)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTermAndCondition() {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          _formStore.handleRegsTermConditon();
        },
        child: Row(
          children: [
            SizedBox(
                height: 6,
                width: 24,
                child: Checkbox(
                  activeColor: const Color.fromRGBO(19, 196, 159, 1),
                  checkColor: const Color(0xFFFFFFFF),
                  value: _formStore.isRegistrationTermCondition,
                  onChanged: (bool? value) {
                    setState(() {
                      print('check user click vlue $value');
                      _formStore.handleRegsTermConditon();
                    });
                  },

                  visualDensity: VisualDensity.compact,
                  // Make the checkbox smaller
                  side:
                      const BorderSide(color: Color.fromRGBO(19, 196, 159, 1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                        color: Color.fromRGBO(19, 196, 159, 1)),
                  ),
                )),
            const SizedBox(
              width: 2.0,
            ),
            Text(
              'Agree with',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: const Color(0xfff1c1c1c)),
            ),
            const SizedBox(
              width: 2.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: Color(0xFF13C49F),
                ))),
                child: Text(
                  'Term & Condition',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff13C49F),
                      ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBackToLoginButton() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
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

  // Widget navigate(BuildContext context) {
  //   SharedPreferences.getInstance().then((prefs) {
  //     prefs.setBool(Preferences.is_logged_in, true);
  //   });
  //
  //   Future.delayed(Duration(milliseconds: 0), () {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //         Routes.home, (Route<dynamic> route) => false);
  //   });
  //
  //   return Container();
  // }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _userEmailFocusNode.dispose();
    _userFullName.dispose();
    _userFullNameFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          ).show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
}
