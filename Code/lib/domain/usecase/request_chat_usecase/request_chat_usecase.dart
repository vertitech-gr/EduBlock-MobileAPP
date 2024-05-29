import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:edublock/domain/entity/chat_request/request_chat_lists.dart';
import 'package:edublock/domain/entity/outgoing-request/student_request_lists.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:edublock/domain/repository/request_chat_repository/request_chat_respository.dart';
import 'package:json_annotation/json_annotation.dart';


part 'request_chat_usecase.g.dart';



@JsonSerializable()
class RequestChatParams {
  final int page;
  final int pageSize;
  final String guid;

  RequestChatParams({required this.page,required this.pageSize,required this.guid});

  factory RequestChatParams.fromJson(Map<String, dynamic> json) =>
      _$RequestChatParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RequestChatParamsToJson(this);
}

class RequestChatUseCase extends UseCase<RequestChatLists?, RequestChatParams> {

  final RequestChatRepository _requestChatRepository;

  RequestChatUseCase(this._requestChatRepository);

  @override
  Future<RequestChatLists?> call({required RequestChatParams params}) {
    return _requestChatRepository.getRequestChat(params);
  }
}
