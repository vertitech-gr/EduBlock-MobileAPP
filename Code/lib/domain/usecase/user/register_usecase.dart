
import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_usecase.g.dart';

@JsonSerializable()
class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams( {required this.name,required this.email, required this.password});

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

class RegisterUseCase implements UseCase<ApiResponse?, RegisterParams> {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required RegisterParams params}) async {
    return _userRepository.register(params);
  }
}
