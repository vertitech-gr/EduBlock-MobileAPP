import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/domain/entity/envelopes/envelope_list.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/create_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/get_envelope_list_usecase.dart';
import 'package:edublock/domain/usecase/certificate_request/create_envelopes_usecase/share_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/envelopes/edit_envelopes_usecase/edit_envelopes_usecase.dart';
import 'package:edublock/domain/usecase/share/share_envelopes_certificate_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'create_envelopes_store.g.dart';

class CreateEnvelopesStore = _CreateEnvelopesStore with _$CreateEnvelopesStore;

abstract class _CreateEnvelopesStore with Store {
  _CreateEnvelopesStore(
      this._createEnvelopesUseCase,
      this._getEnvelopeListsUseCase,
      this._shareEnvelopesUseCase,
      this._editEnvelopesUseCase,

      this._shareEnvelopesCertificateUseCase,
      this.formErrorStore,
      this.errorStore){
    _setupValidations();
  }

  final CreateEnvelopesErrorStore formErrorStore;

  final GetEnvelopeListsUseCase _getEnvelopeListsUseCase;
  final ShareEnvelopesUseCase _shareEnvelopesUseCase;
  final EditEnvelopesUseCase _editEnvelopesUseCase;
  final ShareEnvelopesCertificateUseCase _shareEnvelopesCertificateUseCase;

