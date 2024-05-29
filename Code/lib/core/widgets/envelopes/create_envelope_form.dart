import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/modal_boxes/congratulation_modal_box/congratulation_modal_box.dart';
import 'package:edublock/core/widgets/modal_boxes/envelope_modal_box/envelope_modal_box.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateEnvelopeFormScreen extends StatefulWidget {
  @override
  State<CreateEnvelopeFormScreen> createState() =>
      _CreateEnvelopeFormScreenState();
}

class _CreateEnvelopeFormScreenState extends State<CreateEnvelopeFormScreen> {
  TextEditingController _envelopeName = TextEditingController();
  late FocusNode _envelopeNameFocusNode;
  late FocusNode _userEmailFocusNode;

  final FormStore _formStore = getIt<FormStore>();
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();
  bool isCreateEnvelop = false;

  @override
  void initState() {
    super.initState();
    _envelopeNameFocusNode = FocusNode();
    _userEmailFocusNode = FocusNode();
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
                visible: _createEnvelopesStore.isCreateEnvelopesLoading,
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
          _buildCreateEnvelopeInput(),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: handleCancelButton,
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                'Create Envelope',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreateEnvelopeInput() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showAlertEnvelopeModalDialog(context,
                      _createEnvelopesStore.studentSelectedCertificate);
                },
                child: Icon(
                  Icons.remove_red_eye,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Observer(
                builder: (context) {
                  return Text(
                    '${_createEnvelopesStore.studentSelectedCertificate.length}  Certificates',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                  );
                },
              ),
            ],
          ),
          _buildUserFullNameField(),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustumTextButton(
                    buttonName: 'Cancel',
                    callback: handleCancelButton,
                    IsCircleIcon: false,
                    isIcon: false,
                    isWhite: true),
                CustumTextButton(
                  buttonName: 'Create',
                  callback: handleCreateEnvelope,
                  isDisable: !_createEnvelopesStore.canStudentCreateEnvelopes,
                  IsCircleIcon: false,
                  isIcon: false,
                )
              ],
            );
          })
        ],
      ),
    );
  }

  Widget _buildUserFullNameField() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          fontSize: 14,
          textColor: Colors.black,

          focusBorderColor: Theme.of(context).colorScheme.primaryContainer,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('envelope_ct_envelope'),
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _envelopeName,
          inputAction: TextInputAction.next,
          autoFocus: true,
          focusNode: _envelopeNameFocusNode,
          onChanged: (value) {
            _createEnvelopesStore.setEnvelopesName(_envelopeName.text);
          },
          onFieldSubmitted: (value) {
            handleCreateEnvelope();
          },
          errorText: _createEnvelopesStore.formErrorStore.envelopeName,

          isSuffixIcon: false,
          labelText: 'Envelope Name',
        );
      },
    );
  }

  // Widget _buildUserEmailField() {
  //   return Observer(
  //     builder: (context) {
  //       return TextFieldWidget(
  //         isLabelColor: true,
  //
  //         fontSize: 16,
  //         labelTextColor: Theme.of(context).primaryColor,
  //
  //         textColor: Theme.of(context).colorScheme.primary,
  //         focusBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //         enableBorderColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //         hintColor: Theme.of(context).colorScheme.onPrimaryContainer,
  //         // hint: AppLocalizations.of(context).translate('profile_dummy_email'),
  //         hint: 'student@gmail.com',
  //         inputType: TextInputType.emailAddress,
  //         // icon: Icons.person,
  //         // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
  //         textController: _userEmailController,
  //         inputAction: TextInputAction.next,
  //         autoFocus: false,
  //         onChanged: (value) {
  //           _formStore.setUserId(_userEmailController.text);
  //         },
  //         onFieldSubmitted: (value) {
  //           FocusScope.of(context).requestFocus(_userGraduateYearFocusNode);
  //         },
  //         errorText: _formStore.formErrorStore.userEmail,
  //         isSuffixIcon: false,
  //         labelText: 'Email',
  //       );
  //     },
  //   );
  // }

  void handleCreateEnvelope() {
    print(
        'check length to the ${_createEnvelopesStore.studentSelectedCertificate.length}');
    print('check length to the ${_createEnvelopesStore.canCreateEnvelopes}');
    if (_createEnvelopesStore.studentSelectedCertificate.isNotEmpty &&
        _createEnvelopesStore.canStudentCreateEnvelopes) {
      DeviceUtils.hideKeyboard(context);
      handleCertificateRequestAccess();
    } else {
      showNotification(context, 'error', 'Error',
          'Please Select Certificates and envelopes name.');
    }
  }

  Future<void> handleCancel() async {
    _createEnvelopesStore.setOnChangeTriggered(true);
    _createEnvelopesStore.setSelectedEnvelopes(null);
    await Future.delayed(Duration(milliseconds: 100));
    _createEnvelopesStore.removeStudentSelectedCertificate();
    _createEnvelopesStore.setOnChangeTriggered(false);
  }

  Future<void> handleCancelButton() async {
    _createEnvelopesStore.setOnChangeTriggered(true);
    _createEnvelopesStore.setSelectedEnvelopes(null);
    await Future.delayed(Duration(milliseconds: 100));
    _createEnvelopesStore.removeStudentSelectedCertificate();
    _createEnvelopesStore.setOnChangeTriggered(false);
    Navigator.of(context).pop();
  }

  Future<void> handleCertificateRequestAccess() async {
    try {
      ApiResponse? value = await _createEnvelopesStore.createEnvelopes(
          _envelopeName.text.trim(),
          _createEnvelopesStore.studentSelectedCertificate
              .map((certificate) => certificate.id)
              .toList());
      if (value!.success) {
        print(
            'check handleCertificateRequestAccess request access  success value are -----> $value');
        _createEnvelopesStore.removeStudentSelectedCertificate();

        showAlertCongratulationDialog(
            context,
            'You made a college certificate envelope successfully',
            'View envelope', () {
          handleCancel();
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.allEnvelopesScreen, (Route<dynamic> route) => false);
        });

        // showNotification(context, 'success', 'Success', value!.message);
        //
        // Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);
      }else{
        showNotification(context, 'error', 'Error', value!.message);

      }
      print(value);
    } catch (e) {
      if (e is ApiResponse) {
        showNotification(context, 'error', 'Error', e.message);
      } /*else {
                showNotification(
                    context, 'error', 'Error', e.response?.data['message']);
              }*/
    }
  }

  @override
  void dispose() {
    _envelopeNameFocusNode.dispose();
    _envelopeName.dispose();

    super.dispose();
  }
}
