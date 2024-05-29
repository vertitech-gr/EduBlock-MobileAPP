import 'package:edublock/domain/entity/department/department.dart';
import 'package:edublock/domain/entity/outgoing-request/outgoing_request.dart';

class StudentRequestLists {
  final List<StudentRequest>? studentRequest;

  StudentRequestLists({
    this.studentRequest,
  });

  factory StudentRequestLists.fromJson(List<dynamic> json) {
    List<StudentRequest>? studentRequest = json.map((studentRequest) => StudentRequest.fromJson(studentRequest)).toList();
    return StudentRequestLists(
      studentRequest: studentRequest,
    );
  }
}


