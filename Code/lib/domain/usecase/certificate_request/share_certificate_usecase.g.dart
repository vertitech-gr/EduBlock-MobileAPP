// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_certificate_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareCertificateParams _$ShareCertificateParamsFromJson(
        Map<String, dynamic> json) =>
    ShareCertificateParams(
      email: json['email'] as String,
      certificateId: json['certificateId'] as String,
    );

Map<String, dynamic> _$ShareCertificateParamsToJson(
        ShareCertificateParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'certificateId': instance.certificateId,
    };
