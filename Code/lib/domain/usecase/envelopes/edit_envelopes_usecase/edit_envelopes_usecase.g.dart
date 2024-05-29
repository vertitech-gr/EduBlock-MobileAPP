// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_envelopes_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditEnvelopesParams _$EditEnvelopesParamsFromJson(Map<String, dynamic> json) =>
    EditEnvelopesParams(
      envelopeId: json['envelopeId'] as String,
      Credentials: (json['Credentials'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EditEnvelopesParamsToJson(
        EditEnvelopesParams instance) =>
    <String, dynamic>{
      'envelopeId': instance.envelopeId,
      'Credentials': instance.Credentials,
    };
