
import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';

class GetAuthTokenUseCase implements UseCase<String?, void> {
  final UserRepository _userRepository;

  GetAuthTokenUseCase(this._userRepository);

  @override
  Future<String?> call({required void params}) async {
    return await _userRepository.authToken;
  }
}
