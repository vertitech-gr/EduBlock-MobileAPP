import 'package:edublock/data/network/apis/certificate_request/certificate_request_api.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/entity/certificates/certificat_list.dart';
import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/envelopes/envelope_list.dart';
import 'package:edublock/domain/entity/outgoing-request/student_request_lists.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/entity/university/university_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
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

class CertificateRequestsRepositoryImpl extends CertificateRequestsRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final CertificateRequestApi _certificateRequestApi;

  // constructor
  CertificateRequestsRepositoryImpl(
      this._sharedPrefsHelper, this._certificateRequestApi);

  @override
  Future<CertificateLists> getCertificateLists(
      GetCertificateListParams params) async {
    return await _certificateRequestApi
        .getCertificateLists(params)
        .catchError((error) => throw error);
  }

  @override
  Future<UniversityLists> getUniversityLists(GetUniversityListParams params) async {
    return await _certificateRequestApi
        .getUniversityLists(params)
        .catchError((error) => throw error);
  }

  @override
  Future<ApiResponse?> shareCertificate(ShareCertificateParams params) async {
    return await _certificateRequestApi
        .shareCertificate(params)
        .catchError((error) => throw error);
  }

  @override
  Future<ApiResponse?> shareEnvelope(ShareEnvelopesParams params) async {
    return await _certificateRequestApi
        .shareEnvelope(params)
        .catchError((error) => throw error);
  }

  @override
  Future<ApiResponse?> createCertificateRequest(
      CreateCertificateRequestParams params) async {
    return await _certificateRequestApi
        .createCertificateRequest(params)
        .catchError((error) => throw error);
  }
  @override
  Future<ApiResponse?> employeesRequestDeclined(
      EmployeesRequestDeclinedParams params) async {
    return await _certificateRequestApi
        .employeesRequestDeclined(params)
        .catchError((error) => throw error);
  }

  @override
  Future<DepartmentLists> getDepartmentListsByID(
      GetDepartmentListsByIDParams params) async {
    return await _certificateRequestApi
        .getDepartmentListsByID(params)
        .catchError((error) => throw error);
  }

  @override
  Future<ApiResponse?> certificatePdfLinkByID(
      CertificatePdfLinkByIDParams params) async {
    return await _certificateRequestApi
        .certificatePdfLinkByID(params)
        .catchError((error) => throw error);
  }
  @override
  Future<ApiResponse?> envelopesLinkByID(
      EnvelopesLinkByIDParams params) async {
    return await _certificateRequestApi
        .envelopesLinkByID(params)
        .catchError((error) => throw error);
  }



  @override
  Future<RecievedRequestLists?> getAllRequest(GetAllRequestParams params) async {
    return await _certificateRequestApi
        .getAllRequest(params)
        .catchError((error) => throw error);
  }

  @override
  Future<ApiResponse?> certificateRequestAccess(CertificateRequestAccessParams params) async {
    return await _certificateRequestApi
        .certificateRequestAccess(params)
        .catchError((error) => throw error);
  }
  @override
  Future<ApiResponse?> createEnvelopes(CreateEnvelopesParams params) async {
    return await _certificateRequestApi
        .createEnvelopes(params)
        .catchError((error) => throw error);
  }


  @override
  Future<EnvelopeLists> getEnvelopeLists(GetEnvelopesParams params) async {
    return await _certificateRequestApi
        .getEnvelopeLists(params)
        .catchError((error) => throw error);
  }

  @override
  Future<StudentRequestLists?> studentRequest(StudentRequestParams params) async {
    return await _certificateRequestApi
        .studentRequest(params)
        .catchError((error) => throw error);
  }
}
