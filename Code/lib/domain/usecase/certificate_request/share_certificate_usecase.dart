import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'share_certificate_usecase.g.dart';


@JsonSerializable()
class ShareCertificateParams {
  final String  email;
  final String certificateId;

  ShareCertificateParams({required this.email,required this.certificateId});

  factory ShareCertificateParams.fromJson(Map<String, dynamic> json) =>
      _$ShareCertificateParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ShareCertificateParamsToJson(this);
}



class ShareCertificateUseCase extends UseCase<ApiResponse?, ShareCertificateParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  ShareCertificateUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required ShareCertificateParams params}) {
    return  _certificateRequestsRepository.shareCertificate(params);
  }
}
