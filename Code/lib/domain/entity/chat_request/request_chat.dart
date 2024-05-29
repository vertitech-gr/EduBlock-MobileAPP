class RequestChat {
  RequestMessages requestMessages;
  CommanUser commanUser;
  UserRequest userRequest;

  RequestChat({
    required this.requestMessages,
    required this.commanUser,
    required this.userRequest,
  });

  factory RequestChat.fromJson(Map<String, dynamic> json) {
    return RequestChat(
      requestMessages: RequestMessages.fromJson(json['requestMessages']),
      commanUser: CommanUser.fromJson(json['commanUser']),
      userRequest: UserRequest.fromJson(json['userRequest']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'requestMessages': requestMessages.toJson(),
      'commanUser': commanUser.toJson(),
      'userRequest': userRequest.toJson(),
    };
  }
}

class RequestMessages {
  String id;
  String senderId;
  String requestId;
  String description;
  dynamic attachment;
  bool isDeleted;
  int type;
  String isDeletedAt;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;

  RequestMessages({
    required this.id,
    required this.senderId,
    required this.requestId,
    required this.description,
    required this.attachment,
    required this.isDeleted,
    required this.type,
    required this.isDeletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory RequestMessages.fromJson(Map<String, dynamic> json) {
    return RequestMessages(
      id: json['id'],
      senderId: json['senderId'],
      requestId: json['requestId'],
      description: json['description'],
      attachment: json['attachment'],
      isDeleted: json['isDeleted'],
      type: json['type'],
      isDeletedAt: json['isDeletedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'requestId': requestId,
      'description': description,
      'attachment': attachment,
      'isDeleted': isDeleted,
      'type': type,
      'isDeletedAt': isDeletedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
    };
  }
}

class CommanUser {
  String id;
  String email;
  String name;
  bool status;
  String createdAt;
  String updatedAt;

  CommanUser({
    required this.id,
    required this.email,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommanUser.fromJson(Map<String, dynamic> json) {
    return CommanUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class UserRequest {
  String id;
  String senderId;
  String receiverId;
  String requestType;
  int status;
  String remark;
  String graduationYear;
  bool isDeleted;
  String? isDeletedAt;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;

  UserRequest({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.requestType,
    required this.status,
    required this.remark,
    required this.graduationYear,
    required this.isDeleted,
    this.isDeletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      requestType: json['requestType'],
      status: json['status'],
      remark: json['remark'],
      graduationYear: json['graduationYear'],
      isDeleted: json['isDeleted'],
      isDeletedAt: json['isDeletedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'requestType': requestType,
      'status': status,
      'remark': remark,
      'graduationYear': graduationYear,
      'isDeleted': isDeleted,
      'isDeletedAt': isDeletedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
    };
  }
}
