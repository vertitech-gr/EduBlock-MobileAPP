import 'package:edublock/domain/entity/certificates/certificat_list.dart';

import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/envelopes/envelope_list.dart';
import 'package:edublock/domain/entity/outgoing-request/student_request_lists.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/entity/university/university_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
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
import 'package:edublock/domain/usecase/student_request/student_request_usecase.dart';

abstract class CertificateRequestsRepository {
  Future<CertificateLists> getCertificateLists(GetCertificateListParams params);
  Future<DepartmentLists> getDepartmentListsByID(GetDepartmentListsByIDParams params);
  Future<ApiResponse?> certificatePdfLinkByID(CertificatePdfLinkByIDParams params);
  Future<ApiResponse?> envelopesLinkByID(EnvelopesLinkByIDParams params);
  Future<UniversityLists> getUniversityLists(GetUniversityListParams params);
  Future<ApiResponse?> shareCertificate(ShareCertificateParams params);
  Future<ApiResponse?> shareEnvelope(ShareEnvelopesParams params);
  Future<ApiResponse?> employeesRequestDeclined(EmployeesRequestDeclinedParams params);
  Future<ApiResponse?> createCertificateRequest(CreateCertificateRequestParams params);
  Future<ApiResponse?> certificateRequestAccess(CertificateRequestAccessParams params);
  Future<ApiResponse?> createEnvelopes(CreateEnvelopesParams params);
  Future<RecievedRequestLists?> getAllRequest(GetAllRequestParams params);
  Future<StudentRequestLists?> studentRequest(StudentRequestParams params);
  Future<EnvelopeLists> getEnvelopeLists(GetEnvelopesParams params);


}