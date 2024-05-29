
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/bottom_sheets/envelope_sorting_bottom_sheet/envelopes_sorting_bottom_sheet.dart';
import 'package:edublock/core/widgets/buttons/outline_button/outline_button.dart';
import 'package:edublock/core/widgets/my_wallet/my_wallet_envelope.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AllEnvelopesScreen extends StatefulWidget{
  @override
  State<AllEnvelopesScreen> createState() => _AllEnvelopesScreenState();
}

class _AllEnvelopesScreenState extends State<AllEnvelopesScreen> {

  final CreateEnvelopesStore _createEnvelopesStore =
  getIt<CreateEnvelopesStore>();
final CertificateRequestStore _certificateRequestStore =
  getIt<CertificateRequestStore>();


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      _createEnvelopesStore.getEnvelopeLists();

      print(
          'check envelopes  list length are here ${_createEnvelopesStore.envelopeLists.length}');
    } catch (error) {
      print('check all envelopes list are here $error');
      // Handle errors
    }
  }



  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          _buildRightSide(context),

          Observer(
            builder: (context) {
              return Visibility(
                visible: _createEnvelopesStore.isEnvelopeListsLoading || _certificateRequestStore.isEnvelopesByIDLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }


  Widget _buildRightSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildTopTitle(),

        Expanded(child: _buildAllCertificate()),
        SizedBox(height: 24.0,)
      ],
    );
  }

  Widget _buildTopTitle(){
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Activities',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Row(
              children: [
                OutLineButtonWidget(buttonName: 'Sort By',
                    horizontal: 8.0,
                    vertical: 8.0,
                    widthSize:0.2,
                    callback: () {
                      envelopesSortingBottomSheet(context);
                      // Navigator.of(context).pushNamed(Routes.createEvelopesScreen);


                    },fontSize:12.0),
                SizedBox(width:8.0),
                OutLineButtonWidget(buttonName: 'Create Envelope',
                    horizontal: 8.0,
                    vertical: 8.0,
                    widthSize:0.3,
                    callback: () {
                      Navigator.of(context).pushNamed(Routes.createEvelopesScreen);


                    },fontSize:12.0),

              ],
            ),

          ],
        )
    );
  }



  Widget _buildAllCertificate() {
    return Observer(builder: (context) {
      return _createEnvelopesStore.envelopeLists.length > 0
          ? ListView.separated(
        itemCount: _createEnvelopesStore.envelopeLists.length,
        // Set the itemCount to 1 since there's only one item
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyWalletEnvelope(envelope: _createEnvelopesStore.envelopeLists[index],
            ),
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


}
