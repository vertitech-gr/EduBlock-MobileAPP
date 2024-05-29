// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyOTPStore on _VerifyOTPStore, Store {
  Computed<bool>? _$canVerifyOTPComputed;

  @override
  bool get canVerifyOTP =>
      (_$canVerifyOTPComputed ??= Computed<bool>(() => super.canVerifyOTP,
              name: '_VerifyOTPStore.canVerifyOTP'))
          .value;

  late final _$otpAtom = Atom(name: '_VerifyOTPStore.otp', context: context);

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
      Atom(name: '_VerifyOTPStore.currentTime', context: context);

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
      Atom(name: '_VerifyOTPStore.verifyOTPLoading', context: context);

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
      Atom(name: '_VerifyOTPStore.verifyOTPSuccess', context: context);

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
      Atom(name: '_VerifyOTPStore.resendOTPLoading', context: context);

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
      Atom(name: '_VerifyOTPStore.resendOTPSuccess', context: context);

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

  late final _$verifyOTPAsyncAction =
      AsyncAction('_VerifyOTPStore.verifyOTP', context: context);

  @override
  Future<dynamic> verifyOTP() {
    return _$verifyOTPAsyncAction.run(() => super.verifyOTP());
  }

  late final _$resendOTPAsyncAction =
      AsyncAction('_VerifyOTPStore.resendOTP', context: context);

  @override
  Future<dynamic> resendOTP() {
    return _$resendOTPAsyncAction.run(() => super.resendOTP());
  }

  late final _$_VerifyOTPStoreActionController =
      ActionController(name: '_VerifyOTPStore', context: context);

  @override
  void setCurrentTime(int value) {
    final _$actionInfo = _$_VerifyOTPStoreActionController.startAction(
        name: '_VerifyOTPStore.setCurrentTime');
    try {
      return super.setCurrentTime(value);
    } finally {
      _$_VerifyOTPStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtp(String value) {
    final _$actionInfo = _$_VerifyOTPStoreActionController.startAction(
        name: '_VerifyOTPStore.setOtp');
    try {
      return super.setOtp(value);
    } finally {
      _$_VerifyOTPStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOTP(String value) {
    final _$actionInfo = _$_VerifyOTPStoreActionController.startAction(
        name: '_VerifyOTPStore.validateOTP');
    try {
      return super.validateOTP(value);
    } finally {
      _$_VerifyOTPStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
otp: ${otp},
currentTime: ${currentTime},
verifyOTPLoading: ${verifyOTPLoading},
verifyOTPSuccess: ${verifyOTPSuccess},
resendOTPLoading: ${resendOTPLoading},
resendOTPSuccess: ${resendOTPSuccess},
canVerifyOTP: ${canVerifyOTP}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorInVerifyOTPComputed;

  @override
  bool get hasErrorInVerifyOTP => (_$hasErrorInVerifyOTPComputed ??=
          Computed<bool>(() => super.hasErrorInVerifyOTP,
              name: '_FormErrorStore.hasErrorInVerifyOTP'))
      .value;

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
otp: ${otp},
hasErrorInVerifyOTP: ${hasErrorInVerifyOTP}
    ''';
  }
}
