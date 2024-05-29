import 'dart:async';

import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/bottom_sheets/success_bottom_sheet.dart';
import 'package:edublock/core/widgets/otp/otp_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/rounded_button_widget.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/auth/verify_otp/store/verify_otp_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VerifyOTPScreen extends StatefulWidget {
  @override
  _verifyOTPScreenState createState() => _verifyOTPScreenState();
}

class _verifyOTPScreenState extends State<VerifyOTPScreen> {
  TextEditingController _valueController1 = TextEditingController();
  TextEditingController _valueController2 = TextEditingController();
  TextEditingController _valueController3 = TextEditingController();
  TextEditingController _valueController4 = TextEditingController();
  TextEditingController _valueController5 = TextEditingController();
  TextEditingController _valueController6 = TextEditingController();

  late int counter = 30;

  //stores:---------------------------------------------------------------------
  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late Timer _timerNode;

  //stores:---------------------------------------------------------------------
  final _store = VerifyOTPStore();

  @override
  void initState() {
    super.initState();
    _timerNode = Timer.periodic(const Duration(seconds: 2), (timer) {
      counter = counter - 1;
      _store.setCurrentTime(counter);
      if (counter <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _themeStore = Provider.of<ThemeStore>(context);
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
          /*Observer(
            builder: (context) {
              return _store.verifyOTPSuccess
                  ? navigate(context)
                  : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),*/
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isOtpVerifyLoading ||
                    _userStore.isResendOtpLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return const SizedBox.expand(
      child: SvgWidget(
        path: Assets.appleIcon,
        label: 'Assets.appleIcon',
        percentage: 0.09,
      ),
    );
  }

  Widget _buildRightSide() {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: _buildHeadingText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _buildOTPField(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: _buildVerifyOTPButton(),
              ),
              // _buildBackToLoginButton(),
              // _buildFooter()
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
            'OTP Verification',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color(0xfff1c1c1c)),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Please enter the code we just sent to email',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(17, 24, 39, 1)),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPField() {
    return Observer(
      builder: (context) {
        return Otp(
          currentTime: _store.currentTime,
          resendOTP: _resendOTP,
          valueController1: _valueController1,
          valueController2: _valueController2,
          valueController3: _valueController3,
          valueController4: _valueController4,
          handleOTP: _handleOTP,
          valueController5: _valueController5,
          valueController6: _valueController6,
        );
      },
    );
  }

  Future<void> _resendOTP() async {
    try {
        print('check user email for resend api ${_userStore.userEmail}');
      ApiResponse? value = await _userStore.resendOtp(_userStore.userEmail);
      if (value != null) {
        print('check otp resend Otp success value are -----> $value');
        showNotification(context, 'success', 'Success', value!.message);

        // Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (route) => false);
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
  }

  void _handleOTP(value) {
    _store.setOtp(value);
    handleVerifyOTP();
  }

  Future<void> handleVerifyOTP() async {
    if (_store.canVerifyOTP) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _userStore.OTPVerification(
            _userStore.registerAuthToken, _store.otp);
        if (value != null) {
          successBottomSheet(context, 'Registration completed successfully',
              'Go to the Dashboard screen to enter the application','Go to App Dashboard', () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.home, (Route<dynamic> route) => false);
              });




          print('check otp verification success value are -----> $value');
          // showNotification(context, 'sucess', 'Sucess', value!.message);
          //
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(Routes.home, (route) => false);
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
      showNotification(context, 'error', 'Error', 'Enter Six Digit OTP.');
    }
  }

  Widget _buildVerifyOTPButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 20),
      child: RoundedButtonWidget(
        buttonText: 'Submit verification',
        buttonColor: Color.fromRGBO(31, 42, 57, 1),
        textColor: Colors.white,
        onPressed: () async {
          handleVerifyOTP();
        },
      ),
    );
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _store.setOtp('');
    super.dispose();
    _timerNode.cancel();
  }
}
