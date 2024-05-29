import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/rest_client.dart';
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
import 'package:flutter/cupertino.dart';

class CertificateRequestApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  CertificateRequestApi(this._dioClient, this._restClient);

  Future<CertificateLists> getCertificateLists(
      GetCertificateListParams params) async {
    try {
      final res = await _dioClient.dio.get(
          '${Endpoints.getCertificateLists}');
      return CertificateLists.fromJson(res.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<DepartmentLists> getDepartmentListsByID(
      GetDepartmentListsByIDParams params) async {
    try {
      final res = await _dioClient.dio.get(
          '${Endpoints.getDepartmentListByID}${params.id}');
      return DepartmentLists.fromJson(res.data['data']['items']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> certificatePdfLinkByID(
      CertificatePdfLinkByIDParams params) async {
    try {
      final res = await _dioClient.dio.get(
          '${Endpoints.certificatePdfLinkByID}?certificateId=${params.id}');
      return ApiResponse(success: res.data['success'],data:{"pdfLink":res.data['data']},  message: res.data['message']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> envelopesLinkByID(
      EnvelopesLinkByIDParams params) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.envelopesLinkByID, data: params.toJson());


      return ApiResponse(success: res.data['success'],data:{"pdfLink":res.data['data']},  message: res.data['message']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }




  Future<UniversityLists> getUniversityLists(GetUniversityListParams params) async {
    try {
      final res = await _dioClient.dio.get('${Endpoints.getUniversityLists}StudentId=${params.profileId}&Page=1&PageSize=100');
      print('check university data ${res.data['data']['items']}');
      return UniversityLists.fromJson(res.data['data']['items']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }


  Future<ApiResponse?> shareCertificate(ShareCertificateParams params) async {
    try {
      final res =
      await _dioClient.dio.post(Endpoints.shareCertificate, data: params.toJson());
       print('check share certifcate response sucess $res ');
        if(res.data['isSuccess']) {
          return ApiResponse(success: true,  message: res.data['message']);

        }else{
          return ApiResponse(success: true, message: "Share your certificate successfully via email ");

        }

      // if (res.data['data'] == null) {
      //   throw ApiResponse.fromMap(res.data);
      // }
      // return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
  Future<ApiResponse?> shareEnvelope(ShareEnvelopesParams params) async {
    try {
      final res =
      await _dioClient.dio.post(Endpoints.shareEnvelopes, data: params.toJson());
       print('check share envelopes response sucess $res ');
      // if (res.data['data'] == null) {
      //   throw ApiResponse.fromMap(res.data);
      // }
       return ApiResponse.fromMap(res.data);


      // if (res.data['data'] == null) {
      //   throw ApiResponse.fromMap(res.data);
      // }
      // return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
  Future<ApiResponse?> certificateRequestAccess(CertificateRequestAccessParams params) async {
    try {
      final res =
      await _dioClient.dio.post(Endpoints.shareCertificate, data: params.toJson());
       print('check share certificateRequestAccess response sucess $res ');
        if(res.data['isSuccess']) {
          return ApiResponse(success: true,  message: res.data['message']);

        }else{
          return ApiResponse(success: true, message: "Share your certificate successfully via email ");

        }

      // if (res.data['data'] == null) {
      //   throw ApiResponse.fromMap(res.data);
      // }
      // return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> createCertificateRequest(CreateCertificateRequestParams params) async {
    try {
      final res =
      await _dioClient.dio.post(Endpoints.createCertificateRequest, data: params.toJson());
      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      // return ApiResponse(success: true, message: "Share your certificate successfully via email ");
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
  Future<ApiResponse?> employeesRequestDeclined(EmployeesRequestDeclinedParams params) async {
    try {
      final res =
      await _dioClient.dio.patch('${Endpoints.employeesRequestDeclined}/${params.receiverId}');
      print('check response from  employeesRequestDeclined ${res.data}');
      // if (res.data['data'] == null) {
      //   throw ApiResponse.fromMap(res.data);
      // }
      // return ApiResponse(success: true, message: "Share your certificate successfully via email ");
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
  Future<ApiResponse?> createEnvelopes(CreateEnvelopesParams params) async {
    try {
      final res =
      await _dioClient.dio.post(Endpoints.createEnvelopes, data: params.toJson());
      if (!res.data['success']) {
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

  Future<RecievedRequestLists?> getAllRequest(GetAllRequestParams params) async {
    try {
      final res =
      await _dioClient.dio.get('${Endpoints.getAllRequest}?SortOrder=desc&Page=${params.page}&PageSize=${params.pageSize}');

      if (res.data.isEmpty) {
        throw ApiResponse(success: false, message: "List not found.");
      }
      print('check employer  request data ${res.data['data']}');
      return RecievedRequestLists.fromJson(res.data['data']['items']);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data ?? 'Something went wrong.');
      }
      rethrow;
    }
  }


  Future<EnvelopeLists> getEnvelopeLists(GetEnvelopesParams params) async {
    try {
      print('check envelopes params ${params.sortBY}');
      final res = await _dioClient.dio.get('${Endpoints.getAllEnvelopes}/${params.sortBY}/${params.sortByOrder}/1');
      return EnvelopeLists.fromJson(res.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<StudentRequestLists?> studentRequest(StudentRequestParams params) async {
    try {
      final res =
      await _dioClient.dio.get('${Endpoints.getStudentRequest}Page=${params.page}&PageSize=${params.pageSize}&guid=${params.guid}');

      print('check outgoing reuqest data ${res.data['data']['items']}');
      if (res.data.isEmpty) {
        throw ApiResponse(success: false, message: "List not found.");
      }
      return StudentRequestLists.fromJson(res.data['data']['items']);
    } catch (e) {
      if(e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data ?? 'Something went wrong.');
      }
      rethrow;
    }
  }

}
