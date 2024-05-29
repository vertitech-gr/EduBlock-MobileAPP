
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/student_certificate_checkbox.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddCertificateEnveloesScreen extends StatelessWidget {
  final Envelope envelope;

  AddCertificateEnveloesScreen({required this.envelope});

  final FormStore _formStore = getIt<FormStore>();
  final CertificateRequestStore _certificateRequestStore =
  getIt<CertificateRequestStore>();

  final CreateEnvelopesStore _createEnvelopesStore =
  getIt<CreateEnvelopesStore>();

  bool isChecked = true;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // _themeStore = Provider.of<ThemeStore>(context);
  // }
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
                visible: _createEnvelopesStore.isEditingEnvelopes ,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),
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
          _buildNavigation(context),
          _buildAllCertificates(context),
          _buildUploadButton(context),
        ],
      ),
    );
  }

  Widget _buildNavigation(BuildContext context) {
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
                  Navigator.of(context).pop();
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
                'Add Certificate in ${envelope.name} ',
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

  Widget _buildAllCertificates(BuildContext context) {
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
              Observer(
                builder: (context) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _certificateRequestStore.certificateLists.isNotEmpty
                        ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 16,
                      runSpacing: 20,
                      children: List.generate(
                        _certificateRequestStore.certificateLists.length ,
                            (index)=> SizedBox(
                              width: 108,
                              height: 130,
                              child: StudentCertificateCheckbox(callback: () {  }, certificateDetails:CertificateDetails(id: _certificateRequestStore.certificateLists[index].id, name: _certificateRequestStore.certificateLists[index].degreeName,degreeType: _certificateRequestStore.certificateLists[index].degreeType, status: _certificateRequestStore.certificateLists[index].status)  ,isEditEnvelopes: true),
                            ),
                      ),
                    )
                        : Center(
                      child: Text(
                        "Not exists any certificate inthis envelopes",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                          fontWeight: FontWeight.w800,
                          color:
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]));
  }


  Widget _buildUploadButton(BuildContext context) {
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
              RoundedButtonWidget(
                buttonName: 'Save Edits',
                callback:(){
                  handleCertificateRequestAccess(context);
                },
              ),
              // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> handleCertificateRequestAccess(BuildContext context) async {
           print('check _createEnvelopesStore.editCertificateEnvelopes now in handler ${_createEnvelopesStore.editCertificateEnvelopes}');
           print('check _createEnvelopesStore.secoccococo now in handler ${_createEnvelopesStore.editCertificateEnvelopes.map((certificate) => certificate.id).toList()}');
    try {
      ApiResponse? value = await _createEnvelopesStore.editEnvelope(envelope.id,_createEnvelopesStore.editCertificateEnvelopes.map((certificate) => certificate.id).toList());
      if(value!.success){
        print('check handleCertificateRequestAccess request access  success value are -----> $value');
        _createEnvelopesStore.removeAllCertificate();
        showNotification(context, 'success', 'Success', value!.message);

        Future.delayed(Duration(milliseconds: 3000), () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.allEnvelopesScreen, (Route<dynamic> route) => false);
        });


      }else{
        showNotification(context, 'error', 'Error', value!.error??"some error occur");

      }
      print(value);
    } catch (e) {
      if (e is ApiResponse) {
        showNotification(context, 'error', 'Error', e.message);
      }
      // } else {
      //           showNotification(
      //               context, 'error', 'Error', e.response?.data['message']);
      //         }
    }

  }



}
