import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'certificate_request_access_usecase.g.dart';


@JsonSerializable()
class CertificateRequestAccessParams {
  final String name;
  final List<int> credentials;

  CertificateRequestAccessParams({required this.name,required this.credentials});

  factory CertificateRequestAccessParams.fromJson(Map<String, dynamic> json) =>
      _$CertificateRequestAccessParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateRequestAccessParamsToJson(this);
}



class CertificateRequestAccessUseCase extends UseCase<ApiResponse?, CertificateRequestAccessParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  CertificateRequestAccessUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required CertificateRequestAccessParams params}) {
    return  _certificateRequestsRepository.certificateRequestAccess(params);
  }
}
