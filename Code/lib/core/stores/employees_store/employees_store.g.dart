// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeesStore on _EmployeesStore, Store {
  Computed<bool>? _$isEmployeesByIDDetailsComputed;

  @override
  bool get isEmployeesByIDDetails => (_$isEmployeesByIDDetailsComputed ??=
          Computed<bool>(() => super.isEmployeesByIDDetails,
              name: '_EmployeesStore.isEmployeesByIDDetails'))
      .value;

  late final _$employeesDetailsAtom =
      Atom(name: '_EmployeesStore.employeesDetails', context: context);

  @override
  Employees? get employeesDetails {
    _$employeesDetailsAtom.reportRead();
    return super.employeesDetails;
  }

  @override
  set employeesDetails(Employees? value) {
    _$employeesDetailsAtom.reportWrite(value, super.employeesDetails, () {
      super.employeesDetails = value;
    });
  }

  late final _$employeesDetailsByIdFutureAtom = Atom(
      name: '_EmployeesStore.employeesDetailsByIdFuture', context: context);

  @override
  ObservableFuture<Employees?> get employeesDetailsByIdFuture {
    _$employeesDetailsByIdFutureAtom.reportRead();
    return super.employeesDetailsByIdFuture;
  }

  @override
  set employeesDetailsByIdFuture(ObservableFuture<Employees?> value) {
    _$employeesDetailsByIdFutureAtom
        .reportWrite(value, super.employeesDetailsByIdFuture, () {
      super.employeesDetailsByIdFuture = value;
    });
  }

  late final _$getProfileDetailsAsyncAction =
      AsyncAction('_EmployeesStore.getProfileDetails', context: context);

  @override
  Future<dynamic> getProfileDetails(String id) {
    return _$getProfileDetailsAsyncAction
        .run(() => super.getProfileDetails(id));
  }

  @override
  String toString() {
    return '''
employeesDetails: ${employeesDetails},
employeesDetailsByIdFuture: ${employeesDetailsByIdFuture},
isEmployeesByIDDetails: ${isEmployeesByIDDetails}
    ''';
  }
}
