// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_envelopes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEnvelopesStore on _CreateEnvelopesStore, Store {
  Computed<bool>? _$canCreateEnvelopesComputed;

  @override
  bool get canCreateEnvelopes => (_$canCreateEnvelopesComputed ??=
          Computed<bool>(() => super.canCreateEnvelopes,
              name: '_CreateEnvelopesStore.canCreateEnvelopes'))
      .value;
  Computed<bool>? _$canStudentCreateEnvelopesComputed;

  @override
  bool get canStudentCreateEnvelopes => (_$canStudentCreateEnvelopesComputed ??=
          Computed<bool>(() => super.canStudentCreateEnvelopes,
              name: '_CreateEnvelopesStore.canStudentCreateEnvelopes'))
      .value;
  Computed<bool>? _$isCreateEnvelopesLoadingComputed;

  @override
  bool get isCreateEnvelopesLoading => (_$isCreateEnvelopesLoadingComputed ??=
          Computed<bool>(() => super.isCreateEnvelopesLoading,
              name: '_CreateEnvelopesStore.isCreateEnvelopesLoading'))
      .value;
  Computed<bool>? _$isEditingEnvelopesComputed;

  @override
  bool get isEditingEnvelopes => (_$isEditingEnvelopesComputed ??=
          Computed<bool>(() => super.isEditingEnvelopes,
              name: '_CreateEnvelopesStore.isEditingEnvelopes'))
      .value;
  Computed<bool>? _$isEnvelopeListsLoadingComputed;

  @override
  bool get isEnvelopeListsLoading => (_$isEnvelopeListsLoadingComputed ??=
          Computed<bool>(() => super.isEnvelopeListsLoading,
              name: '_CreateEnvelopesStore.isEnvelopeListsLoading'))
      .value;
  Computed<bool>? _$isShareCertificateLoadingComputed;

  @override
  bool get isShareCertificateLoading => (_$isShareCertificateLoadingComputed ??=
          Computed<bool>(() => super.isShareCertificateLoading,
              name: '_CreateEnvelopesStore.isShareCertificateLoading'))
      .value;
  Computed<bool>? _$isShareLoadingComputed;

  @override
  bool get isShareLoading =>
      (_$isShareLoadingComputed ??= Computed<bool>(() => super.isShareLoading,
              name: '_CreateEnvelopesStore.isShareLoading'))
          .value;

  late final _$selectedEnvelopesAtom =
      Atom(name: '_CreateEnvelopesStore.selectedEnvelopes', context: context);

  @override
  Envelope? get selectedEnvelopes {
    _$selectedEnvelopesAtom.reportRead();
    return super.selectedEnvelopes;
  }

  @override
  set selectedEnvelopes(Envelope? value) {
    _$selectedEnvelopesAtom.reportWrite(value, super.selectedEnvelopes, () {
      super.selectedEnvelopes = value;
    });
  }

  late final _$envelopeNameAtom =
      Atom(name: '_CreateEnvelopesStore.envelopeName', context: context);

  @override
  String get envelopeName {
    _$envelopeNameAtom.reportRead();
    return super.envelopeName;
  }

  @override
  set envelopeName(String value) {
    _$envelopeNameAtom.reportWrite(value, super.envelopeName, () {
      super.envelopeName = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_CreateEnvelopesStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$onChangeTriggeredAtom =
      Atom(name: '_CreateEnvelopesStore.onChangeTriggered', context: context);

  @override
  bool get onChangeTriggered {
    _$onChangeTriggeredAtom.reportRead();
    return super.onChangeTriggered;
  }

  @override
  set onChangeTriggered(bool value) {
    _$onChangeTriggeredAtom.reportWrite(value, super.onChangeTriggered, () {
      super.onChangeTriggered = value;
    });
  }

  late final _$selectedSortByAtom =
      Atom(name: '_CreateEnvelopesStore.selectedSortBy', context: context);

  @override
  String get selectedSortBy {
    _$selectedSortByAtom.reportRead();
    return super.selectedSortBy;
  }

  @override
  set selectedSortBy(String value) {
    _$selectedSortByAtom.reportWrite(value, super.selectedSortBy, () {
      super.selectedSortBy = value;
    });
  }

  late final _$sortByOrderAtom =
      Atom(name: '_CreateEnvelopesStore.sortByOrder', context: context);

  @override
  String get sortByOrder {
    _$sortByOrderAtom.reportRead();
    return super.sortByOrder;
  }

  @override
  set sortByOrder(String value) {
    _$sortByOrderAtom.reportWrite(value, super.sortByOrder, () {
      super.sortByOrder = value;
    });
  }

  late final _$credentialAtom =
      Atom(name: '_CreateEnvelopesStore.credential', context: context);

  @override
  List<String> get credential {
    _$credentialAtom.reportRead();
    return super.credential;
  }

  @override
  set credential(List<String> value) {
    _$credentialAtom.reportWrite(value, super.credential, () {
      super.credential = value;
    });
  }

  late final _$studentSelectedCertificateAtom = Atom(
      name: '_CreateEnvelopesStore.studentSelectedCertificate',
      context: context);

  @override
  List<CertificateDetails> get studentSelectedCertificate {
    _$studentSelectedCertificateAtom.reportRead();
    return super.studentSelectedCertificate;
  }

  @override
  set studentSelectedCertificate(List<CertificateDetails> value) {
    _$studentSelectedCertificateAtom
        .reportWrite(value, super.studentSelectedCertificate, () {
      super.studentSelectedCertificate = value;
    });
  }

  late final _$editCertificateEnvelopesAtom = Atom(
      name: '_CreateEnvelopesStore.editCertificateEnvelopes', context: context);

  @override
  List<CertificateDetails> get editCertificateEnvelopes {
    _$editCertificateEnvelopesAtom.reportRead();
    return super.editCertificateEnvelopes;
  }

  @override
  set editCertificateEnvelopes(List<CertificateDetails> value) {
    _$editCertificateEnvelopesAtom
        .reportWrite(value, super.editCertificateEnvelopes, () {
      super.editCertificateEnvelopes = value;
    });
  }

  late final _$certificateRequestAccessFutureAtom = Atom(
      name: '_CreateEnvelopesStore.certificateRequestAccessFuture',
      context: context);

  @override
  ObservableFuture<ApiResponse?> get certificateRequestAccessFuture {
    _$certificateRequestAccessFutureAtom.reportRead();
    return super.certificateRequestAccessFuture;
  }

  @override
  set certificateRequestAccessFuture(ObservableFuture<ApiResponse?> value) {
    _$certificateRequestAccessFutureAtom
        .reportWrite(value, super.certificateRequestAccessFuture, () {
      super.certificateRequestAccessFuture = value;
    });
  }

  late final _$editEnvelopesFutureAtom =
      Atom(name: '_CreateEnvelopesStore.editEnvelopesFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get editEnvelopesFuture {
    _$editEnvelopesFutureAtom.reportRead();
    return super.editEnvelopesFuture;
  }

  @override
  set editEnvelopesFuture(ObservableFuture<ApiResponse?> value) {
    _$editEnvelopesFutureAtom.reportWrite(value, super.editEnvelopesFuture, () {
      super.editEnvelopesFuture = value;
    });
  }

  late final _$envelopeListsAtom =
      Atom(name: '_CreateEnvelopesStore.envelopeLists', context: context);

  @override
  ObservableList<Envelope> get envelopeLists {
    _$envelopeListsAtom.reportRead();
    return super.envelopeLists;
  }

  @override
  set envelopeLists(ObservableList<Envelope> value) {
    _$envelopeListsAtom.reportWrite(value, super.envelopeLists, () {
      super.envelopeLists = value;
    });
  }

  late final _$envelopeListsFutureAtom =
      Atom(name: '_CreateEnvelopesStore.envelopeListsFuture', context: context);

  @override
  ObservableFuture<EnvelopeLists?> get envelopeListsFuture {
    _$envelopeListsFutureAtom.reportRead();
    return super.envelopeListsFuture;
  }

  @override
  set envelopeListsFuture(ObservableFuture<EnvelopeLists?> value) {
    _$envelopeListsFutureAtom.reportWrite(value, super.envelopeListsFuture, () {
      super.envelopeListsFuture = value;
    });
  }

  late final _$shareCertificateFutureAtom = Atom(
      name: '_CreateEnvelopesStore.shareCertificateFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get shareCertificateFuture {
    _$shareCertificateFutureAtom.reportRead();
    return super.shareCertificateFuture;
  }

  @override
  set shareCertificateFuture(ObservableFuture<ApiResponse?> value) {
    _$shareCertificateFutureAtom
        .reportWrite(value, super.shareCertificateFuture, () {
      super.shareCertificateFuture = value;
    });
  }

  late final _$shareFutureAtom =
      Atom(name: '_CreateEnvelopesStore.shareFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get shareFuture {
    _$shareFutureAtom.reportRead();
    return super.shareFuture;
  }

  @override
  set shareFuture(ObservableFuture<ApiResponse?> value) {
    _$shareFutureAtom.reportWrite(value, super.shareFuture, () {
      super.shareFuture = value;
    });
  }

  late final _$createEnvelopesAsyncAction =
      AsyncAction('_CreateEnvelopesStore.createEnvelopes', context: context);

  @override
  Future<ApiResponse?> createEnvelopes(String name, List<String> credentials) {
    return _$createEnvelopesAsyncAction
        .run(() => super.createEnvelopes(name, credentials));
  }

  late final _$editEnvelopeAsyncAction =
      AsyncAction('_CreateEnvelopesStore.editEnvelope', context: context);

  @override
  Future<ApiResponse?> editEnvelope(
      String id, List<String> certificateCredential) {
    return _$editEnvelopeAsyncAction
        .run(() => super.editEnvelope(id, certificateCredential));
  }

  late final _$getEnvelopeListsAsyncAction =
      AsyncAction('_CreateEnvelopesStore.getEnvelopeLists', context: context);

  @override
  Future<dynamic> getEnvelopeLists() {
    return _$getEnvelopeListsAsyncAction.run(() => super.getEnvelopeLists());
  }

  late final _$shareEnvelopesAsyncAction =
      AsyncAction('_CreateEnvelopesStore.shareEnvelopes', context: context);

  @override
  Future<ApiResponse?> shareEnvelopes(
      String envelopID, String email, List<String> credential) {
    return _$shareEnvelopesAsyncAction
        .run(() => super.shareEnvelopes(envelopID, email, credential));
  }

  late final _$shareEnvelopesCertificateAsyncAction = AsyncAction(
      '_CreateEnvelopesStore.shareEnvelopesCertificate',
      context: context);

  @override
  Future<ApiResponse?> shareEnvelopesCertificate(
      int type,
      String email,
      String? resourceId,
      List<String>? credential,
      String? requestId,
      bool qr) {
    return _$shareEnvelopesCertificateAsyncAction.run(() => super
        .shareEnvelopesCertificate(
            type, email, resourceId, credential, requestId, qr));
  }

  late final _$_CreateEnvelopesStoreActionController =
      ActionController(name: '_CreateEnvelopesStore', context: context);

  @override
  void validateEnvelopeName(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.validateEnvelopeName');
    try {
      return super.validateEnvelopeName(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedSortBy(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setSelectedSortBy');
    try {
      return super.setSelectedSortBy(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortByOrder(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setSortByOrder');
    try {
      return super.setSortByOrder(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnChangeTriggered(bool value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setOnChangeTriggered');
    try {
      return super.setOnChangeTriggered(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnvelopesID(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setEnvelopesID');
    try {
      return super.setEnvelopesID(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedEnvelopes(Envelope? value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setSelectedEnvelopes');
    try {
      return super.setSelectedEnvelopes(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllCredentialID(List<String> value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setAllCredentialID');
    try {
      return super.setAllCredentialID(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStudentSelectedCertificate(CertificateDetails value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setStudentSelectedCertificate');
    try {
      return super.setStudentSelectedCertificate(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addStudentSelectedCertificate(List<CertificateDetails> value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.addStudentSelectedCertificate');
    try {
      return super.addStudentSelectedCertificate(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeStudentSelectedCertificate() {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.removeStudentSelectedCertificate');
    try {
      return super.removeStudentSelectedCertificate();
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeStudentSelectedCertificateID(CertificateDetails value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.removeStudentSelectedCertificateID');
    try {
      return super.removeStudentSelectedCertificateID(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllCertificateInEnvelopes(List<CertificateDetails> value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.addAllCertificateInEnvelopes');
    try {
      return super.addAllCertificateInEnvelopes(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCertificateEnvelopes(CertificateDetails value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.addCertificateEnvelopes');
    try {
      return super.addCertificateEnvelopes(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEnvelopesCertificateID(CertificateDetails value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.removeEnvelopesCertificateID');
    try {
      return super.removeEnvelopesCertificateID(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnvelopesName(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setEnvelopesName');
    try {
      return super.setEnvelopesName(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CreateEnvelopesStoreActionController.startAction(
        name: '_CreateEnvelopesStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CreateEnvelopesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEnvelopes: ${selectedEnvelopes},
envelopeName: ${envelopeName},
userEmail: ${userEmail},
onChangeTriggered: ${onChangeTriggered},
selectedSortBy: ${selectedSortBy},
sortByOrder: ${sortByOrder},
credential: ${credential},
studentSelectedCertificate: ${studentSelectedCertificate},
editCertificateEnvelopes: ${editCertificateEnvelopes},
certificateRequestAccessFuture: ${certificateRequestAccessFuture},
editEnvelopesFuture: ${editEnvelopesFuture},
envelopeLists: ${envelopeLists},
envelopeListsFuture: ${envelopeListsFuture},
shareCertificateFuture: ${shareCertificateFuture},
shareFuture: ${shareFuture},
canCreateEnvelopes: ${canCreateEnvelopes},
canStudentCreateEnvelopes: ${canStudentCreateEnvelopes},
isCreateEnvelopesLoading: ${isCreateEnvelopesLoading},
isEditingEnvelopes: ${isEditingEnvelopes},
isEnvelopeListsLoading: ${isEnvelopeListsLoading},
isShareCertificateLoading: ${isShareCertificateLoading},
isShareLoading: ${isShareLoading}
    ''';
  }
}

mixin _$CreateEnvelopesErrorStore on _CreateEnvelopesErrorStore, Store {
  Computed<bool>? _$hasErrorInCreateEnvelopesComputed;

  @override
  bool get hasErrorInCreateEnvelopes => (_$hasErrorInCreateEnvelopesComputed ??=
          Computed<bool>(() => super.hasErrorInCreateEnvelopes,
              name: '_CreateEnvelopesErrorStore.hasErrorInCreateEnvelopes'))
      .value;

  late final _$envelopeNameAtom =
      Atom(name: '_CreateEnvelopesErrorStore.envelopeName', context: context);

  @override
  String? get envelopeName {
    _$envelopeNameAtom.reportRead();
    return super.envelopeName;
  }

  @override
  set envelopeName(String? value) {
    _$envelopeNameAtom.reportWrite(value, super.envelopeName, () {
      super.envelopeName = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_CreateEnvelopesErrorStore.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  @override
  String toString() {
    return '''
envelopeName: ${envelopeName},
userEmail: ${userEmail},
hasErrorInCreateEnvelopes: ${hasErrorInCreateEnvelopes}
    ''';
  }
}
