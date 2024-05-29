// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_request_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllRequestParams _$GetAllRequestParamsFromJson(Map<String, dynamic> json) =>
    GetAllRequestParams(
      receiverId: json['receiverId'] as String,
      pageSize: json['pageSize'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$GetAllRequestParamsToJson(
        GetAllRequestParams instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
