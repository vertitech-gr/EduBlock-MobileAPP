import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/envelopes_repository/envelopes_repositroy.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'share_envelopes_certificate_usecase.g.dart';


@JsonSerializable()
class ShareEnvelopesCertificateParams {
  final String emailId;
  final int type;
  final String? resourceId;
  final String? requestId;
  final List<String>? credentials;
  final bool qr;

  ShareEnvelopesCertificateParams( {required this.qr,required this.emailId,required this.type,  this.resourceId,this.credentials, this.requestId});

  factory ShareEnvelopesCertificateParams.fromJson(Map<String, dynamic> json) =>
      _$ShareEnvelopesCertificateParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ShareEnvelopesCertificateParamsToJson(this);
}



class ShareEnvelopesCertificateUseCase extends UseCase<ApiResponse?, ShareEnvelopesCertificateParams> {

  final EnvelopesRepository _envelopesRepository;

  ShareEnvelopesCertificateUseCase(this._envelopesRepository);

  @override
  Future<ApiResponse?> call({required ShareEnvelopesCertificateParams params}) {
    return  _envelopesRepository.shareEnvelopeCertificate(params);
  }
}
