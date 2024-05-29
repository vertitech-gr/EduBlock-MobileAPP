import 'package:edublock/constants/assets.dart';
import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/widgets/buttons/text_button/custum_text_button.dart';
import 'package:edublock/core/widgets/envelopes/edit_envelopes/envelopes_edit_screen.dart';
import 'package:edublock/core/widgets/envelopes/envelopes_certificate_list_screen/envelopes_certificate_list_screen.dart';
import 'package:edublock/core/widgets/modal_boxes/logout_modal_box/logout_modal_box.dart';
import 'package:edublock/core/widgets/modal_boxes/share_link_qr_code/share_link_qr_code.dart';
import 'package:edublock/core/widgets/share_certificate/share_certificate.dart';
import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/envelopes/envelope_list.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MyWalletEnvelope extends StatelessWidget{
  final Envelope envelope;
  MyWalletEnvelope({required this.envelope});

  final CertificateRequestStore _certificateRequestStore =
  getIt<CertificateRequestStore>();

  final CreateEnvelopesStore _createEnvelopesStore =
  getIt<CreateEnvelopesStore>();

  void _shareProductLink(String link) {
    // String dynamicLink = createProductDynamicLink(widget.productID.toString());

    Share.share(link);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _createEnvelopesStore.addAllCertificateInEnvelopes(envelope.credentials);

        _createEnvelopesStore.setEnvelopesID(envelope.id);
        // _createEnvelopesStore.setAllCredentialID(envelope.credential.map((certificate) => certificate.id).toList());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EnvelopesEditScreen(envelope: envelope,),
          ),
        );



        // _createEnvelopesStore.addStudentSelectedCertificate(envelope.credentials);
        //
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => EnvelopesEditScreen(envelope: envelope,),
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color:Theme.of(context).backgroundColor,
            width: 1
          )
        ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity(horizontal: 0, vertical: 0),

        leading: GestureDetector(
          onTap: (){

          },
          child: SvgWidget(
            path: Assets.eyesCircle,
            label: Assets.eyesCircle,
            percentage: 0.09,
          ),
        ),
        title:  Transform(
          transform: Matrix4.translationValues(-16, 0.0, 0.0),
          child: Row(
            children: [
              SvgWidget(
                path: Assets.folder,
                label: Assets.folder,
                percentage: 0.09,
              ),
            SizedBox(width: 8.0,),
              Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                    '${envelope.name}',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        fontWeight:
                        FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        height: 1.3


                    )



                ),
                // Text('Certificate 1. Certificate 2 ,Certificate 3',
                //     style: Theme.of(context)
                //         .textTheme
                //         .labelSmall
                //         ?.copyWith(
                //         fontWeight:
                //         FontWeight.w400,
                //         color:Theme.of(context).primaryColor.withOpacity(0.6),
                //       height: 1.5
                // )),
              ],
            )],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PopupMenuButton(
            //   padding: EdgeInsets.symmetric(horizontal: 18.0),
            //   offset: Offset(3, 40),
            //
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(4.0),
            //       side: BorderSide(
            //
            //           width:1,
            //           color: Theme.of(context).colorScheme.secondaryContainer
            //       )
            //   ),
            //   color: Theme.of(context).colorScheme.primaryContainer,
            //   itemBuilder: (context) {
            //     return [
            //       // PopupMenuItem(
            //       //   child: Column(
            //       //     crossAxisAlignment: CrossAxisAlignment.start,
            //       //     children: [
            //       //       CustumTextButton(buttonName: 'View', callback: (){
            //       //
            //       //       },isIcon:false,isWhite: true,fontSize: 16.0),
            //       //       Divider(height: 1,thickness: 0,)
            //       //     ],
            //       //   ),
            //       // ),
            //       PopupMenuItem(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             CustumTextButton(buttonName: 'Share By QRCODE', callback: (){
            //               // _certificateRequestStore.setShareCertificateID(envelope.id);
            //               _certificateRequestStore.getEnvelopesLinkByID(envelope.id).then((value){
            //                 Navigator.pop(context); // Close the PopUpMenu
            //
            //                 showAlertShareLinkQrCodeDialog(context, 'QR code Share ',value!.data?['pdfLink']!);
            //
            //               });
            //
            //               // showAlertShareLinkQrCodeDialog(context, 'QR code Share ',"link no available");
            //             },isIcon:false,isWhite: true,fontSize: 16.0,isRed: false,),
            //             Divider(height: 1,thickness: 0,)
            //           ],
            //         ),
            //       ),
            //       PopupMenuItem(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             CustumTextButton(buttonName: 'Share', callback: (){
            //               // _shareProductLink('https://www.figma.com/file/RYt5Gtj054FGYEDoNzGLg4/Edublock?node-id=121%3A320&mode=dev');
            //               // showAlertLogoutDialog(context, 'You are attempting to Delete this Envelope', 'Delete', () { });
            //               // Navigator.of(context).pushNamed(Routes.shareCertificateScreen);
            //               _createEnvelopesStore.setEnvelopesID(envelope.id);
            //               // _createEnvelopesStore.setAllCredentialID(envelope.credential.map((certificate) => certificate.id).toList());
            //               Navigator.pop(context); // Close the PopUpMenu
            //
            //               Navigator.of(context).push(
            //                   MaterialPageRoute(
            //                     builder: (context) => ShareCertificateScreen(isEnvelopesShare:true,title:"Share Envelope"),
            //                   ));
            //
            //               },isIcon:false,isWhite: true,fontSize: 16.0),
            //           ],
            //         ),
            //       )
            //     ];
            //   },
            //
            //   child: Icon(Icons.more_vert,
            //   color: Theme.of(context).primaryColor,
            //     size: 28,
            //   ),
            // )


          ],
        ),
      )
      ),
    );
  }
  // Widget _buildPopupMenuItem(
  //     String title) {
  //   return showPopover(
  //     child: PopupMenuItem(
  //       child: Text(title),
  //     ),
  //   );
  // }

}
