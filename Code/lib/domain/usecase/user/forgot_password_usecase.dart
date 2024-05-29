import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_usecase.g.dart';

@JsonSerializable()
class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({required this.email});

  factory ForgotPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordParamsToJson(this);
}

class ForgotPasswordUseCase implements UseCase<ApiResponse?, ForgotPasswordParams> {
  final UserRepository _userRepository;

  ForgotPasswordUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required ForgotPasswordParams params}) async {
    return _userRepository.forgetPassword(params);
  }
}