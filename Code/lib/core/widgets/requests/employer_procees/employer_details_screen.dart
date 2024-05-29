import 'dart:ui';

import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/certificate_request_store/create_envelopes_store/create_envelopes_store.dart';
import 'package:edublock/core/stores/employees_store/employees_store.dart';
import 'package:edublock/core/widgets/buttons/outline_button/outline_button.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/student_certificate_checkbox.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/custum_drop_down_menu.dart';
import 'package:edublock/core/widgets/modal_boxes/congratulation_modal_box/congratulation_modal_box.dart';
import 'package:edublock/core/widgets/modal_boxes/employer_view_permission.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/envelopes/envelopes.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class EmployerDetailScreen extends StatefulWidget {
  final RecievedRequest recievedRequest;

  EmployerDetailScreen({super.key, required this.recievedRequest});

  @override
  State<EmployerDetailScreen> createState() => _EmployerDetailScreenState();
}

class _EmployerDetailScreenState extends State<EmployerDetailScreen> {
  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  final CreateEnvelopesStore _createEnvelopesStore =
      getIt<CreateEnvelopesStore>();
  final EmployeesStore _employeesStore = getIt<EmployeesStore>();
  TextEditingController _envelopeName = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  late FocusNode _userEmailFocusNode;

  late FocusNode _envelopeNameFocusNode;

  Map<int, String> statusMap = {
    0: 'Pending',
    1: 'Shared',
    2: 'Rejected',
    3: 'Fulfilled',
  };




  @override
  void initState() {
    super.initState();

    _envelopeNameFocusNode = FocusScopeNode();
    _userEmailFocusNode = FocusScopeNode();
    fetchData();
  }

