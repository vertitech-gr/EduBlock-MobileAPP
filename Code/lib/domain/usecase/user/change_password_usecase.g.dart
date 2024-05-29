// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordParams _$ChangePasswordParamsFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordParams(
      existingPassword: json['existingPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordParamsToJson(
        ChangePasswordParams instance) =>
    <String, dynamic>{
      'existingPassword': instance.existingPassword,
      'newPassword': instance.newPassword,
    };
