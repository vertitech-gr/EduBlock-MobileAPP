import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request_lists.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:json_annotation/json_annotation.dart';


part 'get_all_request_usecase.g.dart';



@JsonSerializable()
class GetAllRequestParams {
  final String receiverId;
  final int page;
  final int pageSize;

  GetAllRequestParams({required this.receiverId,required this.pageSize,required this.page});

  factory GetAllRequestParams.fromJson(Map<String, dynamic> json) =>
      _$GetAllRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllRequestParamsToJson(this);
}

class GetAllRequestUseCase extends UseCase<RecievedRequestLists?, GetAllRequestParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  GetAllRequestUseCase(this._certificateRequestsRepository);

  @override
  Future<RecievedRequestLists?> call({required GetAllRequestParams params}) {
    return _certificateRequestsRepository.getAllRequest(params);
  }
}
