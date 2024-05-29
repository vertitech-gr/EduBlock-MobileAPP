import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_verification_usecase.g.dart';

@JsonSerializable()
class OTPVerificationParams {
  final String key;
  final String otp;

  OTPVerificationParams({required this.key,required this.otp});

  factory OTPVerificationParams.fromJson(Map<String, dynamic> json) =>
      _$OTPVerificationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$OTPVerificationParamsToJson(this);
}

class OTPVerificationUseCase implements UseCase<ApiResponse?, OTPVerificationParams> {
  final UserRepository _userRepository;

  OTPVerificationUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required OTPVerificationParams params}) async {
    return _userRepository.OTPVerification(params);
  }
}