
import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';

class UserSaveUseCase implements UseCase<void, Map<String,dynamic>?> {
  final UserRepository _userRepository;

  UserSaveUseCase(this._userRepository);

  @override
  Future<void> call({required Map<String,dynamic>? params}) async {
    return await _userRepository.saveUser(params);
  }
}
