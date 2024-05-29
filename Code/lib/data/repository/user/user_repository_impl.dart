import 'dart:async';

import 'package:edublock/data/network/apis/user/user_api.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/usecase/profile_details_usecase/profile_details_usecase.dart';
import 'package:edublock/domain/usecase/user/change_password_usecase.dart';
import 'package:edublock/domain/usecase/user/forgot_password_usecase.dart';
import 'package:edublock/domain/usecase/user/login_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';


class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final UserApi _userApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper, this._userApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<ApiResponse?> login(LoginParams params) async {
    return await _userApi.login(params);
  }

  // Register:---------------------------------------------------------------------
  @override
  Future<ApiResponse?> register(RegisterParams params) async {
    return await _userApi.register(params);
  }

  @override
  Future<ApiResponse?> forgetPassword(ForgotPasswordParams params) async {
    return await _userApi.forgetPassword(params);
  }

  @override
  Future<ApiResponse?> OTPVerification(OTPVerificationParams params) async {
    return await _userApi.otpVerification(params);
  }

  @override
  Future<ApiResponse?> profileDetails(ProfileDetailsParams params) async {
    return await _userApi.profileDetails(params);
  }

  @override
  Future<ApiResponse?> resendOtp(ResendOtpParams params) async {
    return await _userApi.resendOtp(params);
  }

  @override
  Future<ApiResponse?>newPassword(NewPasswordParams params) async {
    return await _userApi.newPassword(params);
  }
  @override
  Future<ApiResponse?>changePassword(ChangePasswordParams params) async {
    return await _userApi.changePassword(params);
  }


  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
 @override
  Future<bool> get removeUser => _sharedPrefsHelper.removeUser();


  @override
  Future<String?> get authToken => _sharedPrefsHelper.authToken;

  @override
  Future<Map<String,dynamic>?> get currentUser => _sharedPrefsHelper.currentUser;


  @override
  Future<void> saveAuthToken(String value) =>
      _sharedPrefsHelper.saveAuthToken(value);


  @override
  Future<void> saveUser(Map<String, dynamic>? value) =>
      _sharedPrefsHelper.saveUser(value);


}