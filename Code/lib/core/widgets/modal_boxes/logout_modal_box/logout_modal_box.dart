import 'dart:ui';

import 'package:edublock/core/widgets/buttons/modal_box_outline_button/modal_box_outline_button.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

showAlertLogoutDialog(BuildContext context, String title,String btnName,VoidCallback callback) {
  final UserStore _userStore = getIt<UserStore>();

  Widget yesButton = SizedBox(width:100,child: RoundedButtonWidget(buttonName: btnName, callback:callback,isRed: true,horizontal: 8,vertical: 8,));

  Widget cancelButton = CustumTextButton(buttonName: '( Cancel)', callback: (){Navigator.of(context).pop();},isIcon:false,isWhite:true,fontSize:16.0);

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
          Observer(
            builder: (context) {
            return
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.secondaryContainer
                )
              ),
              contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              content: Container(
                height: 160,
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
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
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
                        'Are you Sure?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onErrorContainer,
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
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [yesButton,SizedBox(width: 16.0),cancelButton],
                  ),
                ),
              ],
            );}
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLogoutLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      );
    },
  );
}
