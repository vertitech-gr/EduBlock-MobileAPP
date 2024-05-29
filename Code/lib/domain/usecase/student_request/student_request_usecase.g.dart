// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_request_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRequestParams _$StudentRequestParamsFromJson(
        Map<String, dynamic> json) =>
    StudentRequestParams(
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$StudentRequestParamsToJson(
        StudentRequestParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'guid': instance.guid,
    };
