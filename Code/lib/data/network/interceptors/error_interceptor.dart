import 'package:dio/dio.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:event_bus/event_bus.dart';

class ErrorInterceptor extends Interceptor {
  final EventBus _eventBus;

  ErrorInterceptor(this._eventBus);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // if (err.response?.statusCode == 401) {
    //   sharedPrefHelper.saveIsLoggedIn(false);
    // }

    _eventBus.fire(
      ErrorEvent(
        path: err.requestOptions.path,
        response: err.response,
      ),
    );

    print('check error occurs dio  $err');
    super.onError(err, handler);
  }
}

class ErrorEvent {
  final String path;
  final Response? response;

  ErrorEvent({required this.path, this.response});
}
