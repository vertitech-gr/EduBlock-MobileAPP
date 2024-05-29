// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_request_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CertificateRequestStore on _CertificateRequestStore, Store {
  Computed<int>? _$selectedCertificateLengthComputed;

  @override
  int get selectedCertificateLength => (_$selectedCertificateLengthComputed ??=
          Computed<int>(() => super.selectedCertificateLength,
              name: '_CertificateRequestStore.selectedCertificateLength'))
      .value;
  Computed<bool>? _$isCertificateLoadingComputed;

  @override
  bool get isCertificateLoading => (_$isCertificateLoadingComputed ??=
          Computed<bool>(() => super.isCertificateLoading,
              name: '_CertificateRequestStore.isCertificateLoading'))
      .value;
  Computed<bool>? _$isUniversityLoadingComputed;

  @override
  bool get isUniversityLoading => (_$isUniversityLoadingComputed ??=
          Computed<bool>(() => super.isUniversityLoading,
              name: '_CertificateRequestStore.isUniversityLoading'))
      .value;
  Computed<bool>? _$isShareCertificateLoadingComputed;

  @override
  bool get isShareCertificateLoading => (_$isShareCertificateLoadingComputed ??=
          Computed<bool>(() => super.isShareCertificateLoading,
              name: '_CertificateRequestStore.isShareCertificateLoading'))
      .value;
  Computed<bool>? _$isCreateCertificateRequestLoadingComputed;

  @override
  bool get isCreateCertificateRequestLoading =>
      (_$isCreateCertificateRequestLoadingComputed ??= Computed<bool>(
              () => super.isCreateCertificateRequestLoading,
              name:
                  '_CertificateRequestStore.isCreateCertificateRequestLoading'))
          .value;
  Computed<bool>? _$isDepartmentListsByIDLoadingComputed;

  @override
  bool get isDepartmentListsByIDLoading =>
      (_$isDepartmentListsByIDLoadingComputed ??= Computed<bool>(
              () => super.isDepartmentListsByIDLoading,
              name: '_CertificateRequestStore.isDepartmentListsByIDLoading'))
          .value;
  Computed<bool>? _$isAllRequestListsLoadingComputed;

  @override
  bool get isAllRequestListsLoading => (_$isAllRequestListsLoadingComputed ??=
          Computed<bool>(() => super.isAllRequestListsLoading,
              name: '_CertificateRequestStore.isAllRequestListsLoading'))
      .value;
  Computed<bool>? _$isCertificatePdfLinkByIDLoadingComputed;

  @override
  bool get isCertificatePdfLinkByIDLoading =>
      (_$isCertificatePdfLinkByIDLoadingComputed ??= Computed<bool>(
              () => super.isCertificatePdfLinkByIDLoading,
              name: '_CertificateRequestStore.isCertificatePdfLinkByIDLoading'))
          .value;
  Computed<bool>? _$isEnvelopesByIDLoadingComputed;

  @override
  bool get isEnvelopesByIDLoading => (_$isEnvelopesByIDLoadingComputed ??=
          Computed<bool>(() => super.isEnvelopesByIDLoading,
              name: '_CertificateRequestStore.isEnvelopesByIDLoading'))
      .value;
  Computed<bool>? _$isEmployeesRequestDeclinedLoadingComputed;

  @override
  bool get isEmployeesRequestDeclinedLoading =>
      (_$isEmployeesRequestDeclinedLoadingComputed ??= Computed<bool>(
              () => super.isEmployeesRequestDeclinedLoading,
              name:
                  '_CertificateRequestStore.isEmployeesRequestDeclinedLoading'))
          .value;
  Computed<bool>? _$isStudentRequestLoadingComputed;

  @override
  bool get isStudentRequestLoading => (_$isStudentRequestLoadingComputed ??=
          Computed<bool>(() => super.isStudentRequestLoading,
              name: '_CertificateRequestStore.isStudentRequestLoading'))
      .value;

  late final _$senderEmailAtom =
      Atom(name: '_CertificateRequestStore.senderEmail', context: context);

  @override
  String? get senderEmail {
    _$senderEmailAtom.reportRead();
    return super.senderEmail;
  }

  @override
  set senderEmail(String? value) {
    _$senderEmailAtom.reportWrite(value, super.senderEmail, () {
      super.senderEmail = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CertificateRequestStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$receiverEmailAtom =
      Atom(name: '_CertificateRequestStore.receiverEmail', context: context);

  @override
  String? get receiverEmail {
    _$receiverEmailAtom.reportRead();
    return super.receiverEmail;
  }

  @override
  set receiverEmail(String? value) {
    _$receiverEmailAtom.reportWrite(value, super.receiverEmail, () {
      super.receiverEmail = value;
    });
  }

  late final _$selectedCertificateAtom = Atom(
      name: '_CertificateRequestStore.selectedCertificate', context: context);

  @override
  List<CertificateDetails> get selectedCertificate {
    _$selectedCertificateAtom.reportRead();
    return super.selectedCertificate;
  }

  @override
  set selectedCertificate(List<CertificateDetails> value) {
    _$selectedCertificateAtom.reportWrite(value, super.selectedCertificate, () {
      super.selectedCertificate = value;
    });
  }

  late final _$envelopesListAtom =
      Atom(name: '_CertificateRequestStore.envelopesList', context: context);

  @override
  List<dynamic> get envelopesList {
    _$envelopesListAtom.reportRead();
    return super.envelopesList;
  }

  @override
  set envelopesList(List<dynamic> value) {
    _$envelopesListAtom.reportWrite(value, super.envelopesList, () {
      super.envelopesList = value;
    });
  }

  late final _$envelopeNameAtom =
      Atom(name: '_CertificateRequestStore.envelopeName', context: context);

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

  late final _$isPayingInAdvanceAtom = Atom(
      name: '_CertificateRequestStore.isPayingInAdvance', context: context);

  @override
  bool get isPayingInAdvance {
    _$isPayingInAdvanceAtom.reportRead();
    return super.isPayingInAdvance;
  }

  @override
  set isPayingInAdvance(bool value) {
    _$isPayingInAdvanceAtom.reportWrite(value, super.isPayingInAdvance, () {
      super.isPayingInAdvance = value;
    });
  }

  late final _$isSplitPaymentAtom =
      Atom(name: '_CertificateRequestStore.isSplitPayment', context: context);

  @override
  bool get isSplitPayment {
    _$isSplitPaymentAtom.reportRead();
    return super.isSplitPayment;
  }

  @override
  set isSplitPayment(bool value) {
    _$isSplitPaymentAtom.reportWrite(value, super.isSplitPayment, () {
      super.isSplitPayment = value;
    });
  }

  late final _$isReceiverPayAtom =
      Atom(name: '_CertificateRequestStore.isReceiverPay', context: context);

  @override
  bool get isReceiverPay {
    _$isReceiverPayAtom.reportRead();
    return super.isReceiverPay;
  }

  @override
  set isReceiverPay(bool value) {
    _$isReceiverPayAtom.reportWrite(value, super.isReceiverPay, () {
      super.isReceiverPay = value;
    });
  }

  late final _$selectUniversityAtom =
      Atom(name: '_CertificateRequestStore.selectUniversity', context: context);

  @override
  University? get selectUniversity {
    _$selectUniversityAtom.reportRead();
    return super.selectUniversity;
  }

  @override
  set selectUniversity(University? value) {
    _$selectUniversityAtom.reportWrite(value, super.selectUniversity, () {
      super.selectUniversity = value;
    });
  }

  late final _$selectDepartmentAtom =
      Atom(name: '_CertificateRequestStore.selectDepartment', context: context);

  @override
  Department? get selectDepartment {
    _$selectDepartmentAtom.reportRead();
    return super.selectDepartment;
  }

  @override
  set selectDepartment(Department? value) {
    _$selectDepartmentAtom.reportWrite(value, super.selectDepartment, () {
      super.selectDepartment = value;
    });
  }

  late final _$selectedYearsAtom =
      Atom(name: '_CertificateRequestStore.selectedYears', context: context);

  @override
  String? get selectedYears {
    _$selectedYearsAtom.reportRead();
    return super.selectedYears;
  }

  @override
  set selectedYears(String? value) {
    _$selectedYearsAtom.reportWrite(value, super.selectedYears, () {
      super.selectedYears = value;
    });
  }

  late final _$shareCertificateIDAtom = Atom(
      name: '_CertificateRequestStore.shareCertificateID', context: context);

  @override
  String get shareCertificateID {
    _$shareCertificateIDAtom.reportRead();
    return super.shareCertificateID;
  }

  @override
  set shareCertificateID(String value) {
    _$shareCertificateIDAtom.reportWrite(value, super.shareCertificateID, () {
      super.shareCertificateID = value;
    });
  }

  late final _$certificateListsFutureAtom = Atom(
      name: '_CertificateRequestStore.certificateListsFuture',
      context: context);

  @override
  ObservableFuture<CertificateLists?> get certificateListsFuture {
    _$certificateListsFutureAtom.reportRead();
    return super.certificateListsFuture;
  }

  @override
  set certificateListsFuture(ObservableFuture<CertificateLists?> value) {
    _$certificateListsFutureAtom
        .reportWrite(value, super.certificateListsFuture, () {
      super.certificateListsFuture = value;
    });
  }

  late final _$certificateListsAtom =
      Atom(name: '_CertificateRequestStore.certificateLists', context: context);

  @override
  ObservableList<Certificate> get certificateLists {
    _$certificateListsAtom.reportRead();
    return super.certificateLists;
  }

  @override
  set certificateLists(ObservableList<Certificate> value) {
    _$certificateListsAtom.reportWrite(value, super.certificateLists, () {
      super.certificateLists = value;
    });
  }

  late final _$universityListsAtom =
      Atom(name: '_CertificateRequestStore.universityLists', context: context);

  @override
  ObservableList<University> get universityLists {
    _$universityListsAtom.reportRead();
    return super.universityLists;
  }

  @override
  set universityLists(ObservableList<University> value) {
    _$universityListsAtom.reportWrite(value, super.universityLists, () {
      super.universityLists = value;
    });
  }

  late final _$universityListsFutureAtom = Atom(
      name: '_CertificateRequestStore.universityListsFuture', context: context);

  @override
  ObservableFuture<UniversityLists?> get universityListsFuture {
    _$universityListsFutureAtom.reportRead();
    return super.universityListsFuture;
  }

  @override
  set universityListsFuture(ObservableFuture<UniversityLists?> value) {
    _$universityListsFutureAtom.reportWrite(value, super.universityListsFuture,
        () {
      super.universityListsFuture = value;
    });
  }

  late final _$shareCertificateFutureAtom = Atom(
      name: '_CertificateRequestStore.shareCertificateFuture',
      context: context);

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

  late final _$createRequestFutureAtom = Atom(
      name: '_CertificateRequestStore.createRequestFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get createRequestFuture {
    _$createRequestFutureAtom.reportRead();
    return super.createRequestFuture;
  }

  @override
  set createRequestFuture(ObservableFuture<ApiResponse?> value) {
    _$createRequestFutureAtom.reportWrite(value, super.createRequestFuture, () {
      super.createRequestFuture = value;
    });
  }

  late final _$departmentListsFutureAtom = Atom(
      name: '_CertificateRequestStore.departmentListsFuture', context: context);

  @override
  ObservableFuture<DepartmentLists?> get departmentListsFuture {
    _$departmentListsFutureAtom.reportRead();
    return super.departmentListsFuture;
  }

  @override
  set departmentListsFuture(ObservableFuture<DepartmentLists?> value) {
    _$departmentListsFutureAtom.reportWrite(value, super.departmentListsFuture,
        () {
      super.departmentListsFuture = value;
    });
  }

  late final _$departmentListsAtom =
      Atom(name: '_CertificateRequestStore.departmentLists', context: context);

  @override
  ObservableList<Department> get departmentLists {
    _$departmentListsAtom.reportRead();
    return super.departmentLists;
  }

  @override
  set departmentLists(ObservableList<Department> value) {
    _$departmentListsAtom.reportWrite(value, super.departmentLists, () {
      super.departmentLists = value;
    });
  }

  late final _$allRecievedRequestListsAtom = Atom(
      name: '_CertificateRequestStore.allRecievedRequestLists',
      context: context);

  @override
  ObservableList<RecievedRequest> get allRecievedRequestLists {
    _$allRecievedRequestListsAtom.reportRead();
    return super.allRecievedRequestLists;
  }

  @override
  set allRecievedRequestLists(ObservableList<RecievedRequest> value) {
    _$allRecievedRequestListsAtom
        .reportWrite(value, super.allRecievedRequestLists, () {
      super.allRecievedRequestLists = value;
    });
  }

  late final _$allRequestListsFutureAtom = Atom(
      name: '_CertificateRequestStore.allRequestListsFuture', context: context);

  @override
  ObservableFuture<RecievedRequestLists?> get allRequestListsFuture {
    _$allRequestListsFutureAtom.reportRead();
    return super.allRequestListsFuture;
  }

  @override
  set allRequestListsFuture(ObservableFuture<RecievedRequestLists?> value) {
    _$allRequestListsFutureAtom.reportWrite(value, super.allRequestListsFuture,
        () {
      super.allRequestListsFuture = value;
    });
  }

  late final _$certificatePdfLinkAtom = Atom(
      name: '_CertificateRequestStore.certificatePdfLink', context: context);

  @override
  String get certificatePdfLink {
    _$certificatePdfLinkAtom.reportRead();
    return super.certificatePdfLink;
  }

  @override
  set certificatePdfLink(String value) {
    _$certificatePdfLinkAtom.reportWrite(value, super.certificatePdfLink, () {
      super.certificatePdfLink = value;
    });
  }

  late final _$certificatePdfLinkFutureAtom = Atom(
      name: '_CertificateRequestStore.certificatePdfLinkFuture',
      context: context);

  @override
  ObservableFuture<ApiResponse?> get certificatePdfLinkFuture {
    _$certificatePdfLinkFutureAtom.reportRead();
    return super.certificatePdfLinkFuture;
  }

  @override
  set certificatePdfLinkFuture(ObservableFuture<ApiResponse?> value) {
    _$certificatePdfLinkFutureAtom
        .reportWrite(value, super.certificatePdfLinkFuture, () {
      super.certificatePdfLinkFuture = value;
    });
  }

  late final _$envelopesLinkAtom =
      Atom(name: '_CertificateRequestStore.envelopesLink', context: context);

  @override
  String get envelopesLink {
    _$envelopesLinkAtom.reportRead();
    return super.envelopesLink;
  }

  @override
  set envelopesLink(String value) {
    _$envelopesLinkAtom.reportWrite(value, super.envelopesLink, () {
      super.envelopesLink = value;
    });
  }

  late final _$envelopesLinkFutureAtom = Atom(
      name: '_CertificateRequestStore.envelopesLinkFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get envelopesLinkFuture {
    _$envelopesLinkFutureAtom.reportRead();
    return super.envelopesLinkFuture;
  }

  @override
  set envelopesLinkFuture(ObservableFuture<ApiResponse?> value) {
    _$envelopesLinkFutureAtom.reportWrite(value, super.envelopesLinkFuture, () {
      super.envelopesLinkFuture = value;
    });
  }

  late final _$employeesRequestDeclinedFutureAtom = Atom(
      name: '_CertificateRequestStore.employeesRequestDeclinedFuture',
      context: context);

  @override
  ObservableFuture<ApiResponse?> get employeesRequestDeclinedFuture {
    _$employeesRequestDeclinedFutureAtom.reportRead();
    return super.employeesRequestDeclinedFuture;
  }

  @override
  set employeesRequestDeclinedFuture(ObservableFuture<ApiResponse?> value) {
    _$employeesRequestDeclinedFutureAtom
        .reportWrite(value, super.employeesRequestDeclinedFuture, () {
      super.employeesRequestDeclinedFuture = value;
    });
  }

  late final _$studentRequestListsFutureAtom = Atom(
      name: '_CertificateRequestStore.studentRequestListsFuture',
      context: context);

  @override
  ObservableFuture<StudentRequestLists?> get studentRequestListsFuture {
    _$studentRequestListsFutureAtom.reportRead();
    return super.studentRequestListsFuture;
  }

  @override
  set studentRequestListsFuture(ObservableFuture<StudentRequestLists?> value) {
    _$studentRequestListsFutureAtom
        .reportWrite(value, super.studentRequestListsFuture, () {
      super.studentRequestListsFuture = value;
    });
  }

  late final _$studentRequestListsAtom = Atom(
      name: '_CertificateRequestStore.studentRequestLists', context: context);

  @override
  ObservableList<StudentRequest> get studentRequestLists {
    _$studentRequestListsAtom.reportRead();
    return super.studentRequestLists;
  }

  @override
  set studentRequestLists(ObservableList<StudentRequest> value) {
    _$studentRequestListsAtom.reportWrite(value, super.studentRequestLists, () {
      super.studentRequestLists = value;
    });
  }

  late final _$getCertificateListsAsyncAction = AsyncAction(
      '_CertificateRequestStore.getCertificateLists',
      context: context);

  @override
  Future<dynamic> getCertificateLists(String? id) {
    return _$getCertificateListsAsyncAction
        .run(() => super.getCertificateLists(id));
  }

  late final _$getUniversityListAsyncAction = AsyncAction(
      '_CertificateRequestStore.getUniversityList',
      context: context);

  @override
  Future<dynamic> getUniversityList(String id) {
    return _$getUniversityListAsyncAction
        .run(() => super.getUniversityList(id));
  }

  late final _$shareCertificateAsyncAction = AsyncAction(
      '_CertificateRequestStore.shareCertificate',
      context: context);

  @override
  Future<ApiResponse?> shareCertificate(String email, String certificateId) {
    return _$shareCertificateAsyncAction
        .run(() => super.shareCertificate(email, certificateId));
  }

  late final _$createCertificateRequestAsyncAction = AsyncAction(
      '_CertificateRequestStore.createCertificateRequest',
      context: context);

  @override
  Future<ApiResponse?> createCertificateRequest(String receiverId,
      String requestType, int status, String remark, String graduationYear) {
    return _$createCertificateRequestAsyncAction.run(() => super
        .createCertificateRequest(
            receiverId, requestType, status, remark, graduationYear));
  }

  late final _$getDepartmentListByIDAsyncAction = AsyncAction(
      '_CertificateRequestStore.getDepartmentListByID',
      context: context);

  @override
  Future<dynamic> getDepartmentListByID(String id) {
    return _$getDepartmentListByIDAsyncAction
        .run(() => super.getDepartmentListByID(id));
  }

  late final _$getAllRequestListsAsyncAction = AsyncAction(
      '_CertificateRequestStore.getAllRequestLists',
      context: context);

  @override
  Future<dynamic> getAllRequestLists(String receiverID) {
    return _$getAllRequestListsAsyncAction
        .run(() => super.getAllRequestLists(receiverID));
  }

  late final _$getCertificatePdfLinkByIDAsyncAction = AsyncAction(
      '_CertificateRequestStore.getCertificatePdfLinkByID',
      context: context);

  @override
  Future<ApiResponse?> getCertificatePdfLinkByID(String id) {
    return _$getCertificatePdfLinkByIDAsyncAction
        .run(() => super.getCertificatePdfLinkByID(id));
  }

  late final _$getEnvelopesLinkByIDAsyncAction = AsyncAction(
      '_CertificateRequestStore.getEnvelopesLinkByID',
      context: context);

  @override
  Future<ApiResponse?> getEnvelopesLinkByID(String id) {
    return _$getEnvelopesLinkByIDAsyncAction
        .run(() => super.getEnvelopesLinkByID(id));
  }

  late final _$employeesRequestDeclinedAsyncAction = AsyncAction(
      '_CertificateRequestStore.employeesRequestDeclined',
      context: context);

  @override
  Future<ApiResponse?> employeesRequestDeclined(String id) {
    return _$employeesRequestDeclinedAsyncAction
        .run(() => super.employeesRequestDeclined(id));
  }

  late final _$getStudentRequestAsyncAction = AsyncAction(
      '_CertificateRequestStore.getStudentRequest',
      context: context);

  @override
  Future<dynamic> getStudentRequest(String guid) {
    return _$getStudentRequestAsyncAction
        .run(() => super.getStudentRequest(guid));
  }

  late final _$_CertificateRequestStoreActionController =
      ActionController(name: '_CertificateRequestStore', context: context);

  @override
  void setShareCertificateID(String value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setShareCertificateID');
    try {
      return super.setShareCertificateID(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectYears(String value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setSelectYears');
    try {
      return super.setSelectYears(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageNumber() {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.changePageNumber');
    try {
      return super.changePageNumber();
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectUniversity(University value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setSelectUniversity');
    try {
      return super.setSelectUniversity(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectDepartment(Department value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setSelectDepartment');
    try {
      return super.setSelectDepartment(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenderEmail(String value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setSenderEmail');
    try {
      return super.setSenderEmail(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReceiverEmail(String value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setReceiverEmail');
    try {
      return super.setReceiverEmail(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsReceiverPay(bool value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setIsReceiverPay');
    try {
      return super.setIsReceiverPay(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsPayingInAdvance(bool value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setIsPayingInAdvance');
    try {
      return super.setIsPayingInAdvance(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSplitPayment(bool value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setIsSplitPayment');
    try {
      return super.setIsSplitPayment(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCertificate(CertificateDetails value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setSelectedCertificate');
    try {
      return super.setSelectedCertificate(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedCertificateID(CertificateDetails value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.removeSelectedCertificateID');
    try {
      return super.removeSelectedCertificateID(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCertificateLists(Certificate value) {
    final _$actionInfo = _$_CertificateRequestStoreActionController.startAction(
        name: '_CertificateRequestStore.setCertificateLists');
    try {
      return super.setCertificateLists(value);
    } finally {
      _$_CertificateRequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
senderEmail: ${senderEmail},
currentPage: ${currentPage},
receiverEmail: ${receiverEmail},
selectedCertificate: ${selectedCertificate},
envelopesList: ${envelopesList},
envelopeName: ${envelopeName},
isPayingInAdvance: ${isPayingInAdvance},
isSplitPayment: ${isSplitPayment},
isReceiverPay: ${isReceiverPay},
selectUniversity: ${selectUniversity},
selectDepartment: ${selectDepartment},
selectedYears: ${selectedYears},
shareCertificateID: ${shareCertificateID},
certificateListsFuture: ${certificateListsFuture},
certificateLists: ${certificateLists},
universityLists: ${universityLists},
universityListsFuture: ${universityListsFuture},
shareCertificateFuture: ${shareCertificateFuture},
createRequestFuture: ${createRequestFuture},
departmentListsFuture: ${departmentListsFuture},
departmentLists: ${departmentLists},
allRecievedRequestLists: ${allRecievedRequestLists},
allRequestListsFuture: ${allRequestListsFuture},
certificatePdfLink: ${certificatePdfLink},
certificatePdfLinkFuture: ${certificatePdfLinkFuture},
envelopesLink: ${envelopesLink},
envelopesLinkFuture: ${envelopesLinkFuture},
employeesRequestDeclinedFuture: ${employeesRequestDeclinedFuture},
studentRequestListsFuture: ${studentRequestListsFuture},
studentRequestLists: ${studentRequestLists},
selectedCertificateLength: ${selectedCertificateLength},
isCertificateLoading: ${isCertificateLoading},
isUniversityLoading: ${isUniversityLoading},
isShareCertificateLoading: ${isShareCertificateLoading},
isCreateCertificateRequestLoading: ${isCreateCertificateRequestLoading},
isDepartmentListsByIDLoading: ${isDepartmentListsByIDLoading},
isAllRequestListsLoading: ${isAllRequestListsLoading},
isCertificatePdfLinkByIDLoading: ${isCertificatePdfLinkByIDLoading},
isEnvelopesByIDLoading: ${isEnvelopesByIDLoading},
isEmployeesRequestDeclinedLoading: ${isEmployeesRequestDeclinedLoading},
isStudentRequestLoading: ${isStudentRequestLoading}
    ''';
  }
}
