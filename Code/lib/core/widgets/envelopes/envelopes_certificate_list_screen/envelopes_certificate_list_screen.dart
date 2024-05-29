import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/student_certificate_checkbox.dart';
import 'package:edublock/core/widgets/envelopes/add_certificate_envelopes/add_certificate_envelopes_screen.dart';
import 'package:edublock/core/widgets/envelopes/edit_envelopes/envelopes_edit_screen.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EnvelopesCertificateListScreen extends StatelessWidget {
  final Envelope envelope;

  EnvelopesCertificateListScreen({required this.envelope});

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
                envelope.name,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: envelope.credentials.isNotEmpty
                    ? Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 16,
                        runSpacing: 20,
                        children: List.generate(
                          envelope.credentials.length,
                          (index) => Container(
                            width: 108,
                            height: 150,
                            // Adjust the height as needed
                            child: StudentCertificateCheckbox(callback: () {  }, certificateDetails:envelope.credentials[index]  ,),
                          ),
                        ),
                      )
                    : Container(
                    width: 108,
                    height: 100,
                    child: _buildAddCertificate(context)),
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
                buttonName: 'Edit Envelope',
                callback: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ShareCertificateScreen(isEnvelopesShare:true),
                  //   ),
                  // );
                  // // _certificateRequestStore.
                  _createEnvelopesStore.addAllCertificateInEnvelopes(envelope.credentials);

                  _createEnvelopesStore.setEnvelopesID(envelope.id);
                  // _createEnvelopesStore.setAllCredentialID(envelope.credential.map((certificate) => certificate.id).toList());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EnvelopesEditScreen(envelope: envelope,),
                    ),
                  );
                },
              ),
              // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButtonWidget(
                  horizontal: 8.0,
                  widthSize: 0.42,
                  buttonName: 'Share Envelope',
                  callback: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ShareCertificateScreen(isEnvelopesShare:true),
                    //   ),
                    // );
                    // // _certificateRequestStore.

                    _createEnvelopesStore.setEnvelopesID(envelope.id);
                    _createEnvelopesStore.setAllCredentialID(_createEnvelopesStore
                        .editCertificateEnvelopes
                        .map((certificate) => certificate.id)
                        .toList());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShareCertificateScreen(
                            isEnvelopesShare: true, title: "Share Envelope"),
                      ),
                    );
                  },
                ),
                RoundedButtonWidget(
                  horizontal: 8.0,
                  widthSize: 0.42,

                  buttonName: 'Share By QRCode',
                  callback: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ShareCertificateScreen(isEnvelopesShare:true),
                    //   ),
                    // );
                    // // _certificateRequestStore.

                    _createEnvelopesStore.setEnvelopesID(envelope.id);
                    _createEnvelopesStore.setAllCredentialID(_createEnvelopesStore
                        .editCertificateEnvelopes
                        .map((certificate) => certificate.id)
                        .toList());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShareCertificateScreen(
                            isEnvelopesShare: true,isQRCodeShare: true, title: "Share Envelope"),
                      ),
                    );
                  },
                ),

                // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
              ],
            ),
          ),


          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       RoundedButtonWidget(
          //         buttonName: 'Share Envelope',
          //         callback: () {
          //           // Navigator.of(context).push(
          //           //   MaterialPageRoute(
          //           //     builder: (context) => ShareCertificateScreen(isEnvelopesShare:true),
          //           //   ),
          //           // );
          //           // // _certificateRequestStore.
          //
          //           _createEnvelopesStore.setEnvelopesID(envelope.id);
          //           // _createEnvelopesStore.setAllCredentialID(envelope.credential.map((certificate) => certificate.id).toList());
          //           Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) => ShareCertificateScreen(
          //                   isEnvelopesShare: true, title: "Share Envelope"),
          //             ),
          //           );
          //         },
          //       ),
          //       // OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildAddCertificate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddCertificateEnveloesScreen(
              envelope: envelope,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(8.0),
            border:
            Border.all(color: Theme.of(context).backgroundColor, width: 2)),
        height: 98,
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            Text(
              'Add Certificate',
              maxLines: 3,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }




  Widget _buildCertificateCheckBox(
      BuildContext context, String certificateName) {
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Theme.of(context).backgroundColor, width: 2)),
                height: 98,
                width: 110,
                // child: ,
              ),
              Positioned(
                  top: -4,
                  right: -4.0,
                  child: SizedBox(
                    child: Checkbox(
                      checkColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      activeColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      value: isChecked,
                      onChanged: (bool? value) {
                        // showAlertEmployerViewPermissionDialog(context,'View Permission',_buildRichText());
                      },
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            certificateName,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}
