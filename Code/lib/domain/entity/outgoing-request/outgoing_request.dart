class StudentRequest {
  String id;
  String receiverId;
  String senderId;
  String name;
  String email;
  String remark;
  int status;
  String department;
  String graduationYear;
  String startDate;
  String endDate;
  String lastUpdateDate;

  StudentRequest({
    required this.id,
    required this.receiverId,
    required this.senderId,
    required this.name,
    required this.email,
    required this.remark,
    required this.status,
    required this.department,
    required this.graduationYear,
    required this.startDate,
    required this.endDate,
    required this.lastUpdateDate,
  });

  factory StudentRequest.fromJson(Map<String, dynamic> json) {
    return StudentRequest(
      id: json["id"],
      receiverId: json["receiverId"],
      senderId: json["senderId"],
      name: json["name"],
      email: json["email"],
      remark: json["remark"],
      status: json["status"],
      department: json["department"],
      graduationYear: json["graduationYear"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      lastUpdateDate: json["lastUpdateDate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "receiverId": receiverId,
      "senderId": senderId,
      "name": name,
      "email": email,
      "remark": remark,
      "status": status,
      "department": department,
      "graduationYear": graduationYear,
      "startDate": startDate,
      "endDate": endDate,
      "lastUpdateDate": lastUpdateDate,
    };
  }
}
