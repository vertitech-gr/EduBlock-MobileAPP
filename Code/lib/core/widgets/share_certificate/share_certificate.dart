import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/modal_boxes/share_link_qr_code/share_link_qr_code.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
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

class ShareCertificateScreen extends StatefulWidget {
  final bool isEnvelopesShare;
  final bool isQRCodeShare;
  final String title;

  ShareCertificateScreen(
      {this.isEnvelopesShare = false,
      this.isQRCodeShare = false,
      this.title = "Share Certificate"});

  @override
  State<ShareCertificateScreen> createState() => _ShareCertificateScreenState();
}

class _ShareCertificateScreenState extends State<ShareCertificateScreen> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _existingPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  late FocusNode _existingPasswordFocusNode;
  late FocusNode _newPasswordFocusNode;

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();

  @override
  void initState() {
    super.initState();
    // _userEmailController.text = AppLocalizations.of(context).translate('profile_dummy_email');
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
          _formStore.canShareCertificate
              ? Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: _buildFooterCreateRequest())
              : SizedBox(),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _createEnvelopesStore.isShareLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooterCreateRequest() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Jammes',
              //     style: Theme.of(context).textTheme.labelMedium?.copyWith(
              //         fontWeight: FontWeight.w400,
              //         color: Theme.of(context).primaryColor,
              //         height: 1.5,
              //         letterSpacing: 0.5)),
              Text(_userEmailController.text,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                      height: 1.5,
                      letterSpacing: 0.5))
            ],
          ),
          RoundedButtonWidget(
            horizontal: 0,
            vertical: 12,
            widthSize: 0.4,
            buttonName: widget.isEnvelopesShare
                ? 'Share Envelope'
                : 'Share Certificate',
            callback: widget.isEnvelopesShare && widget.isQRCodeShare
                ? handleShareEnvelopesByQRCode
                : widget.isQRCodeShare
                    ? handleShareCertificateByQRCode
                    : widget.isEnvelopesShare
                        ? handelShareEnvelopes
                        : handleShare,
          ),
        ],
      ),
    );
  }

  Future<void> handleShareCertificateByQRCode() async {
    if (_formStore.canShareCertificate) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _createEnvelopesStore
            .shareEnvelopesCertificate(1, _userEmailController.text,
                _certificateRequestStore.shareCertificateID, [], null,true);
        print('check value by handleShareCertificateByQRCode ${value}');
        if (value!.success) {
          print('check value by handleShareCertificateByQRCode ${value!.data}');
          print('check value by link ${value!.data?['pdfLink']}');

          showAlertShareLinkQrCodeDialog(
              context, 'QR code Share ', value!.data?['pdfLink']);

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
    } else {
      showNotification(context, 'error', 'Error', 'Please Fill user email .');
    }
  }

  Future<void> handleShareEnvelopesByQRCode() async {
    if (_formStore.canShareCertificate) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value =
            await _createEnvelopesStore.shareEnvelopesCertificate(
                2,
                _userEmailController.text,
                _createEnvelopesStore.envelopeID,
                _createEnvelopesStore.editCertificateEnvelopes
                    .map((certificate) => certificate.id)
                    .toList(), null,true);
        print('check value by envelopes handleShareCertificateByQRCode ${value}');


        if (value != null) {
          showAlertShareLinkQrCodeDialog(
              context, 'QR code Share ', value!.data?['pdfLink']);

          // print('check registration success value are -----> $value');
          // showNotification(context, 'success', 'success', value!.message);
          // Future.delayed(Duration(milliseconds: 3000), () {
          //   Navigator.of(context).pushNamedAndRemoveUntil(
          //       Routes.home, (Route<dynamic> route) => false);
          // });

          // Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);
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
    } else {
      showNotification(context, 'error', 'Error', 'Please Fill user email .');
    }
  }

  Future<void> handleShare() async {
    if (_formStore.canShareCertificate) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value = await _createEnvelopesStore
            .shareEnvelopesCertificate(1, _userEmailController.text,
                _certificateRequestStore.shareCertificateID, [], null,false);
        ;
        if (value != null) {
          print('check registration success value are -----> $value');
          showNotification(context, 'success', 'success', value!.message);
          Future.delayed(Duration(milliseconds: 3000), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.home, (Route<dynamic> route) => false);
          });

          // Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);
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
    } else {
      showNotification(context, 'error', 'Error', 'Please Fill user email .');
    }
  }

  Future<void> handelShareEnvelopes() async {
    if (_formStore.canShareCertificate) {
      DeviceUtils.hideKeyboard(context);
      try {
        // Envelope envelopeData = _createEnvelopesStore.envelopeLists.firstWhere(
        //       (Envelope envelope) => envelope.id == _createEnvelopesStore.envelopeID,
        // );

        print(
            'check student studentSelectedCertificate length ${_createEnvelopesStore.studentSelectedCertificate.length}');
        print(
            'check student studentSelectedCertificate  ${_createEnvelopesStore.studentSelectedCertificate}');
        ApiResponse? value =
            await _createEnvelopesStore.shareEnvelopesCertificate(
                2,
                _userEmailController.text,
                _createEnvelopesStore.envelopeID,
                _createEnvelopesStore.editCertificateEnvelopes
                    .map((certificate) => certificate.id)
                    .toList(), null,false);

        if (value != null) {
          print('check registration success value are -----> $value');
          showNotification(context, 'success', 'success', value!.message);
          Future.delayed(Duration(milliseconds: 3000), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.home, (Route<dynamic> route) => false);
          });

          // Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);
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
    } else {
      showNotification(context, 'error', 'Error', 'Please Fill user email .');
    }
  }

  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _buildNavigation(),
            _buildUserEmailField(),
            // _buildUserDetailCards(),
            _userStore.selectedUser.length > 0
                ? _buildInviteViaMail()
                : SizedBox(),
          ],
        ),
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
                onTap: () {
                  // Navigator.of(context).pop();
                  Navigator.popAndPushNamed(context, Routes.allEnvelopesScreen);
                  _createEnvelopesStore.removeStudentSelectedCertificate();
                },
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
                widget.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   // Adjust the mainAxisSize to minimize the width of the Row
          //
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Icon(
          //       Icons.remove_red_eye,
          //       size: 20,
          //       color: Theme.of(context).colorScheme.onPrimary,
          //     ),
          //     SizedBox(
          //       width: 8.0,
          //     ),
          //     Observer(builder: (context) {
          //       return Text(
          //         '${_userStore.selectedUser.length} ${AppLocalizations.of(context).translate('share_screen_share_selected')}',
          //         style: Theme.of(context).textTheme.labelLarge?.copyWith(
          //               fontWeight: FontWeight.w700,
          //               color: Theme.of(context).colorScheme.primary,
          //             ),
          //       );
          //     }),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildUserEmailField() {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFieldBackgroundWidget(
            fontSize: 16,
            textColor: Theme.of(context).colorScheme.primaryContainer,
            labelTextColor: Theme.of(context).primaryColor,
            focusBorderColor: Theme.of(context).colorScheme.outline,
            enableBorderColor: Theme.of(context).colorScheme.primaryContainer,
            hintColor: Theme.of(context).colorScheme.onPrimaryContainer,

            // hint: AppLocalizations.of(context).translate('profile_dummy_email'),
            hint: AppLocalizations.of(context).translate('profile_dummy_email'),
            inputType: TextInputType.emailAddress,
            // icon: Icons.person,
            // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _userEmailController,
            inputAction: TextInputAction.next,
            autoFocus: false,
            onChanged: (value) {
              _userStore.setUserSearch(_userEmailController.text);
              _formStore.setUserId(_userEmailController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_userGraduateYearFocusNode);
              widget.isEnvelopesShare && widget.isQRCodeShare
                  ? handleShareEnvelopesByQRCode
                  : widget.isQRCodeShare
                  ? handleShareCertificateByQRCode
                  : widget.isEnvelopesShare
                  ? handelShareEnvelopes
                  : handleShare;           },
            errorText: _formStore.formErrorStore.userEmail,
            isSuffixIcon: false,
            labelText: AppLocalizations.of(context)
                .translate('share_screen_send_credentials'),
          ),
        );
      },
    );
  }

  Widget _buildUserDetailCards() {
    bool isUserSelected = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isUserSelected = (!isUserSelected);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: ListTile(
            // selectedColor: ,
            leading: Stack(
              children: [
                Container(
                  width: 50,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                isUserSelected
                    ? Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            child: SvgWidget(
                              path: Assets.checkCircle,
                              label: Assets.checkCircle,
                              percentage: 0.05,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),

            // title: Text('James',
            //     style: Theme.of(context).textTheme.labelMedium?.copyWith(
            //         fontWeight: FontWeight.w400,
            //         color: Theme.of(context).primaryColor,
            //         height: 1.5,
            //         letterSpacing: 0.5)),
            title: Text('graduate@gmail.com',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    height: 1.5,
                    letterSpacing: 0.5)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Department Admin',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        height: 1.5,
                        letterSpacing: 0.5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInviteViaMail() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
            child: Text(
              '${_userEmailController.text.isEmpty ? AppLocalizations.of(context).translate('profile_dummy_email') : _userEmailController.text}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
            child: Text(
              '${AppLocalizations.of(context).translate('share_screen_share_id_not_registration')}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
            child: Text(
              '${AppLocalizations.of(context).translate('share_screen_share_id_not_registration_second')}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          RoundedButtonWidget(
            isFontColorsBlack: true, // horizontal: 0,
            vertical: 20, // widthSize:0.4,
            buttonName: 'Invite Via Mail ',
            callback: () {
              Navigator.of(context).pushNamed(Routes.certificateViewCostScreen);
            },
          ),
        ],
      ),
    );
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _createEnvelopesStore.removeStudentSelectedCertificate();

    super.dispose();
  }
}
