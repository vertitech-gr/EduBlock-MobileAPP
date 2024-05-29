import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_usecase.g.dart';

@JsonSerializable()
class ResendOtpParams {
  final String email;

  ResendOtpParams({required this.email});

  factory ResendOtpParams.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpParamsToJson(this);
}

class ResendOtpUseCase implements UseCase<ApiResponse?, ResendOtpParams> {
  final UserRepository _userRepository;

  ResendOtpUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required ResendOtpParams params}) async {
    return _userRepository.resendOtp(params);
  }
}