import 'package:dio/dio.dart';
import 'package:edublock/core/data/network/dio/dio_client.dart';
import 'package:edublock/data/network/constants/endpoints.dart';
import 'package:edublock/data/network/rest_client.dart';
import 'package:edublock/domain/entity/chat_request/request_chat_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/request_chat_usecase/request_chat_usecase.dart';
import 'package:edublock/domain/usecase/send_message_usecase/send_message_usecase.dart';

class RequestChatApi {
// dio instance
  final DioClient _dioClient;
  final RestClient _restClient;

// injecting dio instance
  RequestChatApi(this._dioClient, this._restClient);

  Future<RequestChatLists?> getRequestChat(RequestChatParams params) async {
    try {
      final res = await _dioClient.dio.get(
          '${Endpoints.getRequestChat}Page=${params.page}&PageSize=${params.pageSize}&guid=${params.guid}');
      // &guid=${params.guid}

      // print('check user chat details ${RequestChatLists.fromJson(res.data['data'])}');

      return RequestChatLists.fromJson(res.data['data']);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }

  Future<ApiResponse?> sendMessage(SendMessageParams params) async {

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${params.token}',
    };
    // FormData formData = FormData.fromMap({
    //   "login": login,
    //   "file":
    //   MultipartFile.fromBytes(selectedFileContent, filename: "avatar.jpg"),
    // });

    FormData formData = FormData.fromMap({
      "senderId": params.senderId,
      "requestId": params.requestId,
      "description": params.description,
      "type": params.type,
      "attachment": params.attachment,

    });

    try {
      final Response res = await _dioClient.dio.post(Endpoints.sendMessage,
          data: formData, options: Options(headers: headers));

      if (res.data['data'] == null) {
        throw ApiResponse.fromMap(res.data);
      }
      return ApiResponse.fromMap(res.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiResponse(success: false, message: e.response?.data);
      }
      rethrow;
    }
  }
}
