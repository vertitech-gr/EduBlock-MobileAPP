// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RequestChatStore on _RequestChatStore, Store {
  Computed<bool>? _$canSendMessageComputed;

  @override
  bool get canSendMessage =>
      (_$canSendMessageComputed ??= Computed<bool>(() => super.canSendMessage,
              name: '_RequestChatStore.canSendMessage'))
          .value;
  Computed<bool>? _$isRequestChatLoadingComputed;

  @override
  bool get isRequestChatLoading => (_$isRequestChatLoadingComputed ??=
          Computed<bool>(() => super.isRequestChatLoading,
              name: '_RequestChatStore.isRequestChatLoading'))
      .value;
  Computed<bool>? _$isSendMessageLoadingComputed;

  @override
  bool get isSendMessageLoading => (_$isSendMessageLoadingComputed ??=
          Computed<bool>(() => super.isSendMessageLoading,
              name: '_RequestChatStore.isSendMessageLoading'))
      .value;

  late final _$messageAtom =
      Atom(name: '_RequestChatStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$studentRequestChatListsAtom =
      Atom(name: '_RequestChatStore.studentRequestChatLists', context: context);

  @override
  ObservableList<RequestChat> get studentRequestChatLists {
    _$studentRequestChatListsAtom.reportRead();
    return super.studentRequestChatLists;
  }

  @override
  set studentRequestChatLists(ObservableList<RequestChat> value) {
    _$studentRequestChatListsAtom
        .reportWrite(value, super.studentRequestChatLists, () {
      super.studentRequestChatLists = value;
    });
  }

  late final _$requestChatFutureAtom =
      Atom(name: '_RequestChatStore.requestChatFuture', context: context);

  @override
  ObservableFuture<RequestChatLists?> get requestChatFuture {
    _$requestChatFutureAtom.reportRead();
    return super.requestChatFuture;
  }

  @override
  set requestChatFuture(ObservableFuture<RequestChatLists?> value) {
    _$requestChatFutureAtom.reportWrite(value, super.requestChatFuture, () {
      super.requestChatFuture = value;
    });
  }

  late final _$sendMessageFutureAtom =
      Atom(name: '_RequestChatStore.sendMessageFuture', context: context);

  @override
  ObservableFuture<ApiResponse?> get sendMessageFuture {
    _$sendMessageFutureAtom.reportRead();
    return super.sendMessageFuture;
  }

  @override
  set sendMessageFuture(ObservableFuture<ApiResponse?> value) {
    _$sendMessageFutureAtom.reportWrite(value, super.sendMessageFuture, () {
      super.sendMessageFuture = value;
    });
  }

  late final _$getRequestChatAsyncAction =
      AsyncAction('_RequestChatStore.getRequestChat', context: context);

  @override
  Future<dynamic> getRequestChat(String guid) {
    return _$getRequestChatAsyncAction.run(() => super.getRequestChat(guid));
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_RequestChatStore.sendMessage', context: context);

  @override
  Future<dynamic> sendMessage(
      String senderId, String requestId, String description, String token) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(senderId, requestId, description, token));
  }

  late final _$_RequestChatStoreActionController =
      ActionController(name: '_RequestChatStore', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_RequestChatStoreActionController.startAction(
        name: '_RequestChatStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_RequestChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserMessage(String value) {
    final _$actionInfo = _$_RequestChatStoreActionController.startAction(
        name: '_RequestChatStore.validateUserMessage');
    try {
      return super.validateUserMessage(value);
    } finally {
      _$_RequestChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
studentRequestChatLists: ${studentRequestChatLists},
requestChatFuture: ${requestChatFuture},
sendMessageFuture: ${sendMessageFuture},
canSendMessage: ${canSendMessage},
isRequestChatLoading: ${isRequestChatLoading},
isSendMessageLoading: ${isSendMessageLoading}
    ''';
  }
}

mixin _$RequestChatErrorStore on _RequestChatErrorStore, Store {
  Computed<bool>? _$hasErrorMessageComputed;

  @override
  bool get hasErrorMessage =>
      (_$hasErrorMessageComputed ??= Computed<bool>(() => super.hasErrorMessage,
              name: '_RequestChatErrorStore.hasErrorMessage'))
          .value;

  late final _$messageAtom =
      Atom(name: '_RequestChatErrorStore.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  @override
  String toString() {
    return '''
message: ${message},
hasErrorMessage: ${hasErrorMessage}
    ''';
  }
}
