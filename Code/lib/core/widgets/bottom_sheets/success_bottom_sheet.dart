import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';

import '../rounded_button_widget.dart';

// void successBottomSheet(BuildContext context, VoidCallback redirect) {
void successBottomSheet(BuildContext context,String title,String subTitle,String buttonName,VoidCallback callback) {
  const double _clipSpace = 50;
  const double _iconWidth = 100;
  showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*0.6,
        decoration: const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 32,
            ),

            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(145 * 3.1415926535 / 180), // 145 degrees to radians
                  colors: [
                    Color(0xFFDCD0E2),
                    Color(0xFFC2AFC6),
                  ],
                ),
              ),
              child: Center(
                child: Image.asset(Assets.thumbs_up,width: 100),
              ),
            ),


            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                title,
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0),
              child: Text(
                subTitle,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16),
                textAlign: TextAlign.center,

              ),
            ),
            const SizedBox(
              height: 8,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 24.0),
              child: RoundedButtonWidget(
                buttonText: buttonName,
                buttonColor: const Color.fromRGBO(31, 41, 56, 1),
                textColor: Colors.white,
                onPressed: callback,
              ),
            )
          ],
        ),
      );
    },
  );
}
