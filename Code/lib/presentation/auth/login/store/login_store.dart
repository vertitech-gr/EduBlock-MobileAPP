import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/domain/usecase/user/change_password_usecase.dart';
import 'package:edublock/domain/usecase/user/forgot_password_usecase.dart';
import 'package:edublock/domain/usecase/user/get_auth_token_usecase.dart';
import 'package:edublock/domain/usecase/user/get_user_usecase.dart';
import 'package:edublock/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:edublock/domain/usecase/user/login_usecase.dart';
import 'package:edublock/domain/usecase/user/new_password_usecase.dart';
import 'package:edublock/domain/usecase/user/otp_verification_usecase.dart';
import 'package:edublock/domain/usecase/user/register_usecase.dart';
import 'package:edublock/domain/usecase/user/remove_user_usecase.dart';
import 'package:edublock/domain/usecase/user/resend_otp_usecase.dart';
import 'package:edublock/domain/usecase/user/save_access_token_usecase.dart';
import 'package:edublock/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:edublock/domain/usecase/user/save_user_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(
      this._isLoggedInUseCase,
      this._saveLoginStatusUseCase,
      this._loginUseCase,
      this._registerUseCase,
      this.formErrorStore,
      this.errorStore,
      this._forgotPasswordUseCase,
      this._newPasswordUseCase,
      this._otpVerificationUseCase,
      this._resendOtpUseCase,
      this._saveAccessTokenUseCase,
      this._changePasswordUseCase,
      this._userSaveUseCase,
      this._removeUserUseCase,
      this._currentUserUseCase,
      this._authTokenUseCase) {
    // setting up disposers
    _setupDisposers();

    _currentUserUseCase.call(params: false).then((Map<String, dynamic>? value) {
      if (value != null) {
        print('check value to the currentUser $value');

        this.currentUser = User.fromJson(value);
      } else {
        this.currentUser = null;
      }
    });

    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
    // checking if user is logged in
    _authTokenUseCase.call(params: null).then((value) async {
      authToken = value;
    });
  }

  // use cases:-----------------------------------------------------------------
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final SaveAccessTokenUseCase _saveAccessTokenUseCase;
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final OTPVerificationUseCase _otpVerificationUseCase;
  final ResendOtpUseCase _resendOtpUseCase;
  final NewPasswordUseCase _newPasswordUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UserSaveUseCase _userSaveUseCase;
  final RemoveUserUseCase _removeUserUseCase;
  final CurrentUserUseCase _currentUserUseCase;
  final GetAuthTokenUseCase _authTokenUseCase;

  // stores:--------------------------------------------------------------------
  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<ApiResponse?> emptyLoginResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  bool isLoggedIn = false;

  @observable
  String? authToken;
  @observable
  User? currentUser;
  @observable
  bool success = false;

  String? refreshToken;

  // String registerAuthToken;
  String? forgetAuthToken;
  String? forgetOTPAuthToken;
  String? resetAuthToken;
  String? registrationKey;

  @observable
  String registerAuthToken = '';

  @observable
  String otp = '';

  @observable
  String userEmail = '';

  @observable
  int currentTime = 0;

  @observable
  String errorMessage = '';

  @observable
  bool verifyOTPLoading = false;

  @observable
  bool verifyOTPSuccess = false;

  @observable
  bool resendOTPLoading = false;

  @observable
  bool resendOTPSuccess = false;

  @observable
  String userSearch = '';

  @observable
  List<String> selectedUser = [];

  @action
  void setSelectedUser(String value) {
    selectedUser.add(value);
  }

  @action
  void setUserSearch(String value) {
    userSearch = value;
  }

  @action
  void setUserEmailID(String value) {
    userEmail = value;
  }

  @computed
  bool get canVerifyOTP =>
      !formErrorStore.hasErrorInVerifyOTP && otp.isNotEmpty;

  @observable
  ObservableFuture<ApiResponse?> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------

  @action
  Future<ApiResponse?> login(String email, String password) async {
    final LoginParams loginParams =
        LoginParams(email: email, password: password);
    try {
      final future = _loginUseCase.call(params: loginParams);
      loginFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value?.data != null) {
        if (value!.data?['key'] != null) {
          registrationKey = value?.data?['key'];

          return ApiResponse(success: value!.success, message: value.message);
        } else {

          print('check user employer reuqest here access token ${value?.data?['access_token']}');
          await _saveLoginStatusUseCase.call(params: true);
          await _saveAccessTokenUseCase.call(
              params: value?.data?['access_token']);
          if(value.data !=null){
            print('check user login data ${ value.data!['userProfile']}');
            currentUser = User.fromJson({...?value.data});
            // currentUser = User(userProfile: value.data!['userProfile'], did:  value.data!['did'], existingUser: value.data!['existingUser']);

          }
          await _userSaveUseCase.call(params: value!.data);
          // await _saveAccessTokenUseCase.call(params: true);
          this.isLoggedIn = true;
          this.success = true;

          return ApiResponse(success: value!.success, message: value.message);
        }
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  // actions:-------------------------------------------------------------------

  static ObservableFuture<ApiResponse?> emptyRegistrationResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> registerFuture = emptyRegistrationResponse;

  @computed
  bool get isRegisterLoading => registerFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> register(
      String userName, String password, String email) async {
    try {
      final RegisterParams registerParams =
          RegisterParams(name: userName, password: password, email: email);
      final future = _registerUseCase.call(params: registerParams);
      registerFuture = ObservableFuture(future);
      ApiResponse? value = await future;
      if (value?.data != null) {
        print('check value to value $value ');
        print('check value to data ${value?.data}');
        this.registrationKey = value?.data?['key'];

        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;

      rethrow;
    }
  }

  // actions:-------------------------------------------------------------------

  @observable
  ObservableFuture<ApiResponse?> forgotPasswordFuture = emptyLoginResponse;

  @observable
  ObservableFuture<ApiResponse?> newPasswordFuture = emptyLoginResponse;

  @computed
  bool get isForgetPasswordLoading =>
      forgotPasswordFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> forgotPassword(String email) async {
    try {
      final ForgotPasswordParams forgotPasswordParams =
          ForgotPasswordParams(email: email);
      final future = _forgotPasswordUseCase.call(params: forgotPasswordParams);
      forgotPasswordFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value?.data != null) {
        print('check value to data ${value?.data}');
        this.registerAuthToken = value?.data?['key'];

        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;

      rethrow;
    }
  }

  @computed
  bool get isNewPasswordSetLoading =>
      newPasswordFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> newPassword(
      String key, String otp, String password) async {
    try {
      final NewPasswordParams newPasswordParams =
          NewPasswordParams(key: key, otp: otp, NewPassword: password);

      final future = _newPasswordUseCase.call(params: newPasswordParams);
      newPasswordFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value != null) {
        print('check value to  new password change data ${value?.data}');

        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;
      print('check new password error $error ');
      rethrow;
    }
  }

  static ObservableFuture<ApiResponse?> emptyOtpVerifyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> otpVerifyFuture = emptyOtpVerifyResponse;

  @computed
  bool get isOtpVerifyLoading => otpVerifyFuture.status == FutureStatus.pending;

  @action
  Future<ApiResponse?> OTPVerification(String key, String otp) async {
    try {
      final OTPVerificationParams otpVerificationParams =
          OTPVerificationParams(key: key, otp: otp);
      final future =
          _otpVerificationUseCase.call(params: otpVerificationParams);
      otpVerifyFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value?.data != null) {
        // this.registrationKey = value?.data?['key'];
        await _saveAccessTokenUseCase.call(
            params: value?.data?['access_token']);
        this.isLoggedIn = true;
        await _saveLoginStatusUseCase.call(params: true);
        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;

      rethrow;
    }
  }

  static ObservableFuture<ApiResponse?> emptyResendOtpResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> resendOtpFuture = emptyResendOtpResponse;

  @computed
  bool get isResendOtpLoading => resendOtpFuture.status == FutureStatus.pending;

  @action
  Future resendOtp(String email) async {
    try {
      final ResendOtpParams resendOtpParams = ResendOtpParams(email: email);
      final future = _resendOtpUseCase.call(params: resendOtpParams);
      resendOtpFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value?.data != null) {
        print('check value to value $value ');
        print('check value to data ${value?.data}');

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;

      rethrow;
    }
  }

  @observable
  bool isLogoutLoading = false;

  logout() async {
    try {
      isLogoutLoading = true;
      this.isLoggedIn = false;
      await _saveLoginStatusUseCase.call(params: false);
      await _removeUserUseCase.call(params: false);
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      // SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
    } catch (e) {
      print(e);
    } finally {
      isLogoutLoading = false;
    }
  }

  // actions:-------------------------------------------------------------------

  static ObservableFuture<ApiResponse?> emptyChangePasswordResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> changePasswordFuture =
      emptyChangePasswordResponse;

  @computed
  bool get isChangePasswordLoading =>
      changePasswordFuture.status == FutureStatus.pending;

  @action
  Future changePassword(String existingPassword, String newPassword) async {
    try {
      final ChangePasswordParams changePasswordParams = ChangePasswordParams(
          existingPassword: existingPassword, newPassword: newPassword);
      final future = _changePasswordUseCase.call(params: changePasswordParams);
      forgotPasswordFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value?.data != null) {
        print('check value to data ${value?.data}');
        this.registerAuthToken = value?.data?['key'];

        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      this.success = false;

      rethrow;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
