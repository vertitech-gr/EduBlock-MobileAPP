
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/custum_tab_bar/custum_tabbar.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_certificate.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_envelope.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWalletWidget extends StatefulWidget{
  @override
  State<MyWalletWidget> createState() => _MyWalletWidgetState();
}

class _MyWalletWidgetState extends State<MyWalletWidget> {



  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildMyActivity()
        ],
      ),
    );
  }

  Widget _buildMyActivity(){
    return MyWalletScreen(isViewAll: false,);
  }


}