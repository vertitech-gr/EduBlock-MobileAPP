// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  Computed<bool>? _$isProfileDetailsComputed;

  @override
  bool get isProfileDetails => (_$isProfileDetailsComputed ??= Computed<bool>(
          () => super.isProfileDetails,
          name: '_ProfileStore.isProfileDetails'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_ProfileStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$countriesAtom =
      Atom(name: '_ProfileStore.countries', context: context);

  @override
  List<Country> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(List<Country> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  late final _$selectedCountryAtom =
      Atom(name: '_ProfileStore.selectedCountry', context: context);

  @override
  Country get selectedCountry {
    _$selectedCountryAtom.reportRead();
    return super.selectedCountry;
  }

  @override
  set selectedCountry(Country value) {
    _$selectedCountryAtom.reportWrite(value, super.selectedCountry, () {
      super.selectedCountry = value;
    });
  }

  late final _$nameAtom = Atom(name: '_ProfileStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$baseProfileAtom =
      Atom(name: '_ProfileStore.baseProfile', context: context);

  @override
  String get baseProfile {
    _$baseProfileAtom.reportRead();
    return super.baseProfile;
  }

  @override
  set baseProfile(String value) {
    _$baseProfileAtom.reportWrite(value, super.baseProfile, () {
      super.baseProfile = value;
    });
  }

  late final _$countryAtom =
      Atom(name: '_ProfileStore.country', context: context);

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  late final _$graduationAtom =
      Atom(name: '_ProfileStore.graduation', context: context);

  @override
  String get graduation {
    _$graduationAtom.reportRead();
    return super.graduation;
  }

  @override
  set graduation(String value) {
    _$graduationAtom.reportWrite(value, super.graduation, () {
      super.graduation = value;
    });
  }

  late final _$profileDetailsFutureAtom =
      Atom(name: '_ProfileStore.profileDetailsFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get profileDetailsFuture {
    _$profileDetailsFutureAtom.reportRead();
    return super.profileDetailsFuture;
  }

  @override
  set profileDetailsFuture(ObservableFuture<ApiResponse?> value) {
    _$profileDetailsFutureAtom.reportWrite(value, super.profileDetailsFuture,
        () {
      super.profileDetailsFuture = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_ProfileStore.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$getProfileDetailsAsyncAction =
      AsyncAction('_ProfileStore.getProfileDetails', context: context);

  @override
  Future<dynamic> getProfileDetails(String email) {
    return _$getProfileDetailsAsyncAction
        .run(() => super.getProfileDetails(email));
  }

  late final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore', context: context);

  @override
  void setUserEmail(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaseProfile(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setBaseProfile');
    try {
      return super.setBaseProfile(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCountry(Country value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setCountry');
    try {
      return super.setCountry(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGraduation(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setGraduation');
    try {
      return super.setGraduation(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserName(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.validateUserName');
    try {
      return super.validateUserName(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBaseProfile(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.validateBaseProfile');
    try {
      return super.validateBaseProfile(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCountry(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.validateCountry');
    try {
      return super.validateCountry(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateGraduation(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.validateGraduation');
    try {
      return super.validateGraduation(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
countries: ${countries},
selectedCountry: ${selectedCountry},
name: ${name},
baseProfile: ${baseProfile},
country: ${country},
graduation: ${graduation},
profileDetailsFuture: ${profileDetailsFuture},
currentUser: ${currentUser},
isProfileDetails: ${isProfileDetails}
    ''';
  }
}

mixin _$ProfileErrorStore on _ProfileErrorStore, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
