import 'package:edublock/data/network/apis/envelopes/envelopes_api.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/repository/envelopes_repository/envelopes_repositroy.dart';
import 'package:edublock/domain/usecase/envelopes/edit_envelopes_usecase/edit_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/share/share_envelopes_certificate_usecase.dart';

class EnvelopesRepositoryImpl extends EnvelopesRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final EnvelopesApi _envelopesApi;

  // constructor
  EnvelopesRepositoryImpl(this._sharedPrefsHelper, this._envelopesApi);

  @override
  Future<ApiResponse?> editEnvelopes(EditEnvelopesParams params) async {
    return await _envelopesApi
        .editEnvelopes(params)
        .catchError((error) => throw error);
  }
 @override
  Future<ApiResponse?> shareEnvelopeCertificate(ShareEnvelopesCertificateParams params) async {
    return await _envelopesApi
        .shareEnvelopeCertificate(params)
        .catchError((error) => throw error);
  }

}