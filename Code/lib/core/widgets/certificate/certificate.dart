import 'dart:async';

import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/certificates/certificate.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

// // #docregion platform_imports
// // Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// // #enddocregion platform_imports

class CertificateScreen extends StatefulWidget with WidgetsBindingObserver {
  final Certificate certificate;

  const CertificateScreen({
    Key? key,
    required this.certificate,
  }) : super(key: key);

  @override
  _CertificateScreenState createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late final WebViewController _controller;
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  late PdfViewerController _pdfViewerController;
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final UserStore _userStore = getIt<UserStore>();

  bool isWebViewLoading = false;

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  final Completer<PDFViewController> _controller1 =
      Completer<PDFViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfViewerController = PdfViewerController();

    print('https://api.edublock.bucle.dev/Certificate/${widget.certificate.fileName}');
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildRightSide(context),
        Observer(
          builder: (context) {
            return Visibility(
              visible:
                  _certificateRequestStore.isCertificatePdfLinkByIDLoading ||
                      _certificateRequestStore.isEnvelopesByIDLoading,
              child: const CustomProgressIndicatorWidget(),
            );
          },
        )
      ],
    );
  }

  Widget _buildRightSide(BuildContext context) {


    String formattedIssueDate = DateFormat('dd MMMM yyyy').format(widget.certificate.issuanceDate);


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNavigation(),

            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              // width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: 16 / 13, // Set your desired aspect ratio here

                child: Stack(
                  children: [
                    // WebViewWidget(controller: _controller),
                    _buildPdfView(),
                    // if (isWebViewLoading)
                    //   Positioned(
                    //     top: MediaQuery.of(context).size.height / 2 - 16,
                    //     left: MediaQuery.of(context).size.height / 2 - 16,
                    //     child: const CircularProgressIndicator(strokeWidth: 16.0),
                    //   )
                  ],
                ),
              ),
            ),
            Text(
              "Credential Details",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),

            if(_userStore.currentUser != null)
              Text(
                "Student Name",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    letterSpacing: 0.5,
                    height: 1.1),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4,
              ),

              Text(
                _userStore.currentUser!.existingUser.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 0.5,
                    height: 1.1),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),




                        Text(
              "Degree Name",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),

            Text(
              (widget.certificate.degreeName).trim(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Degree Type",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),

            Text(
              (widget.certificate.degreeType).trim(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),

            Text(
              "Issue Data",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),

            Text(
              formattedIssueDate,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 16,
            ),

            Text(
              "Issuer",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),

            Text(
              '${widget.certificate.issuer}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 0.5,
                  height: 1.1),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButtonWidget(
                    horizontal: 0,
                    vertical: 16,
                    widthSize: 0.4,
                    buttonName: 'Share Certificate',
                    callback: () {
                      _certificateRequestStore
                          .setShareCertificateID(widget.certificate.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareCertificateScreen(),
                        ),
                      );
                    },
                  ),
                  RoundedButtonWidget(
                    horizontal: 0,
                    vertical: 16,
                    widthSize: 0.4,
                    buttonName: 'Share By QRCODE',
                    callback: () {
                      _certificateRequestStore
                          .setShareCertificateID(widget.certificate.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShareCertificateScreen(isQRCodeShare: true),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 0.0),
            //   child: RoundedButtonWidget(
            //     horizontal: 4.0,\
            //     vertical: 16,
            //     widthSize: 0.4,
            //     buttonName: 'Share By QRCODE',
            //     callback: () {
            //       _certificateRequestStore
            //           .setShareCertificateID(widget.certificate.id);
            //       _certificateRequestStore.getCertificatePdfLinkByID(widget.certificate.id).then((value){
            //         showAlertShareLinkQrCodeDialog(context, 'QR code Share ',value!.data?['pdfLink']);
            //
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    )
        /*SingleChildScrollView(
      child: Column(
        children: [
          _buildNavigation(context),
          _buildDisplayCertificate(context),
          _buildCertificateIssuer(context),
        ],
      ),
    )*/
        ;
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
                  Navigator.of(context).pop();
                  _certificateRequestStore.removeSelectedCertificate();
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
                'Certificate',
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

  Widget _buildPdfView() {
    return SfPdfViewer.network(
        'https://api.edu-block.org/Certificate/${widget.certificate.fileName}',
        controller: _pdfViewerController,
        onDocumentLoadFailed:(PdfDocumentLoadFailedDetails details){
          print('Document load failed: $details');

    },
        initialScrollOffset: Offset(0, 400),
        initialZoomLevel: 1.5);
  }
}
