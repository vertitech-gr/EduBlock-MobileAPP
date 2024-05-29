import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class RemoveUserUseCase implements UseCase<bool, void> {
  final UserRepository _userRepository;

  RemoveUserUseCase(this._userRepository);

  @override
  Future<bool> call({required void params}) async {
    return await _userRepository.removeUser;
  }
}
