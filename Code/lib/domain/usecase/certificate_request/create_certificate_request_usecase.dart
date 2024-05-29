import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'create_certificate_request_usecase.g.dart';


@JsonSerializable()
class CreateCertificateRequestParams {
  final String receiverId;
  final String requestType;
  final int status;
  final String remark;
  final String graduationYear;

  CreateCertificateRequestParams({required this.receiverId,required this.requestType,required this.status,required this.remark,required this.graduationYear});

  factory CreateCertificateRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CreateCertificateRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCertificateRequestParamsToJson(this);
}



class CreateCertificateRequestUseCase extends UseCase<ApiResponse?, CreateCertificateRequestParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  CreateCertificateRequestUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required CreateCertificateRequestParams params}) {
    return  _certificateRequestsRepository.createCertificateRequest(params);
  }
}
