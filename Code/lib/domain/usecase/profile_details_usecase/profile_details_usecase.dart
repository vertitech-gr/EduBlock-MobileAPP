import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
part 'profile_details_usecase.g.dart';


@JsonSerializable()
class ProfileDetailsParams {
  final String email;

  ProfileDetailsParams({required this.email});

  factory ProfileDetailsParams.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailsParamsToJson(this);
}



class ProfileDetailsUseCase extends UseCase<ApiResponse?, ProfileDetailsParams> {

  final UserRepository _userRepository;

  ProfileDetailsUseCase(this._userRepository);

  @override
  Future<ApiResponse?> call({required ProfileDetailsParams params}) {
    return _userRepository.profileDetails(params);
  }
}
