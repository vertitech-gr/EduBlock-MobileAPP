class RecievedRequest {
  String id;
  String empName;
  String description; // Updated field
  String senderId;
  String receiverId;
  int status;
  String createdDateTime;
  String lastModifiedDateTime;

  RecievedRequest({
    required this.id,
    required this.empName,
    required this.description, // Updated field
    required this.senderId,
    required this.receiverId,
    required this.status,
    required this.createdDateTime,
    required this.lastModifiedDateTime,
  });

  factory RecievedRequest.fromJson(Map<String, dynamic> json) {
    return RecievedRequest(
      id: json["id"] ?? json['empId'],
      empName: json["empName"],
      description: json["description"], // Updated field
      senderId: json["senderId"],
      receiverId: json["receiverId"],
      status: json["status"],
      createdDateTime: json["createdDateTime"],
      lastModifiedDateTime: json["lastModifiedDateTime"],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "empName": empName,
    "description": description, // Updated field
    "senderId": senderId,
    "receiverId": receiverId,
    "status": status,
    "createdDateTime": createdDateTime,
    "lastModifiedDateTime": lastModifiedDateTime,
  };
}

class CertificateDetails {
  String id;
  String name;
  String? degreeType;
  final bool status;

  CertificateDetails({
    required this.id,
    required this.name,
    required this.status,
     this.degreeType,
  });

  factory CertificateDetails.fromJson(Map<String, dynamic> json) {
    return CertificateDetails(
      id: json["id"],
      name: json["name"],
      degreeType: json["degreeType"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
    "degreeType": degreeType,
    "status": status,
  };
}
