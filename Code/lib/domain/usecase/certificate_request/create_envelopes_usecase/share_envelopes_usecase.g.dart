// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_envelopes_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareEnvelopesParams _$ShareEnvelopesParamsFromJson(
        Map<String, dynamic> json) =>
    ShareEnvelopesParams(
      envelopID: json['envelopID'] as String,
      email: json['email'] as String,
      credentials: (json['credentials'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ShareEnvelopesParamsToJson(
        ShareEnvelopesParams instance) =>
    <String, dynamic>{
      'envelopID': instance.envelopID,
      'email': instance.email,
      'credentials': instance.credentials,
    };
