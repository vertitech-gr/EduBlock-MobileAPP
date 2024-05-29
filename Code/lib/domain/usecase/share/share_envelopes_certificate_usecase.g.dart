// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_envelopes_certificate_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareEnvelopesCertificateParams _$ShareEnvelopesCertificateParamsFromJson(
        Map<String, dynamic> json) =>
    ShareEnvelopesCertificateParams(
      qr: json['qr'] as bool,
      emailId: json['emailId'] as String,
      type: json['type'] as int,
      resourceId: json['resourceId'] as String?,
      credentials: (json['credentials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requestId: json['requestId'] as String?,
    );

Map<String, dynamic> _$ShareEnvelopesCertificateParamsToJson(
        ShareEnvelopesCertificateParams instance) =>
    <String, dynamic>{
      'emailId': instance.emailId,
      'type': instance.type,
      'resourceId': instance.resourceId,
      'requestId': instance.requestId,
      'credentials': instance.credentials,
      'qr': instance.qr,
    };
