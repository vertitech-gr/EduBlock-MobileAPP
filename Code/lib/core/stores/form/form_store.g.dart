// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$canVerifyOTPComputed;

  @override
  bool get canVerifyOTP =>
      (_$canVerifyOTPComputed ??= Computed<bool>(() => super.canVerifyOTP,
              name: '_FormStore.canVerifyOTP'))
          .value;
  Computed<bool>? _$canChangePasswordComputed;

  @override
  bool get canChangePassword => (_$canChangePasswordComputed ??= Computed<bool>(
          () => super.canChangePassword,
          name: '_FormStore.canChangePassword'))
      .value;
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_FormStore.canLogin'))
      .value;
  Computed<bool>? _$canCreateEnvelopesComputed;

  @override
  bool get canCreateEnvelopes => (_$canCreateEnvelopesComputed ??=
          Computed<bool>(() => super.canCreateEnvelopes,
              name: '_FormStore.canCreateEnvelopes'))
      .value;
  Computed<bool>? _$canSetNewPasswordComputed;

  @override
  bool get canSetNewPassword => (_$canSetNewPasswordComputed ??= Computed<bool>(
          () => super.canSetNewPassword,
          name: '_FormStore.canSetNewPassword'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_FormStore.canRegister'))
          .value;
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_FormStore.canForgetPassword'))
      .value;
  Computed<bool>? _$canShareCertificateComputed;

  @override
  bool get canShareCertificate => (_$canShareCertificateComputed ??=
          Computed<bool>(() => super.canShareCertificate,
              name: '_FormStore.canShareCertificate'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_FormStore.userEmail', context: context);

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

  late final _$envelopeNameAtom =
      Atom(name: '_FormStore.envelopeName', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$newPasswordAtom =
      Atom(name: '_FormStore.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$userFullNameAtom =
      Atom(name: '_FormStore.userFullName', context: context);

  @override
  String get userFullName {
    _$userFullNameAtom.reportRead();
    return super.userFullName;
  }

  @override
  set userFullName(String value) {
    _$userFullNameAtom.reportWrite(value, super.userFullName, () {
      super.userFullName = value;
    });
  }

  late final _$contactAtom = Atom(name: '_FormStore.contact', context: context);

  @override
  String get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$successAtom = Atom(name: '_FormStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$visibilityAtom =
      Atom(name: '_FormStore.visibility', context: context);

  @override
  bool get visibility {
    _$visibilityAtom.reportRead();
    return super.visibility;
  }

  @override
  set visibility(bool value) {
    _$visibilityAtom.reportWrite(value, super.visibility, () {
      super.visibility = value;
    });
  }

  late final _$newPasswordVisibilityAtom =
      Atom(name: '_FormStore.newPasswordVisibility', context: context);

  @override
  bool get newPasswordVisibility {
    _$newPasswordVisibilityAtom.reportRead();
    return super.newPasswordVisibility;
  }

  @override
  set newPasswordVisibility(bool value) {
    _$newPasswordVisibilityAtom.reportWrite(value, super.newPasswordVisibility,
        () {
      super.newPasswordVisibility = value;
    });
  }

  late final _$otpAtom = Atom(name: '_FormStore.otp', context: context);

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  late final _$currentTimeAtom =
      Atom(name: '_FormStore.currentTime', context: context);

  @override
  int get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(int value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  late final _$verifyOTPLoadingAtom =
      Atom(name: '_FormStore.verifyOTPLoading', context: context);

  @override
  bool get verifyOTPLoading {
    _$verifyOTPLoadingAtom.reportRead();
    return super.verifyOTPLoading;
  }

  @override
  set verifyOTPLoading(bool value) {
    _$verifyOTPLoadingAtom.reportWrite(value, super.verifyOTPLoading, () {
      super.verifyOTPLoading = value;
    });
  }

  late final _$verifyOTPSuccessAtom =
      Atom(name: '_FormStore.verifyOTPSuccess', context: context);

  @override
  bool get verifyOTPSuccess {
    _$verifyOTPSuccessAtom.reportRead();
    return super.verifyOTPSuccess;
  }

  @override
  set verifyOTPSuccess(bool value) {
    _$verifyOTPSuccessAtom.reportWrite(value, super.verifyOTPSuccess, () {
      super.verifyOTPSuccess = value;
    });
  }

  late final _$resendOTPLoadingAtom =
      Atom(name: '_FormStore.resendOTPLoading', context: context);

  @override
  bool get resendOTPLoading {
    _$resendOTPLoadingAtom.reportRead();
    return super.resendOTPLoading;
  }

  @override
  set resendOTPLoading(bool value) {
    _$resendOTPLoadingAtom.reportWrite(value, super.resendOTPLoading, () {
      super.resendOTPLoading = value;
    });
  }

  late final _$resendOTPSuccessAtom =
      Atom(name: '_FormStore.resendOTPSuccess', context: context);

  @override
  bool get resendOTPSuccess {
    _$resendOTPSuccessAtom.reportRead();
    return super.resendOTPSuccess;
  }

  @override
  set resendOTPSuccess(bool value) {
    _$resendOTPSuccessAtom.reportWrite(value, super.resendOTPSuccess, () {
      super.resendOTPSuccess = value;
    });
  }

  late final _$isRegistrationTermConditionAtom =
      Atom(name: '_FormStore.isRegistrationTermCondition', context: context);

  @override
  bool get isRegistrationTermCondition {
    _$isRegistrationTermConditionAtom.reportRead();
    return super.isRegistrationTermCondition;
  }

  @override
  set isRegistrationTermCondition(bool value) {
    _$isRegistrationTermConditionAtom
        .reportWrite(value, super.isRegistrationTermCondition, () {
      super.isRegistrationTermCondition = value;
    });
  }

  late final _$confirmVisibilityAtom =
      Atom(name: '_FormStore.confirmVisibility', context: context);

  @override
  bool get confirmVisibility {
    _$confirmVisibilityAtom.reportRead();
    return super.confirmVisibility;
  }

  @override
  set confirmVisibility(bool value) {
    _$confirmVisibilityAtom.reportWrite(value, super.confirmVisibility, () {
      super.confirmVisibility = value;
    });
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setEnvelopesName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setEnvelopesName');
    try {
      return super.setEnvelopesName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserId(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setContact');
    try {
      return super.setContact(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserFullName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setUserFullName');
    try {
      return super.setUserFullName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleVisibility() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.handleVisibility');
    try {
      return super.handleVisibility();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleNewPasswordVisibility() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.handleNewPasswordVisibility');
    try {
      return super.handleNewPasswordVisibility();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleConfirmVisibility() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.handleConfirmVisibility');
    try {
      return super.handleConfirmVisibility();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleRegsTermConditon() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.handleRegsTermConditon');
    try {
      return super.handleRegsTermConditon();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setForgetPasswordOtp(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setForgetPasswordOtp');
    try {
      return super.setForgetPasswordOtp(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateContact(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateContact');
    try {
      return super.validateContact(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNewPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateNewPassword');
    try {
      return super.validateNewPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEnvelopeName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateEnvelopeName');
    try {
      return super.validateEnvelopeName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserFullName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUserFullName');
    try {
      return super.validateUserFullName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOTP(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateOTP');
    try {
      return super.validateOTP(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
envelopeName: ${envelopeName},
password: ${password},
confirmPassword: ${confirmPassword},
newPassword: ${newPassword},
userFullName: ${userFullName},
contact: ${contact},
success: ${success},
visibility: ${visibility},
newPasswordVisibility: ${newPasswordVisibility},
otp: ${otp},
currentTime: ${currentTime},
verifyOTPLoading: ${verifyOTPLoading},
verifyOTPSuccess: ${verifyOTPSuccess},
resendOTPLoading: ${resendOTPLoading},
resendOTPSuccess: ${resendOTPSuccess},
isRegistrationTermCondition: ${isRegistrationTermCondition},
confirmVisibility: ${confirmVisibility},
canVerifyOTP: ${canVerifyOTP},
canChangePassword: ${canChangePassword},
canLogin: ${canLogin},
canCreateEnvelopes: ${canCreateEnvelopes},
canSetNewPassword: ${canSetNewPassword},
canRegister: ${canRegister},
canForgetPassword: ${canForgetPassword},
canShareCertificate: ${canShareCertificate}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorInShareCertificateComputed;

  @override
  bool get hasErrorInShareCertificate =>
      (_$hasErrorInShareCertificateComputed ??= Computed<bool>(
              () => super.hasErrorInShareCertificate,
              name: '_FormErrorStore.hasErrorInShareCertificate'))
          .value;
  Computed<bool>? _$hasErrorInCreateEnvelopesComputed;

  @override
  bool get hasErrorInCreateEnvelopes => (_$hasErrorInCreateEnvelopesComputed ??=
          Computed<bool>(() => super.hasErrorInCreateEnvelopes,
              name: '_FormErrorStore.hasErrorInCreateEnvelopes'))
      .value;
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInChangePasswordComputed;

  @override
  bool get hasErrorsInChangePassword => (_$hasErrorsInChangePasswordComputed ??=
          Computed<bool>(() => super.hasErrorsInChangePassword,
              name: '_FormErrorStore.hasErrorsInChangePassword'))
      .value;
  Computed<bool>? _$hasErrorsInSetNewPasswordComputed;

  @override
  bool get hasErrorsInSetNewPassword => (_$hasErrorsInSetNewPasswordComputed ??=
          Computed<bool>(() => super.hasErrorsInSetNewPassword,
              name: '_FormErrorStore.hasErrorsInSetNewPassword'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;
  Computed<bool>? _$hasErrorInVerifyOTPComputed;

  @override
  bool get hasErrorInVerifyOTP => (_$hasErrorInVerifyOTPComputed ??=
          Computed<bool>(() => super.hasErrorInVerifyOTP,
              name: '_FormErrorStore.hasErrorInVerifyOTP'))
      .value;

  late final _$envelopeNameAtom =
      Atom(name: '_FormErrorStore.envelopeName', context: context);

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
      Atom(name: '_FormErrorStore.userEmail', context: context);

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

  late final _$userFullNameAtom =
      Atom(name: '_FormErrorStore.userFullName', context: context);

  @override
  String? get userFullName {
    _$userFullNameAtom.reportRead();
    return super.userFullName;
  }

  @override
  set userFullName(String? value) {
    _$userFullNameAtom.reportWrite(value, super.userFullName, () {
      super.userFullName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormErrorStore.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$newPasswordAtom =
      Atom(name: '_FormErrorStore.newPassword', context: context);

  @override
  String? get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String? value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$contactAtom =
      Atom(name: '_FormErrorStore.contact', context: context);

  @override
  String? get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String? value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$otpAtom = Atom(name: '_FormErrorStore.otp', context: context);

  @override
  String? get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String? value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  @override
  String toString() {
    return '''
envelopeName: ${envelopeName},
userEmail: ${userEmail},
userFullName: ${userFullName},
password: ${password},
confirmPassword: ${confirmPassword},
newPassword: ${newPassword},
contact: ${contact},
otp: ${otp},
hasErrorInShareCertificate: ${hasErrorInShareCertificate},
hasErrorInCreateEnvelopes: ${hasErrorInCreateEnvelopes},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInChangePassword: ${hasErrorsInChangePassword},
hasErrorsInSetNewPassword: ${hasErrorsInSetNewPassword},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword},
hasErrorInVerifyOTP: ${hasErrorInVerifyOTP}
    ''';
  }
}
