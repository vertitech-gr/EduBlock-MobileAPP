import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class CurrentUserUseCase implements UseCase<Map<String,dynamic>?, void> {
  final UserRepository _userRepository;

  CurrentUserUseCase(this._userRepository);

  @override
  Future<Map<String,dynamic>?> call({required void params}) async {
    return await _userRepository.currentUser;
  }
}
