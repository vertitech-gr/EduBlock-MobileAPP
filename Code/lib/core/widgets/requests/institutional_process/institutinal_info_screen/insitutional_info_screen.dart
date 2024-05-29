import 'package:edublock/core/stores/certificate_request_store/certificate_request_store.dart';
import 'package:edublock/core/stores/institution_registration_form_store/institution_registration_form_store.dart';
import 'package:edublock/core/stores/profile_store/profile_store.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/custum_drop_down_menu.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/core/widgets/progress_indicator_widget.dart';
import 'package:edublock/core/widgets/textfield_background_widget/textfield_background_widget.dart';
import 'package:edublock/di/service_locator.dart';
import 'package:edublock/domain/entity/department/department.dart';
import 'package:edublock/domain/entity/university/university.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/presentation/auth/login/store/login_store.dart';
import 'package:edublock/presentation/home/store/theme/theme_store.dart';
import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:edublock/utils/device/device_utils.dart';
import 'package:edublock/utils/locale/app_localization.dart';
import 'package:edublock/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InsitutionalDetailScreen extends StatefulWidget {
  @override
  State<InsitutionalDetailScreen> createState() =>
      _InsitutionalDetailScreenState();
}

class _InsitutionalDetailScreenState extends State<InsitutionalDetailScreen> {
  //text controllers:-----------------------------------------------------------

  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _describeController = TextEditingController();

  //focus node:-----------------------------------------------------------------
  late FocusNode _selectCollegeFocusNode;
  late FocusNode _selectCourseFocusNode;
  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _contactFocusNode;
  late FocusNode _graduationFocusNode;
  late FocusNode _describeFocusNode;

  List<String> yearsList = [];

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final InstitutionRegistrationFormStore _formStore =
      getIt<InstitutionRegistrationFormStore>();
  final UserStore _userStore = getIt<UserStore>();

  final CertificateRequestStore _certificateRequestStore =
      getIt<CertificateRequestStore>();
  final ProfileStore _profileStore = getIt<ProfileStore>();

  @override
  void initState() {
    super.initState();
    fetchData();
    yearsList = generateYearsList();
    _selectCollegeFocusNode = FocusNode();
    _selectCourseFocusNode = FocusNode();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _graduationFocusNode = FocusNode();
    _contactFocusNode = FocusNode();
    _describeFocusNode = FocusNode();
  }

  void fetchData() async {
    try {
      if(_userStore.currentUser != null){
        _profileStore.getProfileDetails("");
        _certificateRequestStore.getUniversityList((_userStore.currentUser!.existingUser.id)).then((value) => {});

      }

      print(
          'check university  list length are here ${_certificateRequestStore.universityLists.length}');
    } catch (error) {
      print('check all university list are here $error');
      // Handle errors
    }
  }

