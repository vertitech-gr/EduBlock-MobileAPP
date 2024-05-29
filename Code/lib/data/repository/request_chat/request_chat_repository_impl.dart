import 'package:edublock/data/network/apis/request_chat/request_chat_api.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:edublock/domain/entity/chat_request/request_chat_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/request_chat_repository/request_chat_respository.dart';
import 'package:edublock/domain/usecase/request_chat_usecase/request_chat_usecase.dart';
import 'package:edublock/domain/usecase/send_message_usecase/send_message_usecase.dart';
import 'package:http/http.dart';

class RequestChatRepositoryImpl extends RequestChatRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final RequestChatApi _requestChatApi;

  RequestChatRepositoryImpl(
      this._sharedPrefsHelper, this._requestChatApi);


  @override
  Future<RequestChatLists?> getRequestChat(RequestChatParams params) async {
    return await _requestChatApi.getRequestChat(params)
        .catchError((error) => throw error);
  }
  @override
  Future<ApiResponse?> sendMessage(SendMessageParams params) async {
    return await _requestChatApi.sendMessage(params)
        .catchError((error) => throw error);
  }
}


