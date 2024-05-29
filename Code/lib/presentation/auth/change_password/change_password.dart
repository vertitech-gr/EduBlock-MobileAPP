import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/textfield_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _existingPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  late FocusNode _existingPasswordFocusNode;
  late FocusNode _newPasswordFocusNode;
  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void initState() {
    super.initState();
    _existingPasswordFocusNode = FocusNode();
    _newPasswordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
           _buildRightSide(context),

          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isChangePasswordLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }












  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNavigation(),
          // _buildUserEmailId(),
          _buildExistingPasswordField(),
          _buildNewPasswordField(),
          _buildUploadButton(),
          // _buildCreateEnvelopeInput(),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Change Password',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 16.0,),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Morbi varius vestibulum sit consectetur vivamus risus blandit scelerisque eget. Lacus magna ligula tortor',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButtonWidget(
                vertical: 18.0,
                horizontal: 18.0,
                buttonName: 'Change Password',
                callback: handleChangePassword,
              ),
              // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
            ],
          ),
        ],
      ),
    );
  }


  Future<void> handleChangePassword() async {
    if (_formStore.canChangePassword) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _userStore.changePassword(_existingPasswordController.text ,_newPasswordController.text);
        if(value != null){
          showNotification(context, 'success', 'Success', value!.message);

          print('check change Password success value are -----> $value');
          await _userStore.logout();
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);

        }
        print(value);
      } catch (e) {
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        } else {
                showNotification(
                    context, 'error', 'Error', e.toString());
              }
      }
    } else {
      showNotification(
          context, 'error', 'Error', 'Please fill in all fields.');

    }
  }


  Widget _buildExistingPasswordField() {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFieldWidget(
            textColor: Theme.of(context).colorScheme.primary,
            labelTextColor: Theme.of(context).primaryColor,
            focusBorderColor: Theme.of(context).colorScheme.secondaryContainer,
            enableBorderColor: Theme.of(context).colorScheme.secondaryContainer,
            hint:
            AppLocalizations.of(context).translate('login_et_user_existing_password'),
            isObscure: !_formStore.visibility,
            // padding: EdgeInsets.only(top: 16.0),
            // icon: Icons.lock,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _existingPasswordController,
            focusNode: _existingPasswordFocusNode,
            errorText: _formStore.formErrorStore.password,
            onChanged: (value) {
              _formStore.setPassword(_existingPasswordController.text);
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_newPasswordFocusNode);
            },
            isSuffixIcon: true,
            suffixIcon:
            _formStore.visibility ? Icons.visibility : Icons.visibility_off,
            onSuffixIconPressed: () {
              _formStore.handleVisibility();
            },
            labelText: 'Existing Password',
          ),
        );
      },
    );
  }
  Widget _buildNewPasswordField() {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20.0),
          child: TextFieldWidget(
            textColor: Theme.of(context).colorScheme.primary,

            labelTextColor: Theme.of(context).primaryColor,
            focusBorderColor: Theme.of(context).colorScheme.secondaryContainer,
            enableBorderColor: Theme.of(context).colorScheme.secondaryContainer,
            hint:
            AppLocalizations.of(context).translate('login_et_user_new_password'),
            isObscure: !_formStore.newPasswordVisibility,
            // padding: EdgeInsets.only(top: 16.0),
            // icon: Icons.lock,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _newPasswordController,
            focusNode:_newPasswordFocusNode,
            errorText: _formStore.formErrorStore.newPassword,
            onChanged: (value) {
              _formStore.setNewPassword(_newPasswordController.text);
            },
            onFieldSubmitted: (value) =>handleChangePassword,
            isSuffixIcon: true,
            suffixIcon:
            _formStore.newPasswordVisibility ? Icons.visibility : Icons.visibility_off,
            onSuffixIconPressed: () {
              _formStore.handleNewPasswordVisibility();
            },
            labelText: 'New Password',
          ),
        );
      },
    );
  }



  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // _userEmailController.dispose();
    _newPasswordController.dispose();
    _existingPasswordFocusNode.dispose();

    super.dispose();
  }


}
