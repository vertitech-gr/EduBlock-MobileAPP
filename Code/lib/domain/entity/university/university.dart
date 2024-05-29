class University {
  String id;
  String name;
  String email;
  String address;
  String countryCode;
  String phoneNumber;
  String type;
  bool active;
  bool status;
  String inviteDate;

  University({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.countryCode,
    required this.phoneNumber,
    required this.type,
    required this.active,
    required this.status,
    required this.inviteDate,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json["id"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      address: json["address"] as String,
      countryCode: json["countryCode"] as String,
      phoneNumber: json["phoneNumber"] as String,
      type: json["type"] as String,
      active: json["active"] as bool,
      status: json["status"] as bool,
      inviteDate: json["inviteDate"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "countryCode": countryCode,
      "phoneNumber": phoneNumber,
      "type": type,
      "active": active,
      "status": status,
      "inviteDate": inviteDate,
    };
  }
}
