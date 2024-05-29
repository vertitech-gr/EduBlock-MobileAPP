import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> tabList = ['Employer', 'Institutional', 'Candidates'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'My Wallet',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),),
                ),
                CustumTextButton(buttonName: 'View All', callback: () {})
              ],

            ),
          ),
          // CustomTabbarScreen(tabLists: tabList, tabWidgets: [myWalletCertificate(),myWalletEnvelope()], ),
          // CustumTabbarScreen()

        ],
      ),
    );
  }

}
