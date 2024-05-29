// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_request_access_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateRequestAccessParams _$CertificateRequestAccessParamsFromJson(
        Map<String, dynamic> json) =>
    CertificateRequestAccessParams(
      name: json['name'] as String,
      credentials:
          (json['credentials'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$CertificateRequestAccessParamsToJson(
        CertificateRequestAccessParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'credentials': instance.credentials,
    };
