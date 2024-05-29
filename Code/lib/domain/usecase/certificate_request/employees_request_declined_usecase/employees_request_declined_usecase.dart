import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:json_annotation/json_annotation.dart';


part 'employees_request_declined_usecase.g.dart';



@JsonSerializable()
class EmployeesRequestDeclinedParams {
  final String receiverId;

  EmployeesRequestDeclinedParams({required this.receiverId});

  factory EmployeesRequestDeclinedParams.fromJson(Map<String, dynamic> json) =>
      _$EmployeesRequestDeclinedParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesRequestDeclinedParamsToJson(this);
}

class EmployeesRequestDeclinedUseCase extends UseCase<ApiResponse?, EmployeesRequestDeclinedParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  EmployeesRequestDeclinedUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required EmployeesRequestDeclinedParams params}) {
    return _certificateRequestsRepository.employeesRequestDeclined(params);
  }
}
