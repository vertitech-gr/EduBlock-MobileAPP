import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'share_envelopes_usecase.g.dart';


@JsonSerializable()
class ShareEnvelopesParams {
  final String envelopID;

  final String  email;
  final List<String> credentials;

  ShareEnvelopesParams({required this.envelopID,required this.email, required this.credentials});

  factory ShareEnvelopesParams.fromJson(Map<String, dynamic> json) =>
      _$ShareEnvelopesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ShareEnvelopesParamsToJson(this);
}



class ShareEnvelopesUseCase extends UseCase<ApiResponse?, ShareEnvelopesParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  ShareEnvelopesUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required ShareEnvelopesParams params}) {
    return  _certificateRequestsRepository.shareEnvelope(params);
  }
}
