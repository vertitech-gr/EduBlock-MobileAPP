import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/custum_tab_bar/custum_tabbar.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_certificate.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_envelope.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/user/user.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/screens/my_wallet/my_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyWalletScreen extends StatefulWidget {

  final bool isViewAll;
  MyWalletScreen({this.isViewAll=true});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();

  final CreateEnvelopesStore _createEnvelopesStore =
  getIt<CreateEnvelopesStore>();
  final UserStore _userStore = getIt<UserStore>();

  List<String> tabList = ['Certificates', 'Envelope'];


  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final User? currentUser = _userStore.currentUser;

    print('check current user are here $currentUser');

    if (currentUser != null) {

      try {
      List results = await Future.wait([

      _certificateRequestStore.getCertificateLists(currentUser.existingUser.id),

          _createEnvelopesStore.getEnvelopeLists(),

    ]);
    } catch (error) {
      // Handle errors
    }}else{
      print("api is not call ");
    }
  }
   @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildRightSide(context),


        Observer(
          builder: (context) {
            return Visibility(
              visible:  _certificateRequestStore.isEnvelopesByIDLoading,
              child: const CustomProgressIndicatorWidget(),
            );
          },
        )
      ],
    );
  }


  Widget _buildRightSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Wallet',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              widget.isViewAll ?   CustumTextButton(
                  buttonName: 'View All',
                  callback: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyWalletWidget(),
                      ),
                    );
                  }):SizedBox()
            ],
          ),
        ),
        CustomTabbarScreen(
          tabLists: tabList,
          tabWidgets: [myWalletCertificate(), myWalletEnvelope()],
        ),
        // CustumTabbarScreen()
      ],
    );
  }
  bool _shouldAllowScrolling() {
    // Add your condition to check whether scrolling should be allowed or not
    return _scrollController.hasClients && _scrollController.offset > 0;
  }

  Widget myWalletCertificate() {
    return Observer(builder: (context) {
      return _certificateRequestStore.certificateLists.length > 0
          ? ListView.separated(

              itemCount: _certificateRequestStore.certificateLists.length,
        controller: _scrollController,
        physics: _shouldAllowScrolling() ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),

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


  Widget myWalletEnvelope() {
    return Observer(builder: (context) {
      return _createEnvelopesStore.envelopeLists.length > 0
          ? ListView.separated(
        controller: _scrollController,
        physics: _shouldAllowScrolling() ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
        itemCount: _createEnvelopesStore.envelopeLists.length,
        // Set the itemCount to 1 since there's only one item
        itemBuilder: (BuildContext context, int index) {
          return MyWalletEnvelope(envelope: _createEnvelopesStore.envelopeLists[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(padding: EdgeInsets.symmetric(vertical: 12.0));
        },
      )
          : Container(
        child: Text("No Envelopes",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            )),
      );
    });


  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}
