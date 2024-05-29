


import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';

class SaveAccessTokenUseCase implements UseCase<void, String> {
  final UserRepository _userRepository;

  SaveAccessTokenUseCase(this._userRepository);

  @override
  Future<void> call({required String params}) async {
    return _userRepository.saveAuthToken(params);
  }
}