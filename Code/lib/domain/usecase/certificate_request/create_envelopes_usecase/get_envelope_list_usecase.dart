
import 'package:edublock/domain/entity/envelopes/envelope_list.dart';
import 'package:edublock/core/domain/usecase/use_case.dart';
import 'package:edublock/domain/repository/certificate_request_repository/certificate_requests_repository.dart';
import 'package:json_annotation/json_annotation.dart';


part 'get_envelope_list_usecase.g.dart';


@JsonSerializable()
class GetEnvelopesParams {
  final String sortBY;
  final String sortByOrder;

  GetEnvelopesParams({required this.sortBY,required this.sortByOrder});

  factory GetEnvelopesParams.fromJson(Map<String, dynamic> json) =>
      _$GetEnvelopesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetEnvelopesParamsToJson(this);
}

class GetEnvelopeListsUseCase extends UseCase<EnvelopeLists, GetEnvelopesParams> {

  final CertificateRequestsRepository _certificateRequestsRepository;

  GetEnvelopeListsUseCase(this._certificateRequestsRepository);

  @override
  Future<EnvelopeLists> call({required GetEnvelopesParams params}) {
    return _certificateRequestsRepository.getEnvelopeLists(params);
  }
}
