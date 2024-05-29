import 'package:edublock/di/service_locator.dart';
import 'package:edublock/flavors/main_common.dart';

class Endpoints {
  Endpoints._();
  // base url
  static const String baseUrl = 'https://api.edu-block.org';

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 45000;

  //  endpoints
  static const String getPosts = "$baseUrl/posts";
  static const String registration = "$baseUrl/api/auth/register";
  static const String verifyRegistration = "$baseUrl/api/auth/verify-registration";
  static const String login = "$baseUrl/api/auth/login";
  static const String profileDetails ="$baseUrl/api/auth/details";
  static const String forgetPassword = "$baseUrl/api/auth/forget-password";
  static const String reSendOtp = "$baseUrl/api/auth/resend-otp";
  static const String changePassword = "$baseUrl/api/auth/change-password";
  static const String getCertificateLists = "$baseUrl/api/dock/get-certificate";
  static const String getDepartmentListByID = "$baseUrl/api/department/get-department-by-university-id?Page=1&PageSize=10&guid=";
  static const String certificatePdfLinkByID = "$baseUrl/api/dock/get-certificate-url";
  static const String envelopesLinkByID = "$baseUrl/api/envelopes/share-envelope-url";
  static const String getUniversityLists = "$baseUrl/api/universities/get-universities-by-student?";
  static const String shareCertificate = "$baseUrl/api/dock/share";
  static const String shareEnvelopes = "$baseUrl/api/envelopes/share-envelope";
  static const String createCertificateRequest = "$baseUrl/api/user-requests/create";
  static const String createEnvelopes = "$baseUrl/api/envelopes/create";
  static const String getAllRequest = "$baseUrl/api/received-request";
  static const String getStudentRequest = "$baseUrl/api/user-requests/outgoing-request?";
  static const String getAllEnvelopes = "$baseUrl/api/envelopes/get-envelope-by-order";
  static const String employeesDetailsByID = "$baseUrl/api/employer/profile";
  static const String employeesRequestDeclined = "$baseUrl/api/reject";
  static const String updateEnvelopes = "$baseUrl/api/envelopes/update-group";
  static const String getRequestChat = "$baseUrl/api/user-requests/get-request-message?";
  static const String sendMessage = "$baseUrl/api/user-requests/create-request-message";
  static const String shareEnvelopesCertificate = "$baseUrl/api/share/create";
}
