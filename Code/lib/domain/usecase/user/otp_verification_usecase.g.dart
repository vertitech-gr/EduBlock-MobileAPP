// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPVerificationParams _$OTPVerificationParamsFromJson(
        Map<String, dynamic> json) =>
    OTPVerificationParams(
      key: json['key'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$OTPVerificationParamsToJson(
        OTPVerificationParams instance) =>
    <String, dynamic>{
      'key': instance.key,
      'otp': instance.otp,
    };
