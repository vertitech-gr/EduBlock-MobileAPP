import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'get_department_list_by_id_usecase.g.dart';


@JsonSerializable()
  class GetDepartmentListsByIDParams {
  final String id;

  GetDepartmentListsByIDParams({required this.id});

  factory GetDepartmentListsByIDParams.fromJson(Map<String, dynamic> json) =>
  _$GetDepartmentListsByIDParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetDepartmentListsByIDParamsToJson(this);
}



class GetDepartmentListsByIDUseCase extends UseCase<DepartmentLists, GetDepartmentListsByIDParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  GetDepartmentListsByIDUseCase(this._certificateRequestsRepository);

  @override
  Future<DepartmentLists> call({required GetDepartmentListsByIDParams params}) {
    return _certificateRequestsRepository.getDepartmentListsByID(params);
  }
}
