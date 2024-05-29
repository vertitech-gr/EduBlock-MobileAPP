import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'certificate_pdf_link_by_id_usecase.g.dart';


@JsonSerializable()
class CertificatePdfLinkByIDParams {
  final String id;

  CertificatePdfLinkByIDParams({required this.id});

  factory CertificatePdfLinkByIDParams.fromJson(Map<String, dynamic> json) =>
      _$CertificatePdfLinkByIDParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CertificatePdfLinkByIDParamsToJson(this);
}



class CertificatePdfLinkIDUseCase extends UseCase<ApiResponse?, CertificatePdfLinkByIDParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  CertificatePdfLinkIDUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required CertificatePdfLinkByIDParams params}) {
    return _certificateRequestsRepository.certificatePdfLinkByID(params);
  }
}
