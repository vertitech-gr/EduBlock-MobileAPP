import 'dart:async';

import 'package:edublock/core/stores/certificate_request_store/certificate_request_access_store/certificate_request_access_store.dart';
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/employees_store/employees_store.dart';
import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/stores/institution_registration_form_store/institution_registration_form_store.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/stores/request_chat_store/request_chat_store.dart';
import 'package:edublock/core/stores/wallets_store/wallets_store.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/repository/setting/setting_repository.dart';
import 'package:edublock/domain/usecase/certificate_request/certifcate_pdf_link_by_id_usecase/certificate_pdf_link_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/certificate_request_access_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_certificate_request_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/create_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/get_envelope_list_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/share_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/employees_request_declined_usecase/employees_request_declined_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/envelopes_link_by_id_usecase/envelopes_link_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_all_request_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_certificate_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_department_list_by_id_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/get_university_list_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/share_certificate_usecase.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';
import 'package:edublock/domain/usecase/envelopes/edit_envelopes_usecase/edit_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/post/get_post_usecase.dart';
import 'package:edublock/domain/usecase/profile_details_usecase/profile_details_usecase.dart';
import 'package:edublock/domain/usecase/request_chat_usecase/request_chat_usecase.dart';
import 'package:edublock/domain/usecase/send_message_usecase/send_message_usecase.dart';
import 'package:edublock/domain/usecase/share/share_envelopes_certificate_usecase.dart';
import 'package:edublock/domain/usecase/student_request/student_request_usecase.dart';
import 'package:edublock/domain/usecase/user/change_password_usecase.dart';
import 'package:edublock/domain/usecase/user/forgot_password_usecase.dart';
import 'package:edublock/domain/usecase/user/get_auth_token_usecase.dart';
import 'package:edublock/domain/usecase/user/get_user_usecase.dart';
import 'package:edublock/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:edublock/domain/usecase/user/login_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/remove_user_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';
import 'package:edublock/domain/usecase/user/save_access_token_usecase.dart';
import 'package:edublock/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:edublock/domain/usecase/user/save_user_usecase.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/language/language_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/presentation/post/store/post_store.dart';


mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    getIt.registerFactory(() => ErrorStore());
    getIt.registerFactory(() => FormErrorStore());
    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );
    getIt.registerFactory(() => InstitutionFormErrorStore());
    getIt.registerFactory(() => CreateEnvelopesErrorStore());
    getIt.registerFactory(() => ProfileErrorStore());
    getIt.registerFactory(() => RequestChatErrorStore());

    getIt.registerFactory(
          () => InstitutionRegistrationFormStore(getIt<InstitutionFormErrorStore>(), getIt<ErrorStore>()),
    );

    // getIt.registerFactory(
    //       () => ProfileStore(getIt<ProfileErrorStore>(), getIt<ErrorStore>()),
    // );


    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
        getIt<IsLoggedInUseCase>(),
        getIt<SaveLoginStatusUseCase>(),

        getIt<LoginUseCase>(),
        getIt<RegisterUseCase>(),
        getIt<FormErrorStore>(),
        getIt<ErrorStore>(),
        getIt<ForgotPasswordUseCase>(),

        getIt<NewPasswordUseCase>(),
        getIt<OTPVerificationUseCase>(),
        getIt<ResendOtpUseCase>(),
        getIt<SaveAccessTokenUseCase>(),
        getIt<ChangePasswordUseCase>(),
        getIt<UserSaveUseCase>(),
        getIt<RemoveUserUseCase>(),
        getIt<CurrentUserUseCase>(),
        getIt<GetAuthTokenUseCase>(),



      ),
    );

    getIt.registerSingleton<CertificateRequestStore>(
      CertificateRequestStore(
        getIt<GetCertificateListsUseCase>(),
        getIt<GetUniversityListsUseCase>(),
        getIt<ShareCertificateUseCase>(),
        getIt<CreateCertificateRequestUseCase>(),
        getIt<GetDepartmentListsByIDUseCase>(),
        getIt<GetAllRequestUseCase>(),
        getIt<CertificatePdfLinkIDUseCase>(),
        getIt<EnvelopesLinkIDUseCase>(),
        getIt<EmployeesRequestDeclinedUseCase>(),
        getIt<StudentRequestUseCase>(),

      ),
    );

    getIt.registerSingleton<CertificateRequestAccessStore>(
        CertificateRequestAccessStore(
        getIt<CertificateRequestAccessUseCase>(),

      ));

    // getIt.registerSingleton<StudentRequestStore>(
    //     StudentRequestStore(
    //       getIt<CertificateRequestAccessUseCase>(),
    //
    //     ));


    getIt.registerSingleton<CreateEnvelopesStore>(
        CreateEnvelopesStore(
          getIt<CreateEnvelopesUseCase>(),
          getIt<GetEnvelopeListsUseCase>(),
          getIt<ShareEnvelopesUseCase>(),
          getIt<EditEnvelopesUseCase>(),
          getIt<ShareEnvelopesCertificateUseCase>(),

            getIt<CreateEnvelopesErrorStore>(), getIt<ErrorStore>()

        ));

    getIt.registerSingleton<ProfileStore>(
        ProfileStore(
            getIt<ProfileDetailsUseCase>(),

            getIt<ProfileErrorStore>(), getIt<ErrorStore>()

        ));
    getIt.registerSingleton<RequestChatStore>(
        RequestChatStore(
            getIt<RequestChatUseCase>(),
            getIt<SendMessageUseCase>(),
            getIt<RequestChatErrorStore>(), getIt<ErrorStore>()



        ));



    getIt.registerSingleton<WalletsStore>(
      WalletsStore(

      ),
    );

    getIt.registerSingleton<EmployeesStore>(
      EmployeesStore(
        getIt<EmployeesDetailsByIDUseCase>(),

      ),
    );




    getIt.registerSingleton<PostStore>(
      PostStore(
        getIt<GetPostUseCase>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<ThemeStore>(
      ThemeStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<LanguageStore>(
      LanguageStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );
  }
}
