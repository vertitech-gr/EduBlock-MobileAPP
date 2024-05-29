import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/buttons/modal_box_outline_button/modal_box_outline_button.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

showAlertShareLinkQrCodeDialog(
  BuildContext context,
  String title,
    String link
) {
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();
  ScreenshotController screenshotController = ScreenshotController();

  // Future<void> _shareQrCode() async {
  //   final directory = (await getApplicationDocumentsDirectory()).path;
  //   screenshotController.capture().then((Uint8List? image) async {
  //
  //     if (image != null) {
  //       try {
  //         String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  //
  //
  //         final imagePath = await File('$directory/$fileName.png').create();
  //         if (imagePath != null) {
  //           await imagePath.writeAsBytes(image);
  //           Share.shareFiles([imagePath.path]);
  //         }
  //       } catch (error) {}
  //     }
  //   }).catchError((onError) {
  //     print('Error --->> $onError');
  //   });
  // }


  Widget yesButton = ModalBoxOutlineButton(
    horizontal: 40.0,

    buttonName: 'Share',
    callback: () async{
        await Share.share(link);
        Navigator.of(context).pop();
    },
    bordColor: Theme.of(context).colorScheme.primaryContainer,
  );
  Widget cancelButton = ModalBoxOutlineButton(
    horizontal: 40.0,
    buttonName: 'No',
    callback: () {
      Navigator.pop(context);
    },
    bordColor: Theme.of(context).colorScheme.primaryContainer,
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          // Blur background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          // Modal box
          AlertDialog(
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            content: Container(
              height: 300,
              // color: Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(Icons.close),
                  //       onPressed: () => Navigator.pop(context),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    height: 1.5,
                                    letterSpacing: 0.5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200, // Adjust the height as needed
                    child: Screenshot(
                      controller: screenshotController,
                      child: QrImageView(
                        data: link,
                        version: QrVersions.auto,
                        size: 150.0, // Adjust the size as needed
                      ),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [yesButton, cancelButton],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
