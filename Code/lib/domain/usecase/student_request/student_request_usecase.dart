import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/outgoing-request/student_request_lists.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:json_annotation/json_annotation.dart';


part 'student_request_usecase.g.dart';



@JsonSerializable()
class StudentRequestParams {
  final int page;
  final int pageSize;
  final String guid;

  StudentRequestParams({required this.page,required this.pageSize,required this.guid});

  factory StudentRequestParams.fromJson(Map<String, dynamic> json) =>
      _$StudentRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$StudentRequestParamsToJson(this);
}

class StudentRequestUseCase extends UseCase<StudentRequestLists?, StudentRequestParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  StudentRequestUseCase(this._certificateRequestsRepository);

  @override
  Future<StudentRequestLists?> call({required StudentRequestParams params}) {
    return _certificateRequestsRepository.studentRequest(params);
  }
}
