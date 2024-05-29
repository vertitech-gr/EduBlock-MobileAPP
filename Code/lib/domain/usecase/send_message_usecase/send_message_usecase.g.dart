// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageParams _$SendMessageParamsFromJson(Map<String, dynamic> json) =>
    SendMessageParams(
      token: json['token'] as String,
      senderId: json['senderId'] as String,
      requestId: json['requestId'] as String,
      description: json['description'] as String,
      type: json['type'] as int,
      attachment: json['attachment'],
    );

Map<String, dynamic> _$SendMessageParamsToJson(SendMessageParams instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'requestId': instance.requestId,
      'description': instance.description,
      'type': instance.type,
      'attachment': instance.attachment,
      'token': instance.token,
    };
