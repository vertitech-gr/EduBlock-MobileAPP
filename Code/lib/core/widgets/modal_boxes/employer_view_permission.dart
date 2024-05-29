import 'dart:ui';

import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/buttons/modal_box_outline_button/modal_box_outline_button.dart';
import 'package:edublock/core/widgets/modal_boxes/congratulation_modal_box/congratulation_modal_box.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

showAlertEmployerViewPermissionDialog(BuildContext context, String title,Widget subsTitle,VoidCallback callback) {

  final CreateEnvelopesStore _createEnvelopesStore = getIt<CreateEnvelopesStore>();

  Widget yesButton = ModalBoxOutlineButton(buttonName: 'Yes', callback: callback, bordColor: Theme.of(context).primaryColor,);
  Widget cancelButton = ModalBoxOutlineButton(buttonName: 'No', callback: () { Navigator.pop(context); },bordColor: Theme.of(context).primaryColor,);

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
            content: Container(
              height: 200,
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
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).primaryColor,
                              height: 1.5,
                              letterSpacing: 0.5
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: subsTitle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [yesButton,cancelButton],
                ),
              ),
            ],
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _createEnvelopesStore.isCreateEnvelopesLoading || _createEnvelopesStore.isShareLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),

        ],
      );
    },
  );
}
