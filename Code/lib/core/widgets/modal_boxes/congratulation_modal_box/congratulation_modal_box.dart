import 'dart:ui';

import 'package:edublock/core/widgets/buttons/modal_box_outline_button/modal_box_outline_button.dart';
import 'package:flutter/material.dart';

showAlertCongratulationDialog(BuildContext context, String subsTitle,String btnName,VoidCallback callback) {
  Widget yesButton = ModalBoxOutlineButton(buttonName: btnName, callback: callback, bordColor: Theme.of(context).colorScheme.secondaryContainer,);

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
              height: MediaQuery.of(context).size.height*0.4,
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
                            'Congratulations!!!',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 32,
                                fontWeight: FontWeight.w600,
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
                    child: Text(
                      subsTitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                          height: 1.5,
                          letterSpacing: 0.5
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [yesButton],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
