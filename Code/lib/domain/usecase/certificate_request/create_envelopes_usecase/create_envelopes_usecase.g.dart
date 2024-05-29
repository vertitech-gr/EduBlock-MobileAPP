// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_envelopes_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEnvelopesParams _$CreateEnvelopesParamsFromJson(
        Map<String, dynamic> json) =>
    CreateEnvelopesParams(
      name: json['name'] as String,
      credentials: (json['credentials'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateEnvelopesParamsToJson(
        CreateEnvelopesParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'credentials': instance.credentials,
    };
