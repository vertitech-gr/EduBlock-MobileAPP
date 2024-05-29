import 'package:dio/dio.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/rest_client.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/envelopes/edit_envelopes_usecase/edit_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/share/share_envelopes_certificate_usecase.dart';

class EnvelopesApi {
  // dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

  // injecting dio instance
  EnvelopesApi(this._dioClient, this._restClient);

  Future<ApiResponse?> editEnvelopes(EditEnvelopesParams params) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.updateEnvelopes,data: params.toJson());
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
  Future<ApiResponse?> shareEnvelopeCertificate(ShareEnvelopesCertificateParams params) async {
    try {
      Map<String, dynamic> finalParams = {
        "emailId": params.emailId,
        "type": params.type,
        "qr":params.qr
      };
      if (params.credentials != null || params.credentials!.length > 0) {
        finalParams.addAll({"credentials": params.credentials,});
      }
      if (params.resourceId != null) {
        finalParams.addAll({"resourceId": params.resourceId,});
      }
      if (params.requestId != null) {
        finalParams.addAll({"requestId": params.requestId,});
      }
      final res = await _dioClient.dio.post(Endpoints.shareEnvelopesCertificate,data: finalParams);
      return ApiResponse(success: res.data['success'], message:res.data['message'],data: {'pdfLink':res.data['data']},error:res.data['error']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
}
