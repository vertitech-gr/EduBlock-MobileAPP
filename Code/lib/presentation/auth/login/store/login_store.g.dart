// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$canVerifyOTPComputed;

  @override
  bool get canVerifyOTP =>
      (_$canVerifyOTPComputed ??= Computed<bool>(() => super.canVerifyOTP,
              name: '_UserStore.canVerifyOTP'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_UserStore.isLoading'))
      .value;
  Computed<bool>? _$isRegisterLoadingComputed;

  @override
  bool get isRegisterLoading => (_$isRegisterLoadingComputed ??= Computed<bool>(
          () => super.isRegisterLoading,
          name: '_UserStore.isRegisterLoading'))
      .value;
  Computed<bool>? _$isForgetPasswordLoadingComputed;

  @override
  bool get isForgetPasswordLoading => (_$isForgetPasswordLoadingComputed ??=
          Computed<bool>(() => super.isForgetPasswordLoading,
              name: '_UserStore.isForgetPasswordLoading'))
      .value;
  Computed<bool>? _$isNewPasswordSetLoadingComputed;

  @override
  bool get isNewPasswordSetLoading => (_$isNewPasswordSetLoadingComputed ??=
          Computed<bool>(() => super.isNewPasswordSetLoading,
              name: '_UserStore.isNewPasswordSetLoading'))
      .value;
  Computed<bool>? _$isOtpVerifyLoadingComputed;

  @override
  bool get isOtpVerifyLoading => (_$isOtpVerifyLoadingComputed ??=
          Computed<bool>(() => super.isOtpVerifyLoading,
              name: '_UserStore.isOtpVerifyLoading'))
      .value;
  Computed<bool>? _$isResendOtpLoadingComputed;

  @override
  bool get isResendOtpLoading => (_$isResendOtpLoadingComputed ??=
          Computed<bool>(() => super.isResendOtpLoading,
              name: '_UserStore.isResendOtpLoading'))
      .value;
  Computed<bool>? _$isChangePasswordLoadingComputed;

  @override
  bool get isChangePasswordLoading => (_$isChangePasswordLoadingComputed ??=
          Computed<bool>(() => super.isChangePasswordLoading,
              name: '_UserStore.isChangePasswordLoading'))
      .value;

  late final _$authTokenAtom =
      Atom(name: '_UserStore.authToken', context: context);

  @override
  String? get authToken {
    _$authTokenAtom.reportRead();
    return super.authToken;
  }

  @override
  set authToken(String? value) {
    _$authTokenAtom.reportWrite(value, super.authToken, () {
      super.authToken = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_UserStore.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$successAtom = Atom(name: '_UserStore.success', context: context);

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

  late final _$registerAuthTokenAtom =
      Atom(name: '_UserStore.registerAuthToken', context: context);

  @override
  String get registerAuthToken {
    _$registerAuthTokenAtom.reportRead();
    return super.registerAuthToken;
  }

  @override
  set registerAuthToken(String value) {
    _$registerAuthTokenAtom.reportWrite(value, super.registerAuthToken, () {
      super.registerAuthToken = value;
    });
  }

  late final _$otpAtom = Atom(name: '_UserStore.otp', context: context);

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

  late final _$userEmailAtom =
      Atom(name: '_UserStore.userEmail', context: context);

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

  late final _$currentTimeAtom =
      Atom(name: '_UserStore.currentTime', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_UserStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$verifyOTPLoadingAtom =
      Atom(name: '_UserStore.verifyOTPLoading', context: context);

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
      Atom(name: '_UserStore.verifyOTPSuccess', context: context);

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
      Atom(name: '_UserStore.resendOTPLoading', context: context);

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
      Atom(name: '_UserStore.resendOTPSuccess', context: context);

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

  late final _$userSearchAtom =
      Atom(name: '_UserStore.userSearch', context: context);

  @override
  String get userSearch {
    _$userSearchAtom.reportRead();
    return super.userSearch;
  }

  @override
  set userSearch(String value) {
    _$userSearchAtom.reportWrite(value, super.userSearch, () {
      super.userSearch = value;
    });
  }

  late final _$selectedUserAtom =
      Atom(name: '_UserStore.selectedUser', context: context);

  @override
  List<String> get selectedUser {
    _$selectedUserAtom.reportRead();
    return super.selectedUser;
  }

  @override
  set selectedUser(List<String> value) {
    _$selectedUserAtom.reportWrite(value, super.selectedUser, () {
      super.selectedUser = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_UserStore.loginFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<ApiResponse?> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$registerFutureAtom =
      Atom(name: '_UserStore.registerFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get registerFuture {
    _$registerFutureAtom.reportRead();
    return super.registerFuture;
  }

  @override
  set registerFuture(ObservableFuture<ApiResponse?> value) {
    _$registerFutureAtom.reportWrite(value, super.registerFuture, () {
      super.registerFuture = value;
    });
  }

  late final _$forgotPasswordFutureAtom =
      Atom(name: '_UserStore.forgotPasswordFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get forgotPasswordFuture {
    _$forgotPasswordFutureAtom.reportRead();
    return super.forgotPasswordFuture;
  }

  @override
  set forgotPasswordFuture(ObservableFuture<ApiResponse?> value) {
    _$forgotPasswordFutureAtom.reportWrite(value, super.forgotPasswordFuture,
        () {
      super.forgotPasswordFuture = value;
    });
  }

  late final _$newPasswordFutureAtom =
      Atom(name: '_UserStore.newPasswordFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get newPasswordFuture {
    _$newPasswordFutureAtom.reportRead();
    return super.newPasswordFuture;
  }

  @override
  set newPasswordFuture(ObservableFuture<ApiResponse?> value) {
    _$newPasswordFutureAtom.reportWrite(value, super.newPasswordFuture, () {
      super.newPasswordFuture = value;
    });
  }

  late final _$otpVerifyFutureAtom =
      Atom(name: '_UserStore.otpVerifyFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get otpVerifyFuture {
    _$otpVerifyFutureAtom.reportRead();
    return super.otpVerifyFuture;
  }

  @override
  set otpVerifyFuture(ObservableFuture<ApiResponse?> value) {
    _$otpVerifyFutureAtom.reportWrite(value, super.otpVerifyFuture, () {
      super.otpVerifyFuture = value;
    });
  }

  late final _$resendOtpFutureAtom =
      Atom(name: '_UserStore.resendOtpFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get resendOtpFuture {
    _$resendOtpFutureAtom.reportRead();
    return super.resendOtpFuture;
  }

  @override
  set resendOtpFuture(ObservableFuture<ApiResponse?> value) {
    _$resendOtpFutureAtom.reportWrite(value, super.resendOtpFuture, () {
      super.resendOtpFuture = value;
    });
  }

  late final _$isLogoutLoadingAtom =
      Atom(name: '_UserStore.isLogoutLoading', context: context);

  @override
  bool get isLogoutLoading {
    _$isLogoutLoadingAtom.reportRead();
    return super.isLogoutLoading;
  }

  @override
  set isLogoutLoading(bool value) {
    _$isLogoutLoadingAtom.reportWrite(value, super.isLogoutLoading, () {
      super.isLogoutLoading = value;
    });
  }

  late final _$changePasswordFutureAtom =
      Atom(name: '_UserStore.changePasswordFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get changePasswordFuture {
    _$changePasswordFutureAtom.reportRead();
    return super.changePasswordFuture;
  }

  @override
  set changePasswordFuture(ObservableFuture<ApiResponse?> value) {
    _$changePasswordFutureAtom.reportWrite(value, super.changePasswordFuture,
        () {
      super.changePasswordFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<ApiResponse?> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_UserStore.register', context: context);

  @override
  Future<ApiResponse?> register(
      String userName, String password, String email) {
    return _$registerAsyncAction
        .run(() => super.register(userName, password, email));
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('_UserStore.forgotPassword', context: context);

  @override
  Future<ApiResponse?> forgotPassword(String email) {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword(email));
  }

  late final _$newPasswordAsyncAction =
      AsyncAction('_UserStore.newPassword', context: context);

  @override
  Future<ApiResponse?> newPassword(String key, String otp, String password) {
    return _$newPasswordAsyncAction
        .run(() => super.newPassword(key, otp, password));
  }

  late final _$OTPVerificationAsyncAction =
      AsyncAction('_UserStore.OTPVerification', context: context);

  @override
  Future<ApiResponse?> OTPVerification(String key, String otp) {
    return _$OTPVerificationAsyncAction
        .run(() => super.OTPVerification(key, otp));
  }

  late final _$resendOtpAsyncAction =
      AsyncAction('_UserStore.resendOtp', context: context);

  @override
  Future<dynamic> resendOtp(String email) {
    return _$resendOtpAsyncAction.run(() => super.resendOtp(email));
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_UserStore.changePassword', context: context);

  @override
  Future<dynamic> changePassword(String existingPassword, String newPassword) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(existingPassword, newPassword));
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setSelectedUser(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setSelectedUser');
    try {
      return super.setSelectedUser(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserSearch(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserSearch');
    try {
      return super.setUserSearch(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserEmailID(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserEmailID');
    try {
      return super.setUserEmailID(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authToken: ${authToken},
currentUser: ${currentUser},
success: ${success},
registerAuthToken: ${registerAuthToken},
otp: ${otp},
userEmail: ${userEmail},
currentTime: ${currentTime},
errorMessage: ${errorMessage},
verifyOTPLoading: ${verifyOTPLoading},
verifyOTPSuccess: ${verifyOTPSuccess},
resendOTPLoading: ${resendOTPLoading},
resendOTPSuccess: ${resendOTPSuccess},
userSearch: ${userSearch},
selectedUser: ${selectedUser},
loginFuture: ${loginFuture},
registerFuture: ${registerFuture},
forgotPasswordFuture: ${forgotPasswordFuture},
newPasswordFuture: ${newPasswordFuture},
otpVerifyFuture: ${otpVerifyFuture},
resendOtpFuture: ${resendOtpFuture},
isLogoutLoading: ${isLogoutLoading},
changePasswordFuture: ${changePasswordFuture},
canVerifyOTP: ${canVerifyOTP},
isLoading: ${isLoading},
isRegisterLoading: ${isRegisterLoading},
isForgetPasswordLoading: ${isForgetPasswordLoading},
isNewPasswordSetLoading: ${isNewPasswordSetLoading},
isOtpVerifyLoading: ${isOtpVerifyLoading},
isResendOtpLoading: ${isResendOtpLoading},
isChangePasswordLoading: ${isChangePasswordLoading}
    ''';
  }
}