  // store for handling error messages
  final ErrorStore errorStore;

// disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => envelopeName, validateEnvelopeName),
      reaction((_) => userEmail, validateUserEmail),
    ];
  }

  @action
  void validateEnvelopeName(String value) {
    // RegExp fullNameRegExp = RegExp(r'^[a-zA-Z0-9_\-\s]+$');
    // RegExp fullNameRegExp = RegExp(r'^[a-zA-Z0-9_\-\s*]+$');
    RegExp fullNameRegExp = RegExp(r'^[a-zA-Z0-9_\-\s]+(?<!\.)$');


    print('check vlidsation id work or not ${fullNameRegExp.hasMatch(value)}');
    if (value.isEmpty) {
      formErrorStore.envelopeName = "EnvelopeName can't be empty";
    }else if(!fullNameRegExp.hasMatch(value)){
      formErrorStore.envelopeName = "Envelope name can contain alphanumeric characters, underscores, hyphens, and spaces.";

    } else {
      formErrorStore.envelopeName = null;
    }
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  void validateAll() {
    validateEnvelopeName(envelopeName);

  }

  // observer

  @observable
  Envelope? selectedEnvelopes;

  @observable
  String envelopeName = "";
  @observable
  String userEmail = "";

  String envelopeID = '';

  @observable
  bool onChangeTriggered = false;

  @observable
 String selectedSortBy = "name";

  @action
  void setSelectedSortBy(String value) {
    print('setSelectedSortBy $value');
    selectedSortBy = value;
  }

  @observable
  String sortByOrder = '0';

  @action
  void setSortByOrder(String value) {
    print('setSelectedSortBy $value');
    sortByOrder = value;
  }


  @action
  void setOnChangeTriggered(bool value) {
    print('setOnChangeTriggered $value');
    onChangeTriggered = value;
  }


  @observable
  List<String> credential = [];

  @action
  void setEnvelopesID(String value) {
    envelopeID = value;
  }

  @action
  void setSelectedEnvelopes(Envelope? value) {
    selectedEnvelopes = value;
  }

  @observable
  List<CertificateDetails> studentSelectedCertificate = [];

  @action
  void setAllCredentialID(List<String> value) {
    credential.addAll(value);
  }

  @action
  void setStudentSelectedCertificate(CertificateDetails value) {
    studentSelectedCertificate = [...studentSelectedCertificate, value];
  }

  @action
  void addStudentSelectedCertificate(List<CertificateDetails> value) {
    studentSelectedCertificate = [...value];
  }
  @action
  void removeStudentSelectedCertificate() {
    List<CertificateDetails> l = [];
    studentSelectedCertificate = [...l];
  }

  @action
  void removeStudentSelectedCertificateID(CertificateDetails value) {
    studentSelectedCertificate = [
      ...studentSelectedCertificate.where((item) => item != value)
    ];
  }

  @observable
  List<CertificateDetails> editCertificateEnvelopes = [];

  @action
  void addAllCertificateInEnvelopes(List<CertificateDetails> value) {
    editCertificateEnvelopes = [...value];
  }

  @action
  void addCertificateEnvelopes(CertificateDetails value) {
    editCertificateEnvelopes = [...editCertificateEnvelopes, value];
  }

  void removeAllCertificate() {
    editCertificateEnvelopes.clear();
  }

  @action
  void removeEnvelopesCertificateID(CertificateDetails value) {
    editCertificateEnvelopes.remove(value);
  }

  @action
  void setEnvelopesName(String value) {
    print('heck envelopes name ennter $value');
    envelopeName = value;
  }

  @action
  void setEmail(String value) {
    userEmail = value;
  }

  //for error
  @computed
  bool get canCreateEnvelopes =>
      !formErrorStore.hasErrorInCreateEnvelopes &&
      envelopeName.isNotEmpty &&
      userEmail.isNotEmpty;

  @computed
  bool get canStudentCreateEnvelopes =>
      !formErrorStore.hasErrorInCreateEnvelopes && envelopeName.isNotEmpty;

  // use cases:-----------------------------------------------------------------

  final CreateEnvelopesUseCase _createEnvelopesUseCase;
  static ObservableFuture<ApiResponse?> emptyCertificateRequestAccessResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> certificateRequestAccessFuture =
      emptyCertificateRequestAccessResponse;

  @computed
  bool get isCreateEnvelopesLoading =>
      certificateRequestAccessFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> createEnvelopes(
      String name, List<String> credentials) async {
    try {
      CreateEnvelopesParams createEnvelopesParams =
          CreateEnvelopesParams(name: name, credentials: credentials);

      final future =
          _createEnvelopesUseCase.call(params: createEnvelopesParams);
      certificateRequestAccessFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.data != null) {
        return ApiResponse(success: value!.success, message: value.message);
      }else{
        return ApiResponse(success: false, message: value!.message);

      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // edit envelopes are
  static ObservableFuture<ApiResponse?> emptyEditEnvelopeResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> editEnvelopesFuture =
      emptyEditEnvelopeResponse;

  @computed
  bool get isEditingEnvelopes =>
      editEnvelopesFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> editEnvelope(
      String id, List<String> certificateCredential) async {
    try {
      EditEnvelopesParams editEnvelopesParams = EditEnvelopesParams(
          envelopeId: id, Credentials: certificateCredential);

      final future = _editEnvelopesUseCase.call(params: editEnvelopesParams);
      editEnvelopesFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // get envelopes list here
  @observable
  ObservableList<Envelope> envelopeLists = new ObservableList<Envelope>();

  static ObservableFuture<EnvelopeLists?> emptyEnvelopeListsResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<EnvelopeLists?> envelopeListsFuture =
      emptyEnvelopeListsResponse;

  @computed
  bool get isEnvelopeListsLoading =>
      envelopeListsFuture.status == FutureStatus.pending;

  @action
  Future getEnvelopeLists() async {
    try {
      envelopeLists.clear();

      GetEnvelopesParams   getEnvelopesParams  = GetEnvelopesParams(sortBY: selectedSortBy,sortByOrder: sortByOrder);
      final future = _getEnvelopeListsUseCase.call(params: getEnvelopesParams);
      envelopeListsFuture = ObservableFuture(future);

      EnvelopeLists? value = await future;

      if (value != null && value.envelope != null) {
        setSelectedEnvelopes(value.envelope![0]);

        // Clear existing data before adding new data
        value.envelope?.forEach((Envelope element) {
          envelopeLists.add(element);
        });
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // share certificate here
  static ObservableFuture<ApiResponse?> emptyShareCertificateResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> shareCertificateFuture =
      emptyShareCertificateResponse;

  @computed
  bool get isShareCertificateLoading =>
      shareCertificateFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> shareEnvelopes(
      String envelopID, String email, List<String> credential) async {
    try {
      ShareEnvelopesParams shareEnvelopesParams = ShareEnvelopesParams(
          envelopID: envelopID, email: email, credentials: credential);

      final future = _shareEnvelopesUseCase.call(params: shareEnvelopesParams);
      shareCertificateFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  // share both certificate and evelopes  here
  static ObservableFuture<ApiResponse?> emptyShareResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> shareFuture =
      emptyShareResponse;

  @computed
  bool get isShareLoading =>
      shareFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> shareEnvelopesCertificate(
      int type, String email,String? resourceId, List<String>? credential,String? requestId,bool qr) async {
    try {
      print('check all student certificate are here ${resourceId}   ${credential}   ::: ${credential?.length}');

      ShareEnvelopesCertificateParams shareEnvelopesParams = ShareEnvelopesCertificateParams(

        resourceId: resourceId, requestId: requestId,
           credentials: credential, emailId: email, type: type, qr: qr);

      final future = _shareEnvelopesCertificateUseCase.call(params: shareEnvelopesParams);
      shareFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.message != null) {
        return value;
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }
}

class CreateEnvelopesErrorStore = _CreateEnvelopesErrorStore
    with _$CreateEnvelopesErrorStore;

abstract class _CreateEnvelopesErrorStore with Store {
  @observable
  String? envelopeName;

  @observable
  String? userEmail;

  @computed
  bool get hasErrorInCreateEnvelopes =>
      envelopeName != null || userEmail != null;
}
