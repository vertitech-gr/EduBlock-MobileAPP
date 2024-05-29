import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/certificate_request/certificate_request_access_usecase.dart';
import 'package:mobx/mobx.dart';

part 'certificate_request_access_store.g.dart';

class CertificateRequestAccessStore = _CertificateRequestAccessStore with _$CertificateRequestAccessStore;

abstract class _CertificateRequestAccessStore with Store {
  _CertificateRequestAccessStore(this._certificateRequestAccessUseCase);


  // use cases:-----------------------------------------------------------------

  final CertificateRequestAccessUseCase _certificateRequestAccessUseCase;


  static ObservableFuture<ApiResponse?> emptyCertificateRequestAccessResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> certificateRequestAccessFuture = emptyCertificateRequestAccessResponse;

  @computed
  bool get isCertificateRequestAccessLoading => certificateRequestAccessFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> certificateRequestAccess(
      String name, List<int> credentials) async {

    try {
      CertificateRequestAccessParams certificateRequestAccessParams =CertificateRequestAccessParams(name: name, credentials: credentials);

      final future = _certificateRequestAccessUseCase.call(params: certificateRequestAccessParams);
      certificateRequestAccessFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        // this.registrationKey = value?.data?['key'];
        //
        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }



}