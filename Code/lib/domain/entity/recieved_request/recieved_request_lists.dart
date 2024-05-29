import 'package:edublock/domain/entity/certificates/certificate.dart';
import 'package:edublock/domain/entity/post/post.dart';
import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';

class RecievedRequestLists {
  final List<RecievedRequest>? recievedRequest;

  RecievedRequestLists({
    this.recievedRequest,
  });

  factory RecievedRequestLists.fromJson(List<dynamic> json) {
    List<RecievedRequest>? recievedRequest = json.map((recievedRequest) => RecievedRequest.fromJson(recievedRequest)).toList();

    return RecievedRequestLists(
      recievedRequest: recievedRequest,
    );
  }
}


