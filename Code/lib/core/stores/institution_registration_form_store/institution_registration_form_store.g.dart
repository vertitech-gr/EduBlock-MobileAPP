// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_registration_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstitutionRegistrationFormStore
    on _InstitutionRegistrationFormStore, Store {
  Computed<bool>? _$canCreateRequestComputed;

  @override
  bool get canCreateRequest => (_$canCreateRequestComputed ??= Computed<bool>(
          () => super.canCreateRequest,
          name: '_InstitutionRegistrationFormStore.canCreateRequest'))
      .value;

  late final _$emailAtom =
      Atom(name: '_InstitutionRegistrationFormStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$remarkAtom =
      Atom(name: '_InstitutionRegistrationFormStore.remark', context: context);

  @override
  String get remark {
    _$remarkAtom.reportRead();
    return super.remark;
  }

  @override
  set remark(String value) {
    _$remarkAtom.reportWrite(value, super.remark, () {
      super.remark = value;
    });
  }

  late final _$collegeAtom =
      Atom(name: '_InstitutionRegistrationFormStore.college', context: context);

  @override
  DropdownItem get college {
    _$collegeAtom.reportRead();
    return super.college;
  }

  @override
  set college(DropdownItem value) {
    _$collegeAtom.reportWrite(value, super.college, () {
      super.college = value;
    });
  }

  late final _$courseNameAtom = Atom(
      name: '_InstitutionRegistrationFormStore.courseName', context: context);

  @override
  String get courseName {
    _$courseNameAtom.reportRead();
    return super.courseName;
  }

  @override
  set courseName(String value) {
    _$courseNameAtom.reportWrite(value, super.courseName, () {
      super.courseName = value;
    });
  }

  late final _$firstNameAtom = Atom(
      name: '_InstitutionRegistrationFormStore.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom = Atom(
      name: '_InstitutionRegistrationFormStore.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$contactAtom =
      Atom(name: '_InstitutionRegistrationFormStore.contact', context: context);

  @override
  String get contact {
    _$contactAtom.reportRead();
    return super.contact;
  }

  @override
  set contact(String value) {
    _$contactAtom.reportWrite(value, super.contact, () {
      super.contact = value;
    });
  }

  late final _$graduationYearAtom = Atom(
      name: '_InstitutionRegistrationFormStore.graduationYear',
      context: context);

  @override
  DropdownItem get graduationYear {
    _$graduationYearAtom.reportRead();
    return super.graduationYear;
  }

  @override
  set graduationYear(DropdownItem value) {
    _$graduationYearAtom.reportWrite(value, super.graduationYear, () {
      super.graduationYear = value;
    });
  }

  late final _$institutionNameAtom = Atom(
      name: '_InstitutionRegistrationFormStore.institutionName',
      context: context);

  @override
  String get institutionName {
    _$institutionNameAtom.reportRead();
    return super.institutionName;
  }

  @override
  set institutionName(String value) {
    _$institutionNameAtom.reportWrite(value, super.institutionName, () {
      super.institutionName = value;
    });
  }

  late final _$countryNameAtom = Atom(
      name: '_InstitutionRegistrationFormStore.countryName', context: context);

  @override
  DropdownItem get countryName {
    _$countryNameAtom.reportRead();
    return super.countryName;
  }

  @override
  set countryName(DropdownItem value) {
    _$countryNameAtom.reportWrite(value, super.countryName, () {
      super.countryName = value;
    });
  }

  late final _$websiteURLAtom = Atom(
      name: '_InstitutionRegistrationFormStore.websiteURL', context: context);

  @override
  String get websiteURL {
    _$websiteURLAtom.reportRead();
    return super.websiteURL;
  }

  @override
  set websiteURL(String value) {
    _$websiteURLAtom.reportWrite(value, super.websiteURL, () {
      super.websiteURL = value;
    });
  }

  late final _$_InstitutionRegistrationFormStoreActionController =
      ActionController(
          name: '_InstitutionRegistrationFormStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRemark(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setRemark');
    try {
      return super.setRemark(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setInstitutionName(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.setInstitutionName');
    try {
      return super.setInstitutionName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setWebsiteUrl(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setWebsiteUrl');
    try {
      return super.setWebsiteUrl(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCourseName(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setCourseName');
    try {
      return super.setCourseName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setContact');
    try {
      return super.setContact(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCollegeId(DropdownItem? value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setCollegeId');
    try {
      return super.setCollegeId(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGraduationYear(DropdownItem? value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.setGraduationYear');
    try {
      return super.setGraduationYear(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(DropdownItem? value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.setCountry');
    try {
      return super.setCountry(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateWebsiteUrl(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateWebsiteUrl');
    try {
      return super.validateWebsiteUrl(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateFirstName');
    try {
      return super.validateFirstName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateLastName');
    try {
      return super.validateLastName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateCollegeName(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateCollegeName');
    try {
      return super.validateCollegeName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateRemark(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.validateRemark');
    try {
      return super.validateRemark(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateCourseName(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateCourseName');
    try {
      return super.validateCourseName(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateContact(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.validateContact');
    try {
      return super.validateContact(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateGraduateYear(String value) {
    final _$actionInfo =
        _$_InstitutionRegistrationFormStoreActionController.startAction(
            name: '_InstitutionRegistrationFormStore.validateGraduateYear');
    try {
      return super.validateGraduateYear(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void validateCountry(String value) {
    final _$actionInfo = _$_InstitutionRegistrationFormStoreActionController
        .startAction(name: '_InstitutionRegistrationFormStore.validateCountry');
    try {
      return super.validateCountry(value);
    } finally {
      _$_InstitutionRegistrationFormStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
remark: ${remark},
college: ${college},
courseName: ${courseName},
firstName: ${firstName},
lastName: ${lastName},
contact: ${contact},
graduationYear: ${graduationYear},
institutionName: ${institutionName},
countryName: ${countryName},
websiteURL: ${websiteURL},
canCreateRequest: ${canCreateRequest}
    ''';
  }
}

mixin _$InstitutionFormErrorStore on _InstitutionFormErrorStore, Store {
  Computed<bool>? _$hasErrorsInCreateRequestComputed;

  @override
  bool get hasErrorsInCreateRequest => (_$hasErrorsInCreateRequestComputed ??=
          Computed<bool>(() => super.hasErrorsInCreateRequest,
              name: '_InstitutionFormErrorStore.hasErrorsInCreateRequest'))
      .value;

  @override
  String toString() {
    return '''
hasErrorsInCreateRequest: ${hasErrorsInCreateRequest}
    ''';
  }
}
