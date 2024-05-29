import 'dart:async';

import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/usecase/profile_details_usecase/profile_details_usecase.dart';
import 'package:edublock/domain/usecase/user/change_password_usecase.dart';
import 'package:edublock/domain/usecase/user/forgot_password_usecase.dart';
import 'package:edublock/domain/usecase/user/login_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';


abstract class UserRepository {
  Future<ApiResponse?> login(LoginParams params);
  Future<ApiResponse?> register(RegisterParams params);
  Future<ApiResponse?> forgetPassword(ForgotPasswordParams params);
  Future<ApiResponse?> OTPVerification(OTPVerificationParams params);
  Future<ApiResponse?> resendOtp(ResendOtpParams params);
  Future<ApiResponse?> newPassword(NewPasswordParams params);
  Future<ApiResponse?> changePassword(ChangePasswordParams params);
  Future<ApiResponse?> profileDetails(ProfileDetailsParams params);
  Future<void> saveIsLoggedIn(bool value);
  Future<void> saveUser(Map<String,dynamic>? value);
  Future<void> saveAuthToken(String value);
  Future<String?> get authToken;
  Future<bool> get isLoggedIn;
  Future<Map<String,dynamic>?> get currentUser;
  Future<bool> get removeUser;
}
