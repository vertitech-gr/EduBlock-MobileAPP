import 'package:edublock/core/data/network/dio/configs/dio_configs.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/core/data/network/dio/interceptors/auth_interceptor.dart';
import 'package:edublock/core/data/network/dio/interceptors/logging_interceptor.dart';
import 'package:edublock/data/network/apis/certificate_request/certificate_request_api.dart';
import 'package:edublock/data/network/apis/employees/employees_api.dart';
import 'package:edublock/data/network/apis/envelopes/envelopes_api.dart';
import 'package:edublock/data/network/apis/posts/post_api.dart';
import 'package:edublock/data/network/apis/request_chat/request_chat_api.dart';
import 'package:edublock/data/network/apis/user/user_api.dart';
import 'package:edublock/data/network/apis/wallets/wallets_api.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/interceptors/error_interceptor.dart';
import 'package:edublock/data/network/rest_client.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:event_bus/event_bus.dart';

import '../../../di/service_locator.dart';

mixin NetworkModule {
  static Future<void> configureNetworkModuleInjection() async {
    // event bus:---------------------------------------------------------------
    getIt.registerSingleton<EventBus>(EventBus());

    // interceptors:------------------------------------------------------------
    getIt.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
    getIt.registerSingleton<ErrorInterceptor>(ErrorInterceptor(getIt()));
    getIt.registerSingleton<AuthInterceptor>(
      AuthInterceptor(
        accessToken: () async => await getIt<SharedPreferenceHelper>().authToken,
        loginStatus: () async => await getIt<SharedPreferenceHelper>().isLoggedIn,
        sharedPrefHelper:  getIt<SharedPreferenceHelper>(),
      ),
    );

    // rest client:-------------------------------------------------------------
    getIt.registerSingleton(RestClient());

    // dio:---------------------------------------------------------------------
    getIt.registerSingleton<DioConfigs>(
      const DioConfigs(
        baseUrl: Endpoints.baseUrl,
        connectionTimeout: Endpoints.connectionTimeout,
        receiveTimeout:Endpoints.receiveTimeout,
      ),
    );
    getIt.registerSingleton<DioClient>(
      DioClient(dioConfigs: getIt())
        ..addInterceptors(
          [
            getIt<AuthInterceptor>(),
            getIt<ErrorInterceptor>(),
            getIt<LoggingInterceptor>(),
          ],
        ),
    );

    // api's:-------------------------------------------------------------------
    getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
    getIt.registerSingleton(UserApi(getIt<DioClient>(),getIt<RestClient>()));
    getIt.registerSingleton(CertificateRequestApi(getIt<DioClient>(),getIt<RestClient>()));
    getIt.registerSingleton(WalletsApi(getIt<DioClient>(),getIt<RestClient>()));
    getIt.registerSingleton(EmployeesApi(getIt<DioClient>(),getIt<RestClient>()));
    getIt.registerSingleton(EnvelopesApi(getIt<DioClient>(),getIt<RestClient>()));
    getIt.registerSingleton(RequestChatApi(getIt<DioClient>(),getIt<RestClient>()));
  }
}
