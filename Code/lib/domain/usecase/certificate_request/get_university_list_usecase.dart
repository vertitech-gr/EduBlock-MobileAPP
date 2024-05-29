
import 'package:edublock/domain/entity/university/university_lists.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';

import 'package:json_annotation/json_annotation.dart';



part 'get_university_list_usecase.g.dart';



@JsonSerializable()
class GetUniversityListParams {
  final String profileId;

  GetUniversityListParams({required this.profileId});

  factory GetUniversityListParams.fromJson(Map<String, dynamic> json) =>
      _$GetUniversityListParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetUniversityListParamsToJson(this);
}






class GetUniversityListsUseCase extends UseCase<UniversityLists, GetUniversityListParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  GetUniversityListsUseCase(this._certificateRequestsRepository);

  @override
  Future<UniversityLists> call({required params}) {
    return _certificateRequestsRepository.getUniversityLists(params);
  }
}
