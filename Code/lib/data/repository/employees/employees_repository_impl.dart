import 'package:edublock/data/network/apis/employees/employees_api.dart';
import 'package:edublock/data/network/apis/wallets/wallets_api.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/repository/employees_repository/employees_repository.dart';
import 'package:edublock/domain/repository/wallets_repository/wallets_repository.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';

class EmployeesRepositoryImpl extends EmployeesRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final EmployeesApi _employeesApi;

  // constructor
  EmployeesRepositoryImpl(this._sharedPrefsHelper, this._employeesApi);

  @override
  Future<Employees?> employeesDetailsByID(
      EmployeesDetailsByIDParams params) async {
    return await _employeesApi
        .employeesDetailsByID(params)
        .catchError((error) => throw error);
  }

}