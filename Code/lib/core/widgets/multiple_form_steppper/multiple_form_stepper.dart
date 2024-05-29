import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/form/form_store.dart';
import 'package:edublock/core/widgets/buttons/outline_button/outline_button.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/custum_drop_down_menu.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/year_select_drop_down_menu/year_select_drop_down_menu.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/university/university.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MultipleFormStepperScreen extends StatefulWidget {
  @override
  State<MultipleFormStepperScreen> createState() =>
      _MultipleFormStepperScreenState();
}

class _MultipleFormStepperScreenState extends State<MultipleFormStepperScreen> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormStore _formStore = getIt<FormStore>();
  final UserStore _userStore = getIt<UserStore>();
  final CertificateRequestStore _certificateRequestStore =
  getIt<CertificateRequestStore>();

  DropdownItem selectCollege = const DropdownItem('0', 'College1');

  @override
  void initState(){
    super.initState();
    fetchData();
  }
  void fetchData() async {
    try {
      // _certificateRequestStore.getUniversityList();

      print(
          'check university  list length are here ${_certificateRequestStore.universityLists.length}');
    } catch (error) {
      print('check all university list are here $error');
      // Handle errors
    }
  }


  List<DropdownItem> collegeList = [
    DropdownItem('0', 'College1'),
    DropdownItem('1', 'College2'),
    DropdownItem('2', 'College3'),
    DropdownItem('3', 'College4'),
    DropdownItem('4', 'College5'),
  ];

  @override
  Widget build(BuildContext context) {
    return PrimaryLayout(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopHeader(),
          _buildStepper(),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Text(
            AppLocalizations.of(context)
                .translate('college_info_not_on_educBlock'),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text(
              AppLocalizations.of(context)
                  .translate('college_info_other_form_heading'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColor,
                  height: 1.6),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  int currentStep = 0;

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: Text(
              AppLocalizations.of(context)
                  .translate('college_info_other_form_institution_details'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    // height: 1.6
                  ),
              // textAlign: TextAlign.center,
            ),
            content: _buildFormInstitutionDetails(),
            isActive: currentStep >= 0),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            title: Text(
              AppLocalizations.of(context)
                  .translate('college_info_other_form_institution_info'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    // height: 1.6
                  ),
              // textAlign: TextAlign.center,
            ),
            content: _buildFormStudentInfo(),
            isActive: currentStep >= 1)
      ];

  Widget _buildStepper() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stepper(
        connectorColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            // Return the color you want based on the MaterialState
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).colorScheme.secondaryContainer; // Color for disabled state
            }
            return Theme.of(context)
                .colorScheme
                .secondaryContainer; // Color for other states
          },
        ),
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          setState(() {
            currentStep + 1;
          });
        },
        onStepCancel: () {
          setState(() {
            currentStep - 1;
          });
        },
      ),
    );
  }

  Widget _buildFormStudentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFirstLastName(),
        _buildEmailID(),
        _buildCourseName(),
        _buildContactGraduation(),
        _buildFooter(),
      ],
    );
  }




  Widget _buildFormInstitutionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSelectCollege(),
        _buildCourseName(),
        // _buildCountryName(),
        _buildInstituteUrl(),
        _buildFooterInstitution(),
      ],
    );
  }

   // Widget _buildCountryName(){
   //  return CustomDropdownMenu(
   //    options: collegeList,
   //    getLabel: (DropdownItem item) => item.viewValue,
   //    onChanged: (DropdownItem? item) {
   //      // selectCollege=item!;
   //      // _descriptionEditStore.setStateId(item!);
   //    },
   //    title: AppLocalizations.of(context).translate('college_info_other_form_country_name'),
   //    // value: selectCollege,
   //  );
   // }


  Widget _buildSelectCollege() {
    return CustomDropdownMenu(
      dropdownColor: Theme.of(context).colorScheme.primaryContainer,
      options: _certificateRequestStore.universityLists,
      getLabel: (University item) => item.name,
      onChanged: (University? item) {
        // selectCollege=item!;
        // _descriptionEditStore.setStateId(item!);
      },
      title: 'Select College/University*',
      // value: selectCollege,
    );
  }

  Widget _buildCourseName() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_name_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_name'),
        );
      },
    );
  }
  Widget _buildInstituteUrl() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_website_url_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_website_url'),
        );
      },
    );
  }

  Widget _buildFirstLastName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: MediaQuery.of(context).size.width * 0.42,
            child: _buildFirstName()),
        Container(
            width: MediaQuery.of(context).size.width * 0.42,
            child: _buildSecondName()),
      ],
    );
  }

  Widget _buildFirstName() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_first_name_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_first_name'),
        );
      },
    );
  }

  Widget _buildSecondName() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_last_name_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_last_name'),
        );
      },
    );
  }

  Widget _buildContactGraduation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: MediaQuery.of(context).size.width * 0.42,
            child: _buildContactInfo()),
        // Container(
        //     width: MediaQuery.of(context).size.width * 0.42,
        //     child: _buildGraduationYear()),
      ],
    );
  }

  Widget _buildEmailID() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

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
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_course_email'),
        );
      },
    );
  }

  Widget _buildContactInfo() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_select_contact_placeholder'),
          hintColor: Theme.of(context).colorScheme.onPrimary,
          inputType: TextInputType.phone,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setUserId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.userEmail,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_course_contact'),
        );
      },
    );
  }

  // Widget _buildGraduationYear() {
  //   return CustomDropdownMenu(
  //     options: collegeList,
  //     getLabel: (DropdownItem item) => item.viewValue,
  //     onChanged: (DropdownItem? item) {
  //       selectCollege=item!;
  //       // _descriptionEditStore.setStateId(item!);
  //     },
  //     title: AppLocalizations.of(context)
  //         .translate('college_info_other_form_institution_course_graduation'),
  //     // value: selectCollege,
  //   );
  // }

  Widget _buildFooterInstitution(){
     return Padding(
       padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, right: 8.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           OutLineButtonWidget(
             horizontal: 4.0,
             widthSize: 0.4,
             buttonName: AppLocalizations.of(context).translate('college_info_other_form_institution_next_button'),
             callback: () {},
           ),
         ],
       ),
     );
  }


  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context).translate(
                  'college_info_other_form_institution_describe_in_details'),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer, // Specify the color you want
                width: 0.5, // Specify the width you want
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              AppLocalizations.of(context).translate(
                  'college_info_other_form_institution_describe_details'),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          _buildUploadButton(),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutLineButtonWidget(
            horizontal: 4.0,
            widthSize: 0.4,
            buttonName: AppLocalizations.of(context).translate('college_info_other_form_institution_back_button'),
            callback: () {},
          ),
          RoundedButtonWidget(
            vertical: 8.0,
            horizontal: 24.0,
            widthSize: 0.4,

            buttonName: AppLocalizations.of(context).translate(
                'college_info_other_form_institution_send_request_button'),
            callback: () {},
          ),
        ],
      ),
    );
  }
}
