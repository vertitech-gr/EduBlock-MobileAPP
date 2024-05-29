import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/employees_repository/employees_repository.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
part 'employees_details_by_id_usecase.g.dart';


@JsonSerializable()
class EmployeesDetailsByIDParams {
  final String id;

  EmployeesDetailsByIDParams({required this.id});

  factory EmployeesDetailsByIDParams.fromJson(Map<String, dynamic> json) =>
      _$EmployeesDetailsByIDParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesDetailsByIDParamsToJson(this);
}



class EmployeesDetailsByIDUseCase extends UseCase<Employees?, EmployeesDetailsByIDParams> {

  final EmployeesRepository _employeesRepository;

  EmployeesDetailsByIDUseCase(this._employeesRepository);

  @override
  Future<Employees?> call({required EmployeesDetailsByIDParams params}) {
    return _employeesRepository.employeesDetailsByID(params);
  }
}
