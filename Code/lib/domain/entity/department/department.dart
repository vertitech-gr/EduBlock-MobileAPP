class Department {
  String id;
  String name;
  String email;
  bool status;
  bool loginStatus;
  String createdAt;
  String type;
  String universityID;
  dynamic? userRequest;
  dynamic? user;

  Department({
    required this.id, // Update departmentID to id
    required this.name, // Update departmentName to name
    required this.universityID,
    required this.email,
    required this.type,
    required this.createdAt,
    required this.loginStatus,
    required this.status,
    required this.user,
    required this.userRequest,

  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json["id"] as String,
      name: json["name"] as String,
      universityID: json["universityID"] as String,
      email: json["email"] as String,
      type: json["type"] as String,
      createdAt: json["createdAt"] as String,
      status: json["status"] as bool,
      loginStatus: json["loginStatus"] as bool,
      user: json["user"] as dynamic,
      userRequest: json["userRequest"] as dynamic,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "universityID": universityID,
      "email": email,
      "type": type,
      "createdAt": createdAt,
      "status": status,
      "loginStatus": loginStatus,
      "user": user,
      "userRequest": userRequest,
    };
  }
}
