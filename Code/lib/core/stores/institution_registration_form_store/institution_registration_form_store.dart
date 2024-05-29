import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/core/widgets/custum_drop_down_menu/year_select_drop_down_menu/year_select_drop_down_menu.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'institution_registration_form_store.g.dart';

class InstitutionRegistrationFormStore = _InstitutionRegistrationFormStore
    with _$InstitutionRegistrationFormStore;

abstract class _InstitutionRegistrationFormStore with Store {
  // store for handling form errors
  final _InstitutionFormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _InstitutionRegistrationFormStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => email, validateUserEmail),
      reaction((_) => websiteURL, validateWebsiteUrl),
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => remark, validateRemark),
    ];
  }

  @computed
  bool get canCreateRequest =>
      !formErrorStore.hasErrorsInCreateRequest && remark.isNotEmpty;

  // store variables:-----------------------------------------------------------

  @observable
  String email = '';

  @observable
  String remark = '';

  @observable
  DropdownItem college = const DropdownItem('0', 'college 1');

  @observable
  String courseName = '';

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String contact = '';

  @observable
  DropdownItem graduationYear = const DropdownItem('0', '2020-202');

  @observable
  String institutionName = '';

  @observable
  DropdownItem countryName = const DropdownItem('in', 'INDIA');

  @observable
  String websiteURL = '';

  // actions:-------------------------------------------------------------------

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setRemark(String value) {
    remark = value;
  }

  @action
  void setInstitutionName(String value) {
    institutionName = value;
  }

  @action
  void setWebsiteUrl(String value) {
    websiteURL = value;
  }

  @action
  void setCourseName(String value) {
    courseName = value;
  }

  @action
  void setContact(String value) {
    contact = value;
  }

  @action
  void setCollegeId(DropdownItem? value) {
    college = value!;
  }

  @action
  void setGraduationYear(DropdownItem? value) {
    graduationYear = value!;
  }

  @action
  void setCountry(DropdownItem? value) {
    countryName = value!;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.emailError = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.emailError = 'Please enter a valid email address';
    } else {
      formErrorStore.emailError = null;
    }
  }

  @action
  void validateWebsiteUrl(String value) {
    if (value.isEmpty) {
      formErrorStore.websiteUrlError = "Email can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.websiteUrlError = 'Please enter a valid url address';
    } else {
      formErrorStore.websiteUrlError = null;
    }
  }

  @action
  void validateFirstName(String value) {
    if (value.isEmpty) {
      formErrorStore.firstNameError = "First name can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.firstNameError = 'Please enter a valid url address';
    } else {
      formErrorStore.firstNameError = null;
    }
  }

  @action
  void validateLastName(String value) {
    if (value.isEmpty) {
      formErrorStore.lastNameError = "Last name can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.lastNameError = 'Please enter a valid last name';
    } else {
      formErrorStore.lastNameError = null;
    }
  }

  @action
  void validateCollegeName(String value) {
    if (value.isEmpty) {
      formErrorStore.collegeNameError = "College name can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.collegeNameError = 'Please enter a valid last name';
    } else {
      formErrorStore.collegeNameError = null;
    }
  }

  @action
  void validateRemark(String value) {
    if (value.isEmpty) {
      formErrorStore.remarkError = "Description  can't be empty";
    }  else {
      formErrorStore.remarkError = null;
    }
  }

  @action
  void validateCourseName(String value) {
    if (value.isEmpty) {
      formErrorStore.courseNameError = "Course name can't be empty";
    } else if (!isURL(value)) {
      formErrorStore.courseNameError = 'Please enter a valid last name';
    } else {
      formErrorStore.courseNameError = null;
    }
  }

  @action
  void validateContact(String value) {
    RegExp phoneNumberRegex = RegExp(r'^[0-9+\s()-]{6,20}$');

    if (value.isEmpty) {
      formErrorStore.contactError = "Contact number can't be empty";
    } else if (phoneNumberRegex.hasMatch(value)) {
      formErrorStore.contactError = 'Please enter a valid last name';
    } else {
      formErrorStore.contactError = null;
    }
  }

  @action
  void validateGraduateYear(String value) {
    if (value.isEmpty) {
      formErrorStore.graduationYearError = "Graduation year can't be empty";
    } else {
      formErrorStore.graduationYearError = null;
    }
  }

  @action
  void validateCountry(String value) {
    if (value.isEmpty) {
      formErrorStore.countryError = "Country  can't be empty";
    } else {
      formErrorStore.graduationYearError = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateUserEmail(email);
    validateWebsiteUrl(websiteURL);
    validateRemark(remark);
    validateLastName(lastName);
    validateContact(contact);
  }
}

class InstitutionFormErrorStore = _InstitutionFormErrorStore
    with _$InstitutionFormErrorStore;

abstract class _InstitutionFormErrorStore with Store {
  String? emailError;
  String? remarkError;
  String? firstNameError;
  String? lastNameError;
  String? collegeNameError;
  String? courseNameError;
  String? contactError;
  String? graduationYearError;
  String? countryError;
  String? websiteUrlError;

  @computed
  bool get hasErrorsInCreateRequest =>
      remarkError != null;

}
