import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'create_envelopes_usecase.g.dart';


@JsonSerializable()
class CreateEnvelopesParams {
  final String name;
  final List<String> credentials;

  CreateEnvelopesParams({required this.name,required this.credentials});

  factory CreateEnvelopesParams.fromJson(Map<String, dynamic> json) =>
      _$CreateEnvelopesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEnvelopesParamsToJson(this);
}



class CreateEnvelopesUseCase extends UseCase<ApiResponse?, CreateEnvelopesParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  CreateEnvelopesUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required CreateEnvelopesParams params}) {
    return  _certificateRequestsRepository.createEnvelopes(params);
  }
}
