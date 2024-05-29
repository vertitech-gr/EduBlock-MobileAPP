class User {
  final UserProfile userProfile;
  final ExistingUser existingUser;
  final String did;

  User({
    required this.userProfile,
    required this.existingUser,
    required this.did,
  });

  factory User.fromJson(Map<String, dynamic> json) {

    print('check json to the userprofile ${json['userProfile']}');

    return User(
      userProfile: UserProfile.fromJson(json['userProfile']),
      existingUser: ExistingUser.fromJson(json['existingUser']),
      did: json['did'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userProfile': userProfile.toJson(),
      'existingUser': existingUser.toJson(),
      'did': did,
    };
  }
}

class ExistingUser {
  final String id;
  final String email;
  final String name;
  final bool status;
  final bool loginStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExistingUser({
    required this.id,
    required this.email,
    required this.name,
    required this.status,
    required this.loginStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExistingUser.fromJson(Map<String, dynamic> json) {
    return ExistingUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      status: json['status'],
      loginStatus: json['loginStatus'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'status': status,
      'loginStatus': loginStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}


class UserProfile {
  final String id;
  final String userID;
  final String description;
  final String? picture;
  final String name;
  final bool isDeleted;
  final DateTime? isDeletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;

  UserProfile({
    required this.id,
    required this.userID,
    required this.description,
    required this.picture,
    required this.name,
    required this.isDeleted,
    required this.isDeletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    userID: json["userID"],
    description: json["description"],
    picture: json["picture"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    isDeletedAt: json["isDeletedAt"] != null
        ? DateTime.parse(json["isDeletedAt"])
        : null,
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userID": userID,
    "description": description,
    "picture": picture,
    "name": name,
    "isDeleted": isDeleted,
    "isDeletedAt": isDeletedAt?.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
  };
}
