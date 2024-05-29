import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:edublock/domain/entity/department/department.dart';

class RequestChatLists {
  final List<RequestChat>? requestChat;

  RequestChatLists({
    this.requestChat,
  });

  factory RequestChatLists.fromJson(List<dynamic> json) {


    List<RequestChat>? requestChat = json.map((item) => RequestChat.fromJson(item)).toList();
    print('cjecl fkfjfkfkf}');

    return RequestChatLists(
      requestChat: requestChat,
    );
  }
}
