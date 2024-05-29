// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPasswordParams _$NewPasswordParamsFromJson(Map<String, dynamic> json) =>
    NewPasswordParams(
      key: json['key'] as String,
      otp: json['otp'] as String,
      NewPassword: json['NewPassword'] as String,
    );

Map<String, dynamic> _$NewPasswordParamsToJson(NewPasswordParams instance) =>
    <String, dynamic>{
      'key': instance.key,
      'otp': instance.otp,
      'NewPassword': instance.NewPassword,
    };
