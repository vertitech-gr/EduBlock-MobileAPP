import 'dart:async';
import 'dart:io' show Platform;

import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/data/sharedpref/constants/preferences.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';



import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:const Color.fromRGBO(36, 40, 59, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150, // Set your desired width
              height: 150 * 1,
              padding: const EdgeInsets.all(14.0),
              decoration: const BoxDecoration(
                color:Color(0xFF07B08D),
                borderRadius: BorderRadius.all(Radius.circular(13.0))

              ),
              child: SvgWidget(
                path: Assets.EduAppLogo,
                label: 'Assets.EduAppLogo',
                percentage: Platform.isAndroid ? .5 : 1.6,
              ),
            ),
            const SizedBox(height: 4.0,),
            SvgWidget(
              path: Assets.EduAppTextLogo,
              label: 'Assets.EduAppTextLogo',
              percentage: Platform.isAndroid ? .2 : 1.2,
            ),
          ],
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 200);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
