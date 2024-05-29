import 'dart:async';

import 'package:edublock/data/local/datasources/post/post_datasource.dart';
import 'package:edublock/data/network/apis/certificate_request/certificate_request_api.dart';
import 'package:edublock/data/network/apis/employees/employees_api.dart';
import 'package:edublock/data/network/apis/envelopes/envelopes_api.dart';
import 'package:edublock/data/network/apis/posts/post_api.dart';
import 'package:edublock/data/network/apis/request_chat/request_chat_api.dart';
import 'package:edublock/data/network/apis/user/user_api.dart';
import 'package:edublock/data/network/apis/wallets/wallets_api.dart';
import 'package:edublock/data/repository/certificate_request/certificate_request_repository_impl.dart';
import 'package:edublock/data/repository/employees/employees_repository_impl.dart';
import 'package:edublock/data/repository/envelopes/envelopes_repository_impl.dart';
import 'package:edublock/data/repository/post/post_repository_impl.dart';
import 'package:edublock/data/repository/request_chat/request_chat_repository_impl.dart';
import 'package:edublock/data/repository/setting/setting_repository_impl.dart';
import 'package:edublock/data/repository/user/user_repository_impl.dart';
import 'package:edublock/data/repository/wallets/wallets_repository_impl.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:edublock/domain/repository/employees_repository/employees_repository.dart';
import 'package:edublock/domain/repository/envelopes_repository/envelopes_repositroy.dart';
import 'package:edublock/domain/repository/post/post_repository.dart';
import 'package:edublock/domain/repository/request_chat_repository/request_chat_respository.dart';
import 'package:edublock/domain/repository/setting/setting_repository.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:edublock/domain/repository/wallets_repository/wallets_repository.dart';


mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));


    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<UserApi>(),
    ));

    getIt.registerSingleton<PostRepository>(PostRepositoryImpl(
      getIt<PostApi>(),
      getIt<PostDataSource>(),

    ));

    getIt.registerSingleton<CertificateRequestsRepository>(CertificateRequestsRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<CertificateRequestApi>(),
    ));

    getIt.registerSingleton<RequestChatRepository>(RequestChatRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<RequestChatApi>(),
    ));

    getIt.registerSingleton<WalletsRepository>(WalletsRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<WalletsApi>(),
    ));

    getIt.registerSingleton<EmployeesRepository>(EmployeesRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<EmployeesApi>(),
    ));
getIt.registerSingleton<EnvelopesRepository>(EnvelopesRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<EnvelopesApi>(),
    ));
  }

}
