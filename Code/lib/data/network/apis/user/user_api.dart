import 'dart:async';

import 'package:dio/dio.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/rest_client.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/profile_details_usecase/profile_details_usecase.dart';
import 'package:edublock/domain/usecase/user/change_password_usecase.dart';
import 'package:edublock/domain/usecase/user/forgot_password_usecase.dart';
import 'package:edublock/domain/usecase/user/login_usecase.dart';
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  UserApi(this._dioClient, this._restClient);

  /// Returns list of post in response

  Future<ApiResponse?> login(LoginParams params) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.login, data: params.toJson());

      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        print('check dio error on login ${e.response?.data['message']}');
        throw ApiResponse(success: e.response?.data['success'], message: e.response?.data['message']);
      }
      rethrow;
    }
  }


  Future<ApiResponse?> profileDetails(ProfileDetailsParams params) async {
    try {
      final res =
      await _dioClient.dio.get(Endpoints.profileDetails);
      print('check user details are here ---> ${ApiResponse.fromMap(res.data)}');
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> register(RegisterParams params) async {
    try {
      print(
          'registration params are username:: ${params.name} , userEmail ::: ${params.email} and password ::${params.password}');

      final res = await _dioClient.dio
          .post(Endpoints.registration, data: params.toJson());
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> forgetPassword(ForgotPasswordParams params) async {
    try {
      print('registration params are username:: ${params.email} ');

      final res = await _dioClient.dio
          .post('${Endpoints.forgetPassword}/${params.email}');
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> otpVerification(OTPVerificationParams params) async {
    try {
      final res = await _dioClient.dio
          .post(Endpoints.verifyRegistration, data: params.toJson());
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {

      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> resendOtp(ResendOtpParams params) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.reSendOtp, data: params.toJson());
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> newPassword(NewPasswordParams params) async {
    try {
      print(
          'new password params are otp:: ${params.otp} access key ${params.key} password ${params.NewPassword}');

      final res = await _dioClient.dio
          .post(Endpoints.changePassword, data: params.toJson());

      if (res.data['error'] != null) {
        print('yes i am error throw occurs');
        throw ApiResponse.fromMap(res.data);
      }else{
        print('check response from change password  or new password ${res.data}');

        return ApiResponse.fromMap(res.data);

      }

    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> changePassword(ChangePasswordParams params) async {
    try {
      print(
          'new password params are otp:: ${params.newPassword} access key ${params.existingPassword} ');

      final res = await _dioClient.dio
          .post(Endpoints.changePassword, data: params.toJson());
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//
}
