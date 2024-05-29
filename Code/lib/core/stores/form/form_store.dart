import 'package:edublock/core/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
      reaction((_) => userFullName, validateUserFullName),
      reaction((_) => otp, validateOTP),
      reaction((_) => newPassword, validateNewPassword),
      reaction((_) => envelopeName, validateEnvelopeName),

    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String envelopeName = '';


  @observable
  String password = '';

  @observable
  String confirmPassword = '';
 @observable
  String newPassword = '';

  @observable
  String userFullName = '';

  @observable
  String contact = '';


  @observable
  bool success = false;
  @observable
  bool visibility = false;

  @observable
  bool newPasswordVisibility = false;

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


  @computed
  bool get canChangePassword =>
      !formErrorStore.hasErrorsInChangePassword && password.isNotEmpty  && newPassword.isNotEmpty;


  @observable
  bool isRegistrationTermCondition = false;

  @observable
  bool confirmVisibility = false;


  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && password.isNotEmpty;
@computed
  bool get canCreateEnvelopes =>
      !formErrorStore.hasErrorInCreateEnvelopes && envelopeName.isNotEmpty ;

  @computed
  bool get canSetNewPassword =>
      !formErrorStore.hasErrorsInSetNewPassword && confirmPassword.isNotEmpty && password.isNotEmpty && otp.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
          isRegistrationTermCondition &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&

      userFullName.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;


  @computed
  bool get canShareCertificate =>
      !formErrorStore.hasErrorInShareCertificate && userEmail.isNotEmpty;


  // actions:-------------------------------------------------------------------
  @action
  void setEnvelopesName(String value) {
    envelopeName = value;
  }

  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void setContact(String value) {
    contact = value;
  }

  @action
  void setNewPassword(String value) {
    newPassword = value;
  }

  @action
  void setUserFullName(String value) {
    userFullName = value;
  }

  @action
void handleVisibility(){
    visibility = !visibility;
  }
  @action
void handleNewPasswordVisibility(){
    newPasswordVisibility = !newPasswordVisibility;
    ;
  }

  @action
  void handleConfirmVisibility(){
    confirmVisibility = !confirmVisibility;
  }
  @action
  void handleRegsTermConditon(){
    isRegistrationTermCondition = !isRegistrationTermCondition;
  }

  @action
  void setForgetPasswordOtp(String value){
    otp = value;
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

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateContact(String value) {
    if (value.isEmpty) {
      formErrorStore.contact = "Contact number  can't be empty";
    } else if (value.length < 10) {
      formErrorStore.contact = "Enter valid contact number";
    } else {
      formErrorStore.password = null;
    }
  }


  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doesn't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  void validateNewPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.newPassword = "New Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.newPassword = "New Password must be at-least 6 characters long";
    } else {
      formErrorStore.newPassword = null;
    }
  }


  @action
  void validateEnvelopeName(String value) {
    // RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      formErrorStore.userFullName = "Name can't be empty";
    }else
    {
      formErrorStore.userFullName = null;
    }
  }





  @action
  void validateUserFullName(String value) {
    RegExp fullNameRegExp = RegExp(r"^[a-zA-Z]$");

    if (value.isEmpty) {
      print('check value is empty');
      formErrorStore.userFullName = "Name can't be empty";
    }else if(fullNameRegExp.hasMatch(value)) {
      formErrorStore.userFullName = "Please enter valid name";

    }else
   {
      print('check here value are $value');
      formErrorStore.userFullName = null;
    }
  }


  @action
  void validateOTP(String value) {
    if (value.isEmpty) {
      formErrorStore.otp = "Please enter the OTP.";
    } else if (value.contains('-') || value.contains(' ')) {
      formErrorStore.otp = 'Invalid OTP format.';
    } else if (value.length < 6) {
      formErrorStore.otp = 'Invalid OTP length.';
    } else {
      formErrorStore.otp = null;
    }
  }


  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
    validateUserFullName(userFullName);
    validateConfirmPassword(confirmPassword);
    validateOTP(otp);
    validateNewPassword(newPassword);
    validateEnvelopeName(envelopeName);

  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? envelopeName;

  @observable
  String? userEmail;

  @observable
  String? userFullName;

  @observable
  String? password;

  @observable
  String? confirmPassword;
 @observable
  String? newPassword;

  @observable
  String? contact;


  @observable
  String? otp;


  @computed
  bool get hasErrorInShareCertificate => userEmail!=null;


  @computed
  bool get hasErrorInCreateEnvelopes => envelopeName!=null;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;
@computed
  bool get hasErrorsInChangePassword => newPassword != null || password != null;


  @computed
  bool get hasErrorsInSetNewPassword => confirmPassword != null || password != null || otp !=null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || userFullName != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;

  @computed
  bool get hasErrorInVerifyOTP => otp != null && otp?.length == 6;
}
