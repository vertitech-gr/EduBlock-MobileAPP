import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:edublock/domain/entity/chat_request/request_chat_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/request_chat_usecase/request_chat_usecase.dart';
import 'package:edublock/domain/usecase/send_message_usecase/send_message_usecase.dart';
import 'package:http/http.dart';

abstract class RequestChatRepository {

  Future<RequestChatLists?> getRequestChat(RequestChatParams params);
  Future<ApiResponse?> sendMessage(SendMessageParams params);

}