  void fetchData() async {
    try {
      _employeesStore.getProfileDetails(widget.recievedRequest.senderId);
    } catch (error) {
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
                visible: _createEnvelopesStore.isCreateEnvelopesLoading ||
                    _employeesStore.isEmployeesByIDDetails ||
                    _certificateRequestStore.isEmployeesRequestDeclinedLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),
          statusMap[widget.recievedRequest.status] == "Rejected"
              ? _buildRejected(context) :
          statusMap[widget.recievedRequest.status] == "Fulfilled" || statusMap[widget.recievedRequest.status] == "Shared" ?
          _buildSharedFullfill(context)
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildRejected(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            height:
                MediaQuery.of(context).size.height, // width: double.infinity,
            color: Colors.transparent,
          ),
        ),
        // Loader
        Container(
          height: 100,
          constraints: BoxConstraints.expand(),
          child: FittedBox(
            fit: BoxFit.none,
            child: SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Transform.rotate(
                      angle: -45 * (3.1415926535 / 180),
                      // Convert degrees to radians
                      child: Text(
                        'Rejected',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: 44,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onErrorContainer,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: OutLineButtonWidget(
                      buttonName: 'Go Back ',
                      callback: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSharedFullfill(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            height:
                MediaQuery.of(context).size.height, // width: double.infinity,
            color: Colors.transparent,
          ),
        ),
        // Loader
        Container(
          height: 100,
          constraints: BoxConstraints.expand(),
          child: FittedBox(
            fit: BoxFit.none,
            child: SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Transform.rotate(
                      angle: -45 * (3.1415926535 / 180),
                      // Convert degrees to radians
                      child: Text(
                        statusMap[widget.recievedRequest.status]!,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: 44,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context)
                                      .colorScheme.secondaryContainer,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: OutLineButtonWidget(
                      buttonName: 'Go Back ',
                      callback: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavigation(),
            _buildEmployerDetails(),
            _buildSelectEnvelopes(),
            _buildAllCertificates(),

            // _buildEmailID(),
            _buildEmployerMessage(),
            _buildUploadButton(),
          ],
        ));
  }

  Widget _buildEmailID() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          focusNode: _userEmailFocusNode,
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_email_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _createEnvelopesStore.setEmail(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            handleCreateEnvelope();

            // FocusScope.of(context).requestFocus(_contactFocusNode);
          },
          errorText: _createEnvelopesStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_course_email'),
        );
      },
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // Adjust the mainAxisSize to minimize the width of the Row

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _createEnvelopesStore.removeStudentSelectedCertificate();
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                'Request from ${widget.recievedRequest.empName}',
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
    DateTime formattedIssueDate =
        DateTime.parse(widget.recievedRequest.createdDateTime);

    // String formattedIssueDate = ;

    return Observer(builder: (context) {
      return Container(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
        width: double.infinity,
        child: _employeesStore.employeesDetails != null
            ? Column(
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
                      'Company Name- Location- ${_employeesStore.employeesDetails!.userAddress}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 11),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 1.0),
                  //   child: Text(
                  //     'Package-',
                  //     style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  //       fontWeight: FontWeight.w400,
                  //       color: Theme.of(context).colorScheme.primary,
                  //       fontSize: 11
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      'Designation - ${_employeesStore.employeesDetails!.userSpecificIndustry}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: 0.5),
                          children: <TextSpan>[
                            const TextSpan(text: 'Company -'),
                            TextSpan(
                              text:
                                  ' ${_employeesStore.employeesDetails!.userIndustry}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      height: 1.5),
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      'Request Date- ${DateFormat('dd-MM-yyyy').format(formattedIssueDate)}',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 11),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      );
    });
  }

  Widget _buildAllCertificates() {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose certificates to share with Employer1',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Observer(builder: (_) {
                  return _createEnvelopesStore.onChangeTriggered == false && _createEnvelopesStore.selectedEnvelopes != null ? Wrap(
                    spacing: 16,
                    children: List.generate(
                      _createEnvelopesStore.selectedEnvelopes!.credentials.length,
                          (index) {
                        return  SizedBox(
                          width: 108,
                          child: StudentCertificateCheckbox(
                            callback: () {},
                            certificateDetails: _createEnvelopesStore
                                .selectedEnvelopes!.credentials[index],
                          ),
                        );
                      },
                    ),
                  ) : SizedBox(
                    height: 120,
                    width: 108,
                  );
                }),
              ),
            ]));
  }

  Widget _buildEmployerMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
            child: Text(
              'Employer Message',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: MarkdownBody(data: widget.recievedRequest.description, styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                    listBullet: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Give permission to view your certificates',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButtonWidget(
                    buttonName:
                        'Unlock  ${_createEnvelopesStore.selectedEnvelopes != null ? _createEnvelopesStore.studentSelectedCertificate.length == _createEnvelopesStore.selectedEnvelopes!.credentials.length ? 'All' : _createEnvelopesStore.studentSelectedCertificate.length : 0} ',
                    callback: handleCreateEnvelope,
                    isDisable: statusMap[widget.recievedRequest.status] == "Fulfilled" || statusMap[widget.recievedRequest.status] == "Shared"),
                OutLineButtonWidget(
                isDisable: statusMap[widget.recievedRequest.status] == "Fulfilled" || statusMap[widget.recievedRequest.status] == "Shared",

                    buttonName: 'Decline ',
                  callback: () {
                    handleCertificateRequestDeclined();
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildUserFullNameField() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          fontSize: 14,
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate('envelope_ct_envelope'),
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _envelopeName,
          inputAction: TextInputAction.next,
          autoFocus: true,
          focusNode: _envelopeNameFocusNode,
          onChanged: (value) {
            _createEnvelopesStore.setEnvelopesName(_envelopeName.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_userEmailFocusNode);
          },
          errorText: _createEnvelopesStore.formErrorStore.envelopeName,
          isSuffixIcon: false,
          labelText: 'Envelope Name',
        );
      },
    );
  }

  void handleCreateEnvelope() {
    if (_createEnvelopesStore.studentSelectedCertificate.isNotEmpty) {
      _createEnvelopesStore.studentSelectedCertificate
          .map((certificate) => certificate.id)
          .toList();
      showAlertEmployerViewPermissionDialog(context, 'View Permission',
          _buildRichText(), handleCertificateRequestAccess);

      DeviceUtils.hideKeyboard(context);
    } else {
      showNotification(
          context, 'error', 'Error', 'Please Select Certificates .');
    }
  }

  Widget _buildSelectEnvelopes() {
    return Observer(builder: (context) {
      return CustomDropdownMenu<Envelope>(
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,

        options: _createEnvelopesStore.envelopeLists,
        getLabel: (Envelope item) => item.name,
        onChanged: (Envelope? item) async {
          _createEnvelopesStore.setOnChangeTriggered(true);
          _createEnvelopesStore.setSelectedEnvelopes(null);
          await Future.delayed(Duration(milliseconds: 100));
          _createEnvelopesStore.setSelectedEnvelopes(item!);
          _createEnvelopesStore.removeStudentSelectedCertificate();
          _createEnvelopesStore.setOnChangeTriggered(false);
        },
        title: "Select Envelopes",
        value: _createEnvelopesStore.envelopeLists.where(
          (envelope) =>
          _createEnvelopesStore.selectedEnvelopes != null ? envelope.name == _createEnvelopesStore.selectedEnvelopes!.name : false,
        ).firstOrNull,
      );
    });
  }

  Future<void> handleCertificateRequestAccess() async {

    print('check all student selected certificate ${_createEnvelopesStore.studentSelectedCertificate
        .map((certificate) => certificate.id)
        .toList().runtimeType}   ::: ${_createEnvelopesStore.studentSelectedCertificate.length}');

     print('check here to the email ${_employeesStore.employeesDetails!.userEmail}');

    try {


      ApiResponse? value =
          await _createEnvelopesStore.shareEnvelopesCertificate(
              2,
              _employeesStore.employeesDetails!.userEmail,
              _createEnvelopesStore.selectedEnvelopes!.id,
              _createEnvelopesStore.studentSelectedCertificate
                  .map((certificate) => certificate.id)
                  .toList(), widget.recievedRequest.id,false);

      if (value!.success) {
        _createEnvelopesStore.removeStudentSelectedCertificate();
        showAlertCongratulationDialog(
            context,
            'Your certificates has been successfully visible to the employer',
            'Okay', () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home, (Route<dynamic> route) => false);
        });
      }
    } catch (e) {
      if (e is ApiResponse) {
        showNotification(context, 'error', 'Error', e.message);
      } /*else {
                showNotification(
                    context, 'error', 'Error', e.response?.data['message']);
              }*/
    }
  }

  Future<void> handleCertificateRequestDeclined() async {
    try {
      ApiResponse? value = await _certificateRequestStore
          .employeesRequestDeclined(widget.recievedRequest.id);
      if (value!.success) {
        print('check  handleCertificateRequestDeclined -----> $value');
        showNotification(context, 'success', 'success', value.message);
        // Navigator.of(context).popAndPushNamed(Routes.cretificateRequestScreen);

        navigate(context);

        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     Routes.home, (Route<dynamic> route) => false);
      }

      // showNotification(context, 'success', 'Success', value!.message);
      //
      // Navigator.of(context).pushNamedAndRemoveUntil(Routes.otpVerify, (route) => false);
    } catch (e) {
      if (e is ApiResponse) {
        showNotification(context, 'error', 'Error', e.message);
      } else {
        showNotification(context, 'error', 'Error', e.toString());
      }
    }
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.of(context).popAndPushNamed(Routes.cretificateRequestScreen);
    });

    return Container();
  }

  Widget _buildRichText() {
    return RichText(
      textAlign: TextAlign.center, // Set overall text alignment
      text: TextSpan(
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 0.5,
            ),
        children: <TextSpan>[
          TextSpan(
            text:
                'Enable permission for ${widget.recievedRequest.empName} to view the ',
          ),
          TextSpan(
            text: '${_createEnvelopesStore.selectedEnvelopes!.name}',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  height: 1.5,
                ),
          ),
          // ..._buildCertificateSpans(),
        ],
      ),
    );
  }

  // List<TextSpan> _buildCertificateSpans() {
  //   List<TextSpan> spans = [];
  //
  //   for (int i = 0; i < _certificateRequestStore.selectedCertificate.length; i++) {
  //     CertificateDetails certificate = _certificateRequestStore.selectedCertificate[i];
  //
  //     spans.add(
  //       TextSpan(
  //         text: '${certificate.name}',
  //         style: Theme.of(context).textTheme.labelMedium?.copyWith(
  //           fontWeight: FontWeight.w400,
  //           color: Theme.of(context).colorScheme.primary,
  //           height: 1.5,
  //         ),
  //       ),
  //     );
  //
  //     // Add a comma and space if it's not the last certificate
  //     if (i < _certificateRequestStore.selectedCertificate.length - 1) {
  //       spans.add(const TextSpan(text: ', '));
  //     }
  //   }
  //
  //   return spans;
  // }

  @override
  void dispose() {
    _envelopeName.dispose();
    _envelopeNameFocusNode.dispose();
    _userEmailFocusNode.dispose();
    _userEmailController.dispose();
    _createEnvelopesStore.removeStudentSelectedCertificate();

    super.dispose();
  }
}
