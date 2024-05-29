import 'dart:ui';

import 'package:edublock/core/widgets/buttons/modal_box_outline_button/modal_box_outline_button.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

showAlertEnvelopeModalDialog(BuildContext context, List<CertificateDetails> totalEnvelopesList) {
  Widget cancelButton = ModalBoxOutlineButton(
    background: Theme.of(context).colorScheme.primaryContainer,
    buttonName: 'Back', callback: () { Navigator.pop(context); },bordColor: Theme.of(context).colorScheme.onPrimary,);

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
            backgroundColor: Theme.of(context).primaryColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            content: Container(
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          '${AppLocalizations.of(context).translate('envelopes_screen_name')} ${totalEnvelopesList.length} ' ,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.inverseSurface,
                              height: 1.5,
                              letterSpacing: 0.5
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    //
                    // padding: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 250,
                    child:ListView.separated(
                      shrinkWrap: true,

                      itemCount: totalEnvelopesList.length, // Set the itemCount to 1 since there's only one item
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 8.0),
                          child: Text(
                            totalEnvelopesList[index].name ,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.inverseSurface,
                                height: 1.1,
                                letterSpacing: 0.5
                            ),
                            textAlign: TextAlign.start,
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: 0.5,color: Theme.of(context).dividerColor,);
                    },
                    ),
                  )



                                  ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [cancelButton],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
