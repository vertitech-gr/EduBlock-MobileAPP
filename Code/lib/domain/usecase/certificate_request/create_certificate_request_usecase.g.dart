// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_certificate_request_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCertificateRequestParams _$CreateCertificateRequestParamsFromJson(
        Map<String, dynamic> json) =>
    CreateCertificateRequestParams(
      receiverId: json['receiverId'] as String,
      requestType: json['requestType'] as String,
      status: json['status'] as int,
      remark: json['remark'] as String,
      graduationYear: json['graduationYear'] as String,
    );

Map<String, dynamic> _$CreateCertificateRequestParamsToJson(
        CreateCertificateRequestParams instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'requestType': instance.requestType,
      'status': instance.status,
      'remark': instance.remark,
      'graduationYear': instance.graduationYear,
    };
