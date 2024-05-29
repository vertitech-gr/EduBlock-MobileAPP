import 'package:edublock/domain/entity/employees/employees.dart';
import 'package:edublock/domain/usecase/employees/employees_details_by_id_usecase.dart';
import 'package:mobx/mobx.dart';

part 'employees_store.g.dart';

class EmployeesStore = _EmployeesStore with _$EmployeesStore;

abstract class _EmployeesStore with Store {
  _EmployeesStore(this._employeesDetailsByIDUseCase);

  final EmployeesDetailsByIDUseCase _employeesDetailsByIDUseCase;



  @observable
 Employees? employeesDetails;

  static ObservableFuture<Employees?>
  emptyEmployeesDetailsBYIDResponse = ObservableFuture.value(null);


  @observable
  ObservableFuture<Employees?> employeesDetailsByIdFuture =
      emptyEmployeesDetailsBYIDResponse;

  @computed
  bool get isEmployeesByIDDetails => employeesDetailsByIdFuture.status == FutureStatus.pending;






  @action
  Future getProfileDetails(String id) async {
    try {
      final EmployeesDetailsByIDParams employeesDetailsByIDParams =
      EmployeesDetailsByIDParams(id:id);
      final future = _employeesDetailsByIDUseCase.call(params:employeesDetailsByIDParams );
      employeesDetailsByIdFuture = ObservableFuture(future);

      Employees? value = await future;
      if (value!=null) {
        employeesDetails = value;

      }

    } catch (error) {
      // this.success = false;

      rethrow;
    }

  }

}
