import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/student_certificate_checkbox.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateEvelopesScreen extends StatefulWidget {
  @override
  State<CreateEvelopesScreen> createState() => _CreateEvelopesScreenState();
}

class _CreateEvelopesScreenState extends State<CreateEvelopesScreen> {
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      _certificateRequestStore.getCertificateLists(_userStore.currentUser!.existingUser.id);
    } catch (error) {
      print('check all certificate list are here $error');
      // Handle errors
    }
  }

  bool isCreateEnvelop = false;

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNavigation(),
          _buildAllCertificates(),
          _buildUploadButton(),
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
                onTap: () async {
                  _createEnvelopesStore.setOnChangeTriggered(true);
                  _createEnvelopesStore.setSelectedEnvelopes(null);
                  await Future.delayed(Duration(milliseconds: 100));
                  _createEnvelopesStore.removeStudentSelectedCertificate();
                  _createEnvelopesStore.setOnChangeTriggered(false);
                  Navigator.of(context).pop();
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

  Widget _buildAllCertificates() {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).translate('my_wallet_screen_all'),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Observer(builder: (_) {
                  return _createEnvelopesStore.onChangeTriggered == false
                      ? Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 16,
                          runSpacing: 20,
                          children: List.generate(
                            _certificateRequestStore.certificateLists.length,
                            (index) => SizedBox(
                              width: 108,
                              height: 150,
                              // Adjust the height as needed
                              child: StudentCertificateCheckbox(
                                  callback: () {},
                                  certificateDetails: CertificateDetails(
                                      id: _certificateRequestStore
                                          .certificateLists[index].id,
                                      name: _certificateRequestStore
                                          .certificateLists[index].degreeName,
                                      degreeType: _certificateRequestStore
                                          .certificateLists[index].degreeType, status: _certificateRequestStore
                                      .certificateLists[index].status)),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 120,
                          width: 108,
                        );
                }),
              ),
            ]));
  }

  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Personalize your envelope with the certificates you prefer',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (context) {
                return RoundedButtonWidget(
                  buttonName: 'Create Envelope',
                  isDisable:
                      _createEnvelopesStore.studentSelectedCertificate.isEmpty,
                  callback: () {
                    // if (_certificateRequestStore
                    //     .selectedCertificate.isNotEmpty) {
                    Navigator.of(context)
                        .pushNamed(Routes.createEnvelopeFormScreen);
                    // } else {
                    //   showNotification(context, 'error', 'Error',
                    //       "Please select atleast one certificate ");
                    // }
                  },
                );
              }),
              // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
            ],
          ),
        ],
      ),
    );
  }
}
