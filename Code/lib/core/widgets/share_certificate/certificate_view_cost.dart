import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

typedef CheckBoxCallback = void Function(bool? value);

class CertificateViewCostScreen extends StatefulWidget {
  @override
  State<CertificateViewCostScreen> createState() =>
      _CertificateViewCostScreenState();
}

class _CertificateViewCostScreenState extends State<CertificateViewCostScreen> {
  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();

  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();

  @override
  void initState() {
    super.initState();
    // _userEmailController.text = AppLocalizations.of(context).translate('profile_dummy_email');
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
                visible: _userStore.isChangePasswordLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildNavigation(),
          _buildCertificateReceiver(),
          Center(child: _buildCertificateViewCost()),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                size: 20,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                AppLocalizations.of(context)
                    .translate('share_screen_share_college_certificate'),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateReceiver() {
    return Column(
      children: [
        Container(
          height: 140,
          width: 124,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: Theme.of(context).colorScheme.inversePrimary),
          // child: ,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'High School Certificate',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondaryContainer,
              height: 1.4,
              letterSpacing: 0.8),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Receiver (Graduate@gmail.com) ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondaryContainer,
              height: 1.4,
              letterSpacing: 0.8),
        ),
      ],
    );
  }

  Widget _buildCertificateViewCost() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1.1),
                    children: <TextSpan>[
                      const TextSpan(text: 'Certificate View Cost '),
                      TextSpan(
                        text: ' 3Coins',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            height: 1.5),
                      ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 12.0),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .colorScheme
                      .onErrorContainer, // Set the background color of the circle
                ),
                child: Icon(
                  Icons.question_mark,
                  size: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            ]),
          ),
          _buildAdvanceFees(),
          _buildSplitFees(),
          _buildReceiverFees(),
          _buildTermCondition(),
        ]);
  }

  Widget _buildReceiverFees() {

    return Observer(
        builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 48.0,top:8.0,bottom: 8.0),
        child: GestureDetector(
          onTap: (){
            _certificateRequestStore.setIsPayingInAdvance(false);
            _certificateRequestStore.setIsReceiverPay(!_certificateRequestStore.isReceiverPay);
            _certificateRequestStore.setIsSplitPayment(false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  checkColor: Theme.of(context).colorScheme.primaryContainer,
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  side: BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  value: _certificateRequestStore.isReceiverPay,
                  onChanged: (bool? value) {

                    print('callbback function run here ${_certificateRequestStore.isReceiverPay}');

          },
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                "Paying in advance receiver fees",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    height: 1,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
      );}
    );
  }
  Widget _buildSplitFees() {

    return Observer(
        builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 48.0,top:8.0,bottom: 8.0),
        child: GestureDetector(
          onTap: (){
            _certificateRequestStore.setIsPayingInAdvance(false);
            _certificateRequestStore.setIsReceiverPay(false);
            _certificateRequestStore.setIsSplitPayment(!_certificateRequestStore.isSplitPayment);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    checkColor: Theme.of(context).colorScheme.primaryContainer,
                    activeColor: Theme.of(context).colorScheme.secondaryContainer,
                    side: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    value: _certificateRequestStore.isSplitPayment,
                    onChanged:(bool? value) {
                      // Handle checkbox state change here
                    },
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  "Split payment equally ",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      height: 1,
                      letterSpacing: 0.5),
                ),
              ],
            ),
          ),
        ),
      );}
    );
  }
  Widget _buildAdvanceFees() {

    return Observer(
        builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 48.0,top:24.0,bottom: 8.0),
        child: GestureDetector(
          onTap: (){
            _certificateRequestStore.setIsPayingInAdvance(!_certificateRequestStore.isPayingInAdvance);
            _certificateRequestStore.setIsReceiverPay(false);
            _certificateRequestStore.setIsSplitPayment(false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                  checkColor: Theme.of(context).colorScheme.primaryContainer,
                  activeColor: Theme.of(context).colorScheme.secondaryContainer,
                  side: BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  value: _certificateRequestStore.isPayingInAdvance,
                  onChanged:(bool? value) {
                    print('check value to the  Paying in advance receiver fees $value');
                    // Handle checkbox state change here
                    // setState(() {
                    //   _certificateRequestStore.setIsPayingInAdvance(!_certificateRequestStore.isPayingInAdvance);
                    //   _certificateRequestStore.setIsReceiverPay(_certificateRequestStore.isReceiverPay);
                    //   _certificateRequestStore.setIsSplitPayment(_certificateRequestStore.isSplitPayment);
                    // });
                  },
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                "Paying in advance receiver fees",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    height: 1,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
      );}
    );
  }

  Widget _buildTermCondition(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Text(
              "Term & Conditions",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  height: 1.5,
                  letterSpacing: 0.5),
            ),
          ),
          SizedBox(height: 16.0,),
          RoundedButtonWidget(buttonName: 'Procced',callback: (){},isDisable:true),

        ],
      ),
    );
  }
}
