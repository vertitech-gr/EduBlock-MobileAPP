import 'package:edublock/domain/entity/department/department_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
part 'envelopes_link_by_id_usecase.g.dart';


@JsonSerializable()
class EnvelopesLinkByIDParams {
  final String envelopID;

  EnvelopesLinkByIDParams({required this.envelopID});

  factory EnvelopesLinkByIDParams.fromJson(Map<String, dynamic> json) =>
      _$EnvelopesLinkByIDParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EnvelopesLinkByIDParamsToJson(this);
}



class EnvelopesLinkIDUseCase extends UseCase<ApiResponse?, EnvelopesLinkByIDParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  EnvelopesLinkIDUseCase(this._certificateRequestsRepository);

  @override
  Future<ApiResponse?> call({required EnvelopesLinkByIDParams params}) {
    return _certificateRequestsRepository.envelopesLinkByID(params);
  }
}
