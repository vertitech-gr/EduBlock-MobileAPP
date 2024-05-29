import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_password_usecase.g.dart';

@JsonSerializable()
class NewPasswordParams {
  final String key;
  final String otp;
  final String NewPassword;

  NewPasswordParams({required this.key,required this.otp,required this.NewPassword});

  factory NewPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$NewPasswordParamsToJson(this);
}

class NewPasswordUseCase implements UseCase<ApiResponse?, NewPasswordParams> {
  final UserRepository _userRepository;

  NewPasswordUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required NewPasswordParams params}) async {
    return _userRepository.newPassword(params);
  }
}