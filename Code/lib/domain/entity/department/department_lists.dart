import 'package:edublock/domain/entity/department/department.dart';

class DepartmentLists {
  final List<Department>? department;

  DepartmentLists({
    this.department,
  });

  factory DepartmentLists.fromJson(List<dynamic> json) {
    List<Department>? department = json.map((university) => Department.fromJson(university)).toList();
    return DepartmentLists(
      department: department,
    );
  }
}


