import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/entity/certificates/certificat_list.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'get_certificate_usecase.g.dart';


@JsonSerializable()
class GetCertificateListParams {
  final String? userProfileID;

  GetCertificateListParams({required this.userProfileID});

  factory GetCertificateListParams.fromJson(Map<String, dynamic> json) =>
      _$GetCertificateListParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetCertificateListParamsToJson(this);
}



class GetCertificateListsUseCase extends UseCase<CertificateLists, GetCertificateListParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  GetCertificateListsUseCase(this._certificateRequestsRepository);

  @override
  Future<CertificateLists> call({required GetCertificateListParams params}) {
    return _certificateRequestsRepository.getCertificateLists(params);
  }
}