  List<String> generateYearsList() {
    final int currentYear = DateTime.now().year;
    const int startYear = 1970;

    List<String> yearsList = List.generate(
        currentYear - startYear + 1, (index) => (startYear + index).toString());

    return yearsList;
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
                visible: _certificateRequestStore.isUniversityLoading ||
                    _profileStore.isProfileDetails ||_certificateRequestStore.isCreateCertificateRequestLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavigation(),
          _buildSelectCollege(),
          SizedBox(
            height: 8.0,
          ),
          _buildSelectCourse(),
          SizedBox(
            height: 8.0,
          ),
          // _buildFirstLastName(),
          // SizedBox(
          //   height: 8.0,
          // ),
          // _buildEmailID(),
          // SizedBox(
          //   height: 8.0,
          // ),
          _buildContactGraduation(),
          SizedBox(
            height: 8.0,
          ),
          _buildFooter(),
          SizedBox(
            height: 8.0,
          ),
          _buildUploadButton(),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // Adjust the mainAxisSize to minimize the width of the Row
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(builder: (context) {
                return Text(
                  'Welcome ${_profileStore.currentUser?.existingUser.name}!',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                );
              }),
              SizedBox(
                width: 4.0,
              ),
              Text(
                '(Seems you Not on eduBlock)',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Request onboarding to control your academic certificates on Edu Block.',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectCollege() {
    print(
        'check all list of university list ${_certificateRequestStore.universityLists.length}');
    return Observer(builder: (context) {
      print(
          'check all list of university second  list ${_certificateRequestStore.universityLists.length}');

      return CustomDropdownMenu(
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        focusNode: _selectCollegeFocusNode,
        options: _certificateRequestStore.universityLists,
        getLabel: (University item) => item.name,
        onChanged: (University? item) {
          print('check select college name $item');
          // selectCollege=item!;
          _certificateRequestStore.setSelectUniversity(item!);
          _certificateRequestStore.getDepartmentListByID(
              _certificateRequestStore.selectUniversity!.id);
        },
        title: AppLocalizations.of(context)
            .translate('college_info_other_form_institution_select_college'),
        value: _certificateRequestStore.selectUniversity,
      );
    });
  }

  Widget _buildSelectCourse() {
    print(
        'check all list of university list ${_certificateRequestStore.universityLists.length}');
    return Observer(builder: (context) {
      print(
          'check all list of university second  list ${_certificateRequestStore.universityLists.length}');

      return CustomDropdownMenu(
        isLoading: _certificateRequestStore.isDepartmentListsByIDLoading,
        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        focusNode: _selectCourseFocusNode,
        options: _certificateRequestStore.departmentLists,
        getLabel: (Department item) => item.type,
        onChanged: (Department? item) {
          print('check select college name $item');
          // selectCollege=item!;
          _certificateRequestStore.setSelectDepartment(item!);
        },
        title: AppLocalizations.of(context)
            .translate('college_info_other_form_institution_course_name'),
        value: _certificateRequestStore.selectDepartment,
      );
    });
  }

  Widget _buildFirstLastName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            width: MediaQuery.of(context).size.width * 0.44,
            child: _buildFirstName()),
        Container(
            width: MediaQuery.of(context).size.width * 0.44,
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
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.text,
          focusNode: _firstNameFocusNode,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _firstNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setFirstName(_firstNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_lastNameFocusNode);
          },
          errorText: _formStore.formErrorStore.firstNameError,
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
          focusNode: _lastNameFocusNode,
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_last_name_placeholder'),
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _lastNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setLastName(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_emailFocusNode);
          },
          errorText: _formStore.formErrorStore.lastNameError,
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
        // Container(
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(8.0))),
        //     width: MediaQuery.of(context).size.width * 0.44,
        //     child: _buildContactInfo()),
        Expanded(child: _buildGraduationYear()),
      ],
    );
  }

  Widget _buildEmailID() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          focusNode: _emailFocusNode,
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_course_email_placeholder'),
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.emailAddress,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setEmail(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_contactFocusNode);
          },
          errorText: _formStore.formErrorStore.emailError,
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
          focusNode: _contactFocusNode,
          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_select_contact_placeholder'),
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.number,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _contactController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setContact(_contactController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.contactError,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_course_contact'),
        );
      },
    );
  }

  Widget _buildGraduationYear() {
    return Observer(builder: (context) {
      return CustomDropdownMenu(

        dropdownColor: Theme.of(context).colorScheme.primaryContainer,
        focusNode: _graduationFocusNode,
        options: yearsList,
        getLabel: (String item) => item,
        onChanged: (String? item) {
          _certificateRequestStore.setSelectYears(item!);
        },
        title: AppLocalizations.of(context)
            .translate('college_info_other_form_institution_course_graduation'),
        value: _certificateRequestStore.selectedYears,
      );
    });
  }

  Widget _buildFooter() {
    return Observer(
      builder: (context) {
        return TextFieldBackgroundWidget(
          textColor: Theme.of(context).colorScheme.primaryContainer,

          focusBorderColor: Theme.of(context).colorScheme.secondary,
          enableBorderColor: Theme.of(context).colorScheme.secondary,
          hint: AppLocalizations.of(context)
              .translate('college_info_other_form_institution_describe'),
          hintColor: Theme.of(context).colorScheme.primaryContainer,
          inputType: TextInputType.text,
          // icon: Icons.person,
          // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _describeController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _formStore.setRemark(_describeController.text);
          },
          onFieldSubmitted: (value) {
            // FocusScope.of(context).requestFocus();
          },
          errorText: _formStore.formErrorStore.remarkError,
          isSuffixIcon: false,
          labelText: AppLocalizations.of(context).translate(
              'college_info_other_form_institution_describe_heading'),
        );
      },
    );
  }

  Widget _buildUploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButtonWidget(
            buttonName: AppLocalizations.of(context)
                .translate('college_info_other_form_institution_submit_button'),
            callback: handleCreateRequest,
          ),
        ],
      ),
    );
  }

  Future<void> handleCreateRequest() async {

    print('check canCreateRequest are here ${_formStore.canCreateRequest}');
    if (_formStore.canCreateRequest) {
      DeviceUtils.hideKeyboard(context);
      try {
        ApiResponse? value =
            await _certificateRequestStore.createCertificateRequest(
                _certificateRequestStore.selectUniversity!.id,
                _certificateRequestStore.selectDepartment!.type,
                1,
                _describeController.text,
                _certificateRequestStore.selectedYears!);

        if (value != null) {
          print('check forget password success value are -----> $value');
          showNotification(context, 'success', 'Success', value!.message);

          await Future.delayed(Duration(seconds: 1));
          Navigator.of(context).pushNamed(Routes.home);
        }

        // print(value);
      } catch (e) {
        if (e is ApiResponse) {
          showNotification(context, 'error', 'Error', e.message);
        } else {
          showNotification(context, 'error', 'Error', e.toString());
        }
      }
    } else {
      showNotification(context, 'error', 'Error', 'Please Enter Description');
    }
  }
}
