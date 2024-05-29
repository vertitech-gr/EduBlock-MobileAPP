import 'dart:convert';

import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CertificateContainerCheckbox extends StatefulWidget {
  // late final bool isChecked;
  // final Certificate certificate;

  final Certificate certificateDetails;
  final VoidCallback callback;

  CertificateContainerCheckbox(
      {super.key,
      required this.callback,  required this.certificateDetails});

  @override
  State<CertificateContainerCheckbox> createState() =>
      _CertificateContainerCheckboxState();
}

class _CertificateContainerCheckboxState
    extends State<CertificateContainerCheckbox> {
  bool isChecked = true;
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  late final WebViewController _controller;



  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     print('check  user name in certficate ${widget.certificate.credentialsJson.name!}');
//     print('check  user  certficate name ${widget.certificate.credentialsJson.credentialSubject!.name!}');
//     print('check  user  certficate issue date ${DateFormat('dd-MM-yyyy HH:ss:mm').format(widget.certificate.issuanceDate)}');
//     print('check  user  certficate issuer name ${widget.certificate.credentialsJson.issuer!.name!}');
//
//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
//     /*if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }*/
//
//     final WebViewController controller = WebViewController();
//     // #enddocregion platform_features
//
//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('WebView is loading (progress : $progress%)');
//           },
//           onPageStarted: (String url) {
//             // debugPrint('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             // debugPrint('Page finished loading: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint('''
// Page resource error:
//   code: ${error.errorCode}
//   description: ${error.description}
//   errorType: ${error.errorType}
//   isForMainFrame: ${error.isForMainFrame}
//           ''');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             return NavigationDecision.navigate;
//           },
//           onUrlChange: (UrlChange change) {
//             // debugPrint('url change to ${change.url}');
//           },
//         ),
//       );
//
//     // #docregion platform_features
//     // if (controller.platform is AndroidWebViewController) {
//     //   AndroidWebViewController.enableDebugging(true);
//     //   (controller.platform as AndroidWebViewController)
//     //       .setMediaPlaybackRequiresUserGesture(false);
//     // }
//     // #enddocregion platform_features
//
//     _controller = controller;
//
//     String proof = widget.certificate.credentialsJson.prettyVC!.proof!;
//     proof = proof.replaceAll('{{credential.name}}', widget.certificate.credentialsJson.name!);
//     proof = proof.replaceAll('{{subject.name}}', widget.certificate.credentialsJson.credentialSubject!.name!);
//     proof = proof.replaceAll('{{credential.issuanceDate | date: "%B %d, %Y"}}', DateFormat('dd-MM-yyyy HH:ss:mm').format(widget.certificate.issuanceDate));
//     proof = proof.replaceAll('{{issuer.name}}', widget.certificate.credentialsJson.issuer!.name!);
//
//     final String contentBase64 = base64Encode(
//       const Utf8Encoder().convert(proof),
//     );
//     controller.loadRequest(
//       Uri.parse('data:text/html;base64,$contentBase64'),
//     );
//   }


  @override
  Widget build(BuildContext context) {
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
                // child:WebViewWidget(controller: _controller) ,
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
                        setState(() {

                          print(
                              'check certificate Reqquest selected certificte ${_certificateRequestStore.selectedCertificate}');

                          // if (!_certificateRequestStore.selectedCertificate.contains(widget.certificateDetails) && !isChecked) {
                          //   isChecked = true;
                          //
                          //   // When the ID does not exist and isChecked is false
                          //   _certificateRequestStore.setSelectedCertificate(widget.certificateDetails);
                          // } else if (_certificateRequestStore.selectedCertificate.contains(widget.certificateDetails) && isChecked) {
                          //   isChecked = false;
                          //
                          //   // When the ID exists and isChecked is true
                          //   _certificateRequestStore.removeSelectedCertificateID(widget.certificateDetails);
                          // }

                        });
                      },
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            widget.certificateDetails.degreeName,
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

  Widget _buildRichText() {
    return RichText(
      textAlign: TextAlign.center, // Set overall text alignment

      text: TextSpan(
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 0.5),
          children: <TextSpan>[
            const TextSpan(
                text: 'Enable permission for Employer1 to view the '),
            TextSpan(
              text: 'Highschool ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  height: 1.5),
            ),
            const TextSpan(text: 'Diploma'),
          ]),
    );
  }
}
