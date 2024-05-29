import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:edublock/domain/repository/request_chat_repository/request_chat_respository.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';


part 'send_message_usecase.g.dart';



@JsonSerializable()
class SendMessageParams {
  final String senderId;
  final String requestId;
  final String description;
  final int type;
  final dynamic attachment;
  final String token;

  SendMessageParams( {required this.token, required this.senderId,required this.requestId,required this.description,required this.type,required this.attachment});

  factory SendMessageParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageParamsToJson(this);
}

class SendMessageUseCase extends UseCase<ApiResponse?, SendMessageParams> {

  final RequestChatRepository _requestChatRepository;

  SendMessageUseCase(this._requestChatRepository);

  @override
  Future<ApiResponse?> call({required SendMessageParams params}) {
    return _requestChatRepository.sendMessage(params);
  }
}
