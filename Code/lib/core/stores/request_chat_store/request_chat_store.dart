import 'package:edublock/core/stores/error/error_store.dart';
import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:edublock/domain/entity/chat_request/request_chat_lists.dart';
import 'package:edublock/domain/entity/user/api_response.dart';
import 'package:edublock/domain/usecase/request_chat_usecase/request_chat_usecase.dart';
import 'package:edublock/domain/usecase/send_message_usecase/send_message_usecase.dart';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

part 'request_chat_store.g.dart';

class RequestChatStore = _RequestChatStore with _$RequestChatStore;

abstract class _RequestChatStore with Store {
  _RequestChatStore(
      this._requestChatUseCase, this._sendMessageUseCase,this.requestChatErrorStore, this.errorStore){
    _setupValidations();

  }

  final RequestChatUseCase _requestChatUseCase;
  final SendMessageUseCase  _sendMessageUseCase;
  final RequestChatErrorStore requestChatErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => message, validateUserMessage),
    ];
  }

// store variables:-----------------------------------------------------------
  @observable
  String message = '';

  @action
  void setMessage(String value) {
    print('check visndiealue to the message ${message}');

    message = value;
  }

  @computed
  bool get canSendMessage =>
      !requestChatErrorStore.hasErrorMessage && message.isNotEmpty;

  // validations
  @action
  void validateUserMessage(String value) {
    print('check value to the message ${message}');
    if (value.isEmpty) {
      print('essage cant be empt');

      requestChatErrorStore.message = "Message can't be empty";
    } else {
      requestChatErrorStore.message = null;
    }
  }

  void validateAll() {
    validateUserMessage(message);
  }

  //actions

  @observable
  ObservableList<RequestChat> studentRequestChatLists =
  new ObservableList<RequestChat>();

  static ObservableFuture<RequestChatLists?> emptyChatRequestResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<RequestChatLists?> requestChatFuture =
      emptyChatRequestResponse;

  @computed
  bool get isRequestChatLoading =>
      requestChatFuture.status == FutureStatus.pending;

  @action
  Future getRequestChat(String guid) async {
    try {
      final RequestChatParams employeesDetailsByIDParams =
          RequestChatParams(page: 1, pageSize: 100, guid: guid);
      final future =
          _requestChatUseCase.call(params: employeesDetailsByIDParams);
      requestChatFuture = ObservableFuture(future);

      RequestChatLists? value = await future;
      if (value != null && value.requestChat != null) {
        // Clear existing data before adding new data
        studentRequestChatLists.clear();
        // value.requestChat?.reversed.forEach((RequestChat element) {
        value.requestChat?.forEach((RequestChat element) {
          studentRequestChatLists.add(element);
        });
        // studentRequestChatLists.reversed;
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }

  static ObservableFuture<ApiResponse?> emptySendMessageResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<ApiResponse?> sendMessageFuture =
      emptySendMessageResponse;

  @computed
  bool get isSendMessageLoading =>
      sendMessageFuture.status == FutureStatus.pending;

  @action
  Future sendMessage(String senderId,String requestId,String description,String token) async {
    try {
      final SendMessageParams sendMessageParams =
      SendMessageParams(senderId: senderId, requestId: requestId, description: description, type: 1, attachment: null, token: token);
      final future =
      _sendMessageUseCase.call(params: sendMessageParams);
      sendMessageFuture = ObservableFuture(future);

      ApiResponse? value = await future;
      if (value != null) {
        print('check value to  new password change data ${value?.data}');

        // this.success = true;

        return ApiResponse(success: value!.success, message: value.message);
      }
    } catch (error) {
      // this.success = false;

      rethrow;
    }
  }
}





class RequestChatErrorStore = _RequestChatErrorStore
    with _$RequestChatErrorStore;

abstract class _RequestChatErrorStore with Store {
  @observable
  String? message;

  @computed
  bool get hasErrorMessage => message != null;
}
