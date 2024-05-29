import 'dart:async';

import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StudentCertificateCheckbox extends StatefulWidget {
  final CertificateDetails certificateDetails;
  final VoidCallback callback;
  final bool isEditEnvelopes;

  StudentCertificateCheckbox(
      {super.key,
      required this.callback,
      required this.certificateDetails,
      this.isEditEnvelopes = false});

  @override
  State<StudentCertificateCheckbox> createState() =>
      _StudentCertificateCheckboxState();

}

class _StudentCertificateCheckboxState
    extends State<StudentCertificateCheckbox> {
  bool isChecked = false;
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();
  late PdfViewerController _pdfViewerController;



  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    print('re rendered ${widget.certificateDetails.id}');
     if(widget.isEditEnvelopes){
       if (_createEnvelopesStore.editCertificateEnvelopes.any((element) =>
       element.id == widget.certificateDetails.id && !isChecked)) {
         if(widget.certificateDetails.status){
           isChecked = true;

         }else{
           isChecked = false;

         }
       }

     } else {
       if (_createEnvelopesStore.studentSelectedCertificate.any((element) =>
       element.id == widget.certificateDetails.id && !isChecked)) {
         if(!widget.certificateDetails.status){
           isChecked = false;

         }else{
           isChecked = true;


         }
       }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("check issue status zE ${widget.certificateDetails.status}");
    return SizedBox(
      width: 110,
      height:120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color:widget.certificateDetails.status? Theme.of(context).backgroundColor :Colors.red, width: 2)),
                height:88,
                width: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.certificateDetails.degreeType!,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                   widget.certificateDetails.status ?SizedBox(): Text(
                      "REVOKED",
                      maxLines: 3,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onErrorContainer,
                          ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -4,
                  right: -4.0,
                  child: SizedBox(child:  Checkbox(
                      checkColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      activeColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      value: isChecked,
                      onChanged: widget.certificateDetails.status ? widget.isEditEnvelopes
                          ? (bool? value) {
                              setState(() {
                                if (!_createEnvelopesStore
                                        .editCertificateEnvelopes
                                        .contains(widget.certificateDetails) &&
                                    !isChecked) {
                                  isChecked = true;
                                  _createEnvelopesStore.addCertificateEnvelopes(
                                      widget.certificateDetails);
                                } else if (_createEnvelopesStore
                                        .editCertificateEnvelopes
                                        .any((element) =>
                                            element.id ==
                                            widget.certificateDetails.id) &&
                                    isChecked) {
                                  isChecked = false;
                                  _createEnvelopesStore
                                      .removeEnvelopesCertificateID(
                                          widget.certificateDetails);
                                }
                              });
                            }
                          : (bool? value) {
                              setState(() {
                                print(
                                    'check certificate Reqquest selected certificte ${_createEnvelopesStore.studentSelectedCertificate}');
                                print('check selectes box isCheck ${isChecked} ');

                                if (!_createEnvelopesStore
                                        .studentSelectedCertificate
                                        .contains(widget.certificateDetails) &&
                                    !isChecked) {
                                  print('check user check student are ');

                                  isChecked = true;
                                  _createEnvelopesStore
                                      .setStudentSelectedCertificate(
                                          widget.certificateDetails);
                                } else if (_createEnvelopesStore
                                        .studentSelectedCertificate
                                        .contains(widget.certificateDetails) &&
                                    isChecked) {
                                  print('else here');
                                  isChecked = false;
                                  _createEnvelopesStore
                                      .removeStudentSelectedCertificateID(
                                          widget.certificateDetails);
                                }
                              });
                            } : null,
                    )))
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.certificateDetails.name,
            maxLines: 3,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  Widget _buildPdfView(){
    return  SfPdfViewer.network('https://api.edublock.bucle.dev/Certificate/1706104587.pdf',

        controller: _pdfViewerController,
        initialScrollOffset: Offset(0, 10),
        initialZoomLevel: 1.0,
      pageLayoutMode: PdfPageLayoutMode.single,


    );

  }

}
