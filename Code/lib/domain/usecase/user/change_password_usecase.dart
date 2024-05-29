import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_usecase.g.dart';

@JsonSerializable()
class ChangePasswordParams {
  final String existingPassword;
  final String newPassword;

  ChangePasswordParams({required this.existingPassword,required this.newPassword});

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordParamsToJson(this);
}

class ChangePasswordUseCase implements UseCase<ApiResponse?, ChangePasswordParams> {
  final UserRepository _userRepository;

  ChangePasswordUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required ChangePasswordParams params}) async {
    return _userRepository.changePassword(params);
  }
}