import 'dart:async';

import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:edublock/domain/repository/employees_repository/employees_repository.dart';
import 'package:edublock/domain/repository/envelopes_repository/envelopes_repositroy.dart';
import 'package:edublock/domain/repository/post/post_repository.dart';
import 'package:edublock/domain/repository/request_chat_repository/request_chat_respository.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
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
import 'package:edublock/domain/usecase/post/delete_post_usecase.dart';
import 'package:edublock/domain/usecase/post/find_post_by_id_usecase.dart';
import 'package:edublock/domain/usecase/post/get_post_usecase.dart';
import 'package:edublock/domain/usecase/post/insert_post_usecase.dart';
import 'package:edublock/domain/usecase/post/udpate_post_usecase.dart';
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
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/remove_user_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';
import 'package:edublock/domain/usecase/user/save_access_token_usecase.dart';
import 'package:edublock/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:edublock/domain/usecase/user/save_user_usecase.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    getIt.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveAccessTokenUseCase>(
      SaveAccessTokenUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<RegisterUseCase>(
      RegisterUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<ForgotPasswordUseCase>(
      ForgotPasswordUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<OTPVerificationUseCase>(
      OTPVerificationUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<ResendOtpUseCase>(
      ResendOtpUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<NewPasswordUseCase>(
      NewPasswordUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<ChangePasswordUseCase>(
      ChangePasswordUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<UserSaveUseCase>(
      UserSaveUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<RemoveUserUseCase>(
      RemoveUserUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<CurrentUserUseCase>(
      CurrentUserUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<GetAuthTokenUseCase>(
      GetAuthTokenUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetCertificateListsUseCase>(
      GetCertificateListsUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<StudentRequestUseCase>(
      StudentRequestUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<GetUniversityListsUseCase>(
      GetUniversityListsUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<CreateCertificateRequestUseCase>(
      CreateCertificateRequestUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<ShareCertificateUseCase>(
      ShareCertificateUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<GetDepartmentListsByIDUseCase>(
      GetDepartmentListsByIDUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<GetAllRequestUseCase>(
      GetAllRequestUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<EmployeesRequestDeclinedUseCase>(
      EmployeesRequestDeclinedUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<CertificateRequestAccessUseCase>(
      CertificateRequestAccessUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<CreateEnvelopesUseCase>(
      CreateEnvelopesUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<EditEnvelopesUseCase>(
      EditEnvelopesUseCase(getIt<EnvelopesRepository>()),
    );
    getIt.registerSingleton<ShareEnvelopesCertificateUseCase>(
      ShareEnvelopesCertificateUseCase(getIt<EnvelopesRepository>()),
    );

    getIt.registerSingleton<GetEnvelopeListsUseCase>(
      GetEnvelopeListsUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<EnvelopesLinkIDUseCase>(
      EnvelopesLinkIDUseCase(getIt<CertificateRequestsRepository>()),
    );

    getIt.registerSingleton<ShareEnvelopesUseCase>(
      ShareEnvelopesUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<CertificatePdfLinkIDUseCase>(
      CertificatePdfLinkIDUseCase(getIt<CertificateRequestsRepository>()),
    );
    getIt.registerSingleton<ProfileDetailsUseCase>(
      ProfileDetailsUseCase(getIt<UserRepository>()),
    );


    // employees :------------------------------------------------
    getIt.registerSingleton<EmployeesDetailsByIDUseCase>(
      EmployeesDetailsByIDUseCase(getIt<EmployeesRepository>()),
    );


    getIt.registerSingleton<RequestChatUseCase>(
      RequestChatUseCase(getIt<RequestChatRepository>()),
    );

    getIt.registerSingleton<SendMessageUseCase>(
      SendMessageUseCase(getIt<RequestChatRepository>()),
    );

    // employees end :-------------------------------------------------------
    // post:--------------------------------------------------------------------
    getIt.registerSingleton<GetPostUseCase>(
      GetPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<FindPostByIdUseCase>(
      FindPostByIdUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<InsertPostUseCase>(
      InsertPostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<UpdatePostUseCase>(
      UpdatePostUseCase(getIt<PostRepository>()),
    );
    getIt.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(getIt<PostRepository>()),
    );
  }
}
