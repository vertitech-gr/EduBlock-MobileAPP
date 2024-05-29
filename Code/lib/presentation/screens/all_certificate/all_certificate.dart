
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/custum_tab_bar/custum_tabbar.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_certificate.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_envelope.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AllCertificateScreen extends StatefulWidget{
  @override
  State<AllCertificateScreen> createState() => _AllCertificateScreenState();
}

class _AllCertificateScreenState extends State<AllCertificateScreen> {
  final CertificateRequestStore _certificateRequestStore =
  getIt<CertificateRequestStore>();
 final UserStore _userStore   = getIt<UserStore>();


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      _certificateRequestStore.getCertificateLists(_userStore.currentUser!.existingUser.id);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget myWalletCertificate() {
    return Observer(builder: (context) {
      return _certificateRequestStore.certificateLists.length > 0
          ? ListView.separated(
        itemCount: _certificateRequestStore.certificateLists.length,
        // Set the itemCount to 1 since there's only one item
        itemBuilder: (BuildContext context, int index) {
          return MyWalletCertificate(
            certificate: _certificateRequestStore.certificateLists[index],
            isHidden: false,
            isThreeDots: false,
            callback: () {},
            certificateName: _certificateRequestStore
                .certificateLists[index].degreeName,
            issueDate: _certificateRequestStore
                .certificateLists[index].issuanceDate,
            certificateType: _certificateRequestStore
                .certificateLists[index].degreeType,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(padding: EdgeInsets.symmetric(vertical: 12.0));
        },
      )
          : Container(
        child: Text("No certificate",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            )),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildRightSide(context),


        Observer(
          builder: (context) {
            return Visibility(
              visible:  _certificateRequestStore.isCertificatePdfLinkByIDLoading,
              child: const CustomProgressIndicatorWidget(),
            );
          },
        )
      ],
    );
  }


  Widget _buildRightSide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
                AppLocalizations.of(context).translate('my_wallet_screen_all'),

              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(child: myWalletCertificate()),
          SizedBox(height: 24.0,)
        ],
      ),
    );
  }

  // Widget _buildAllCertificate(){
  //   return  Container(
  //     height: MediaQuery.of(context).size.height,
  //
  //     child: ListView.separated(
  //       itemCount: 20, // Set the itemCount to 1 since there's only one item
  //       itemBuilder: (BuildContext context, int index) {
  //         return MyWalletCertificate(isHidden: false, isThreeDots: true, callback: () {  }, certificateName: '', issueDate: '', certificateType: '',);
  //       }, separatorBuilder: (BuildContext context, int index) {
  //       return Padding(padding: EdgeInsets.symmetric(vertical: 12.0));
  //     },
  //     ),
  //   );
  // }



}
