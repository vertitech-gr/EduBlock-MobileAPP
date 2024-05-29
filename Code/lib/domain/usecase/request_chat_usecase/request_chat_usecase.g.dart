// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_chat_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestChatParams _$RequestChatParamsFromJson(Map<String, dynamic> json) =>
    RequestChatParams(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$RequestChatParamsToJson(RequestChatParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'guid': instance.guid,
    };
