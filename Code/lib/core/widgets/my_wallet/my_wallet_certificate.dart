import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/certificate/certificate.dart';
import 'package:edublock/core/widgets/modal_boxes/share_link_qr_code/share_link_qr_code.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/certificates/certificate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class MyWalletCertificate extends StatelessWidget {
   final bool isThreeDots;
   final String certificateName;
   final DateTime issueDate;
   final String certificateType;
  final bool isHidden;
  final VoidCallback callback;
  final Certificate certificate;
  MyWalletCertificate({required this.certificate, required this.isHidden, required this.isThreeDots, required this.callback, required this.certificateName, required this.issueDate, required this.certificateType});

   final CertificateRequestStore _certificateRequestStore =
   getIt<CertificateRequestStore>();



   @override
   Widget build(BuildContext context) {
     return Material(
       child: Stack(
         children: <Widget>[
           _buildRightSide(context),

           // Observer(
           //   builder: (context) {
           //     return Visibility(
           //       visible: _certificateRequestStore.isCertificatePdfLinkByIDLoading,
           //       child: CircularProgressIndicator(
           //         color: Theme.of(context).colorScheme.primaryContainer,
           //       ),
           //     );
           //   },
           // )
         ],
       ),
     );
   }


   Widget _buildRightSide(BuildContext context) {
    String formattedIssueDate = DateFormat('dd-MM-yyyy').format(issueDate);
    print('check certificate status ${certificate.status}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(certificateType,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                  height: 1.3,
                  letterSpacing: 1.5)),
        ),
        GestureDetector(
          onTap:certificate.status ? (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CertificateScreen(
                  certificate: certificate,
                ),
              ),
            );

          } :null,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
              decoration: BoxDecoration(
                color: isHidden ?Theme.of(context).colorScheme.onSecondaryContainer : Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                  color:certificate.status? Theme.of(context).colorScheme.onPrimary:Theme.of(context).colorScheme.onErrorContainer, // Choose the desired color from your theme
                  width: certificate.status ?1.0:2.0, // Define the border width
                ),
                // border: Border.allcertificate(
                //     color:Theme.of(context).backgroundColor,
                //     width: 1
                // )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: certificate.status?MediaQuery.of(context).size.width*0.7 : MediaQuery.of(context).size.width*0.47,
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(certificateName,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                      height: 1.3,
                                      letterSpacing: 1.5)),
                              Text(formattedIssueDate,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                      height: 1.3,
                                      letterSpacing: 1.5)),
                            ],
                          ),
                        ),
                     certificate.status?SizedBox():   Container(
                       width: MediaQuery.of(context).size.width*0.3 ,
                       child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Certificate Revoked',
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.onErrorContainer,
                                      height: 1.3,
                                      letterSpacing: 1.5)),
                              Text('Please contact Admin',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                      height: 1.3,
                                      letterSpacing: 1.5)),
                            ],
                          ),
                     ),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: certificate.status ? callback :null,
                    child: Icon(
                      isHidden?Icons.visibility_off :isThreeDots?Icons.more_vert: Icons.keyboard_arrow_right,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      size: 24,
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
