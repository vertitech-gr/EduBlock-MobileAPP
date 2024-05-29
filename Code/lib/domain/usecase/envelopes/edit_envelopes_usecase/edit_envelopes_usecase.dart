import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/envelopes_repository/envelopes_repositroy.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edublock/core/domain/usecase/use_case.dart';
part 'edit_envelopes_usecase.g.dart';


@JsonSerializable()
class EditEnvelopesParams {
  final String envelopeId;
  final List<String> Credentials;

  EditEnvelopesParams({required this.envelopeId,required this.Credentials});

  factory EditEnvelopesParams.fromJson(Map<String, dynamic> json) =>
      _$EditEnvelopesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EditEnvelopesParamsToJson(this);
}


class EditEnvelopesUseCase extends UseCase<ApiResponse?, EditEnvelopesParams> {

  final EnvelopesRepository _envelopesRepository;

  EditEnvelopesUseCase(this._envelopesRepository);

  @override
  Future<ApiResponse?> call({required EditEnvelopesParams params}) {
    return _envelopesRepository.editEnvelopes(params);
  }
}
