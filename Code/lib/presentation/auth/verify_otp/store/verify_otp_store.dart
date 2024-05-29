
import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:mobx/mobx.dart';
part 'verify_otp_store.g.dart';


class VerifyOTPStore = _VerifyOTPStore
    with _$VerifyOTPStore;

abstract class _VerifyOTPStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  final UserStore _userStore = getIt.get<UserStore>();

  _VerifyOTPStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => otp, validateOTP),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String otp = '';

  @observable
  int currentTime = 0;

  @observable
  bool verifyOTPLoading = false;

  @observable
  bool verifyOTPSuccess = false;

  @observable
  bool resendOTPLoading = false;

  @observable
  bool resendOTPSuccess = false;

  @computed
  bool get canVerifyOTP =>
      !formErrorStore.hasErrorInVerifyOTP && otp.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setCurrentTime(int value) {
    currentTime = value;
  }

  @action
  void setOtp(String value) {
    otp = value;
  }

  @action
  void validateOTP(String value) {
    if (value.isEmpty) {
      formErrorStore.otp = "Please enter the OTP.";
    } else if (value.contains('-') || value.contains(' ')) {
      formErrorStore.otp = 'Invalid OTP format.';
    } else if (value.length < 4) {
      formErrorStore.otp = 'Invalid OTP length.';
    } else {
      formErrorStore.otp = null;
    }
  }

  @action
  Future verifyOTP() async {
    verifyOTPLoading = true;
    // await _userStore.otpForgetVerification(this.otp).then((value) {
    //   verifyOTPLoading = false;
    //   verifyOTPSuccess = true;
    // }).catchError((onError) {
    //   verifyOTPLoading = false;
    //   verifyOTPSuccess = false;
    //   throw onError;
    // });
  }
  @action
  Future resendOTP() async {
    resendOTPLoading = true;
    // await _userStore.otpResendVerification('forgot').then((value) {
    //   resendOTPLoading = false;
    //   resendOTPSuccess = true;
    // }).catchError((onError) {
    //   resendOTPLoading = false;
    //   resendOTPSuccess = false;
    //   throw onError;
    // });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateOTP(otp);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? otp;

  @computed
  bool get hasErrorInVerifyOTP => otp != null && otp?.length == 4;
}
