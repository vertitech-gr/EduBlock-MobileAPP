import 'package:dio/dio.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final AsyncValueGetter<String?> accessToken;
  final AsyncValueGetter<bool?> loginStatus;
  final SharedPreferenceHelper sharedPrefHelper;

  AuthInterceptor({
    required this.accessToken,
    required this.loginStatus,
    required this.sharedPrefHelper,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.isEmpty) {
      options.headers.putIfAbsent('content-type', () => 'application/json');
    }

    final String token = await accessToken() ?? '';
    if (token.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }
    options.contentType =
        Headers.jsonContentType; // Set content type using contentType property
    // options.contentType = Headers.formUrlEncodedContentType; // Set content type using contentType property
    // options.contentType = Headers.textPlainContentType; // Set content type using contentType property
    // options.contentType = Headers.multipartFormDataContentType; // Set content type using contentType property

    // if (options.data is LoginParams) {
    //   options.data = (options.data as LoginParams).toJson();
    // }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    // Handle response data here
    // For example, you can log response data or modify it before passing it back
    print(
        'check respomse status is working ${response.statusCode == 401}   :: ${response}');

    // Check if response contains data
    if (response.data != null) {
      // Modify response data if needed
      // For example, you can convert it to a custom model
    }
    if (response.statusCode == 401) {
      print(
          'check respomse status is working ${response.statusCode == 401}   :: ${response.statusCode}');
      // _helper.isLoggedIn;
      sharedPrefHelper.saveIsLoggedIn(false);

      final prefs = await SharedPreferences.getInstance();

      prefs.clear();
    }
    // Continue handling the response
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    print('Error occurred: ${err.response}');
    // Handle error here, e.g., check for 401 status code
    if (err.response?.statusCode == 401) {
      sharedPrefHelper.saveIsLoggedIn(false);

      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
    }

    handler.next(err);
  }
}
