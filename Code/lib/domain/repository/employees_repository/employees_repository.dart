import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';

abstract class EmployeesRepository {


  Future<Employees?> employeesDetailsByID(EmployeesDetailsByIDParams params);


}