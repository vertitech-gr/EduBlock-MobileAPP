// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_request_access_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CertificateRequestAccessStore on _CertificateRequestAccessStore, Store {
  Computed<bool>? _$isCertificateRequestAccessLoadingComputed;

  @override
  bool get isCertificateRequestAccessLoading =>
      (_$isCertificateRequestAccessLoadingComputed ??= Computed<bool>(
              () => super.isCertificateRequestAccessLoading,
              name:
                  '_CertificateRequestAccessStore.isCertificateRequestAccessLoading'))
          .value;

  late final _$certificateRequestAccessFutureAtom = Atom(
      name: '_CertificateRequestAccessStore.certificateRequestAccessFuture',
      context: context);

  @override
  ObservableFuture<ApiResponse?> get certificateRequestAccessFuture {
    _$certificateRequestAccessFutureAtom.reportRead();
    return super.certificateRequestAccessFuture;
  }

  @override
  set certificateRequestAccessFuture(ObservableFuture<ApiResponse?> value) {
    _$certificateRequestAccessFutureAtom
        .reportWrite(value, super.certificateRequestAccessFuture, () {
      super.certificateRequestAccessFuture = value;
    });
  }

  late final _$certificateRequestAccessAsyncAction = AsyncAction(
      '_CertificateRequestAccessStore.certificateRequestAccess',
      context: context);

  @override
  Future<ApiResponse?> certificateRequestAccess(
      String name, List<int> credentials) {
    return _$certificateRequestAccessAsyncAction
        .run(() => super.certificateRequestAccess(name, credentials));
  }

  @override
  String toString() {
    return '''
certificateRequestAccessFuture: ${certificateRequestAccessFuture},
isCertificateRequestAccessLoading: ${isCertificateRequestAccessLoading}
    ''';
  }
}
