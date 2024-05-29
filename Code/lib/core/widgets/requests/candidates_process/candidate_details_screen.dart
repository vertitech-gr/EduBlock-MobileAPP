import 'package:edublock/core/widgets/buttons/outline_button/outline_button.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/certificate_container_checkbox.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:flutter/material.dart';

class CandidateDetailScreen extends StatefulWidget {
  @override
  State<CandidateDetailScreen> createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  List<String> tabList = ['Employer', 'Institutional', 'Candidates'];

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavigation(),
          _buildEmployerDetails(),
          // _buildAllCertificates(),
          _buildEmployerMessage(),
          _buildUploadButton(),

        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // Adjust the mainAxisSize to minimize the width of the Row

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
                'Request from Employer1',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmployerDetails() {
    return Container(
      padding: const EdgeInsets.only(left:8.0,right: 16.0),
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              'Details',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              'Company Name- Location- Job Criteria',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 11
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              'Package-',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 11
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              'Designation - React Developer',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 11
              ),
            ),
          ),
          Padding(
            child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 0.5
                  ),
                  children:  <TextSpan>[
                    const TextSpan(text: 'Company -'),
                    TextSpan(text: ' Employer1',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          height: 1.5

                      ),
                    ),
                  ]),
            ),
            padding: const EdgeInsets.symmetric(vertical: 1.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Text(
              'Request Date- 14-12-2023',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 11
              ),
            ),
          ),



        ],
      ),
    );
  }

  // Widget _buildAllCertificates(){
  //   return Padding(
  //       padding: const EdgeInsets.only(top: 16.0,bottom: 16.0,right: 8.0),
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Choose certificates to share with Employer1',
  //               style: Theme.of(context).textTheme.labelLarge?.copyWith(
  //                 fontWeight: FontWeight.w800,
  //                 color: Theme.of(context).colorScheme.primary,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 16.0),
  //               child: Wrap(
  //
  //                 spacing: 16,
  //                 children: List.generate(
  //                   3,
  //                       (index) =>SizedBox(
  //                     width: 108,
  //                     child: CertificateContainerCheckbox(callback: () {  }, certificateName: '', id: 1,),
  //                   ),
  //
  //
  //
  //                 ),
  //
  //               ),
  //             ),
  //           ]
  //       )
  //   );
  // }

  Widget _buildEmployerMessage(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,bottom: 16.0,right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,bottom: 12.0),
            child: Text(
              'Employer Message',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 0.0),
            child: Text(
              'Employer wants to see your certificates so get them view your documents by giving them authority to view certificates ',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildUploadButton(){
    return Padding(
      padding: const EdgeInsets.only(top:16.0,bottom:16.0,right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0),
            child: Text(
              'Give permission to view your certificates',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButtonWidget(buttonName: 'Unlock All', callback: () {  },),
              OutLineButtonWidget(buttonName: 'Declined ', callback: () {  },),
            ],
          ),
        ],
      ),
    );
  }
}
