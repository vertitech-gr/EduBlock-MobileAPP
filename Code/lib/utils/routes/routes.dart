import 'package:edublock/core/widgets/certificate/certificate.dart';
import 'package:edublock/core/widgets/envelopes/create_envelope_form.dart';
import 'package:edublock/core/widgets/envelopes/edit_envelopes/envelopes_edit_screen.dart';
import 'package:edublock/core/widgets/multiple_form_steppper/multiple_form_stepper.dart';
import 'package:edublock/core/widgets/requests/candidates_process/candidate_details_screen.dart';
import 'package:edublock/core/widgets/requests/institutional_process/institutinal_info_screen/insitutional_info_screen.dart';
import 'package:edublock/core/widgets/share_certificate/certificate_view_cost.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/presentation/auth/change_password/change_password.dart';
import 'package:edublock/presentation/auth/forget_password/forget_password.dart';
import 'package:edublock/presentation/auth/login/login.dart';
import 'package:edublock/presentation/auth/registration/registration.dart';
import 'package:edublock/presentation/auth/set_new_password/set_new_password.dart';
import 'package:edublock/presentation/auth/verify_otp/verify_otp.dart';
import 'package:edublock/presentation/home/home.dart';
import 'package:edublock/presentation/screens/all_certificate/all_certificate.dart';
import 'package:edublock/presentation/screens/all_envelopes/all_envelopes_screen.dart';
import 'package:edublock/presentation/screens/create_envelopes/create_envelopes.dart';
import 'package:edublock/presentation/screens/profile_screen/profile_screen.dart';
import 'package:edublock/presentation/screens/requests/request_screen_widget.dart';
import 'package:edublock/presentation/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/post';
  static const String registration = '/registration';
  static const String forgetPassword = '/forgetPassword';
  static const String setNewPassword = '/setNewPassword';
  static const String otpVerify = '/otpVerify';
  static const String createEvelopesScreen = '/createEvelopesScreen';
  static const String cretificateRequestScreen = '/cretificateRequestScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String allCertificateScreen = '/allCertificateScreen';
  static const String allEnvelopesScreen = '/allEnvelopesScreen';
  static const String profileScreen = '/profileScreen';
  static const String candidateDetailScreen = '/candidateDetailScreen';
  static const String insitutionalDetailScreen = '/insitutionalDetailScreen';
  static const String multipleFormStepperScreen = '/multipleFormStepperScreen';
  static const String certificateScreen = '/certificateScreen';
  static const String createEnvelopeFormScreen = '/createEnvelopeFormScreen';
  static const String shareCertificateScreen = '/shareCertificateScreen';
  static const String certificateViewCostScreen = '/certificateViewCostScreen';
  static const String envelopesEditScreen = '/envelopesEditScreen';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    forgetPassword: (BuildContext context) => ForgetPasswordScreen(),
    registration: (BuildContext context) => RegistrationScreen(),
    setNewPassword: (BuildContext context) => SetNewPasswordScreen(),
    otpVerify: (BuildContext context) => VerifyOTPScreen(),
    splash: (BuildContext context) => SplashScreen(),
    createEvelopesScreen: (BuildContext context) => CreateEvelopesScreen(),
    cretificateRequestScreen: (BuildContext context) => RequestWidgetScreen(),
    changePasswordScreen: (BuildContext context) => ChangePasswordScreen(),
    allCertificateScreen: (BuildContext context) => AllCertificateScreen(),
    profileScreen: (BuildContext context) => ProfileScreen(),
    allEnvelopesScreen: (BuildContext context) => AllEnvelopesScreen(),
    candidateDetailScreen: (BuildContext context) => CandidateDetailScreen(),
    insitutionalDetailScreen: (BuildContext context) => InsitutionalDetailScreen(),
    multipleFormStepperScreen: (BuildContext context) => MultipleFormStepperScreen(),
    // certificateScreen: (BuildContext context) => CertificateScreen(),
    createEnvelopeFormScreen: (BuildContext context) => CreateEnvelopeFormScreen(),
    shareCertificateScreen: (BuildContext context) => ShareCertificateScreen(),
    certificateViewCostScreen: (BuildContext context) => CertificateViewCostScreen(),
  };
}
