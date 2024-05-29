import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';

class Certificate {
  final String id;
  final String degreeName;
  final String? degreeType;
  final bool status;

  Certificate({
    required this.id,
    required this.degreeName,
    required this.status,
    this.degreeType,

  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    print('json $json');
    return Certificate(
      id: json['id'],
      degreeName: json['name'] as String,
      degreeType: json['degreeType'] as String,
      status: json['status'],

    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': degreeName,
    'degreeType': degreeType,
    'status': status,
  };
}

class Envelope {
  String id;
  String name;
  String isDeletedAt;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  int status;
  List<CertificateDetails> credentials;

  Envelope({
    required this.id,
    required this.name,
    required this.isDeletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.status,
    required this.credentials,
  });

  factory Envelope.fromJson(Map<String, dynamic> json) {
    try {
      return Envelope(
        id: json["id"],
        name: json["name"],
        isDeletedAt: json["isDeletedAt"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        status: json["status"],
        credentials: json["credentials"].map<CertificateDetails>((e) {
          return CertificateDetails.fromJson(e);
        }).toList(),
      );
    } catch (e) {
      print(e);
      return Envelope(
        id: json["id"],
        name: json["name"],
        isDeletedAt: json["isDeletedAt"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        status: json["status"],
        credentials: json["credentials"].map<CertificateDetails>((e) {
          return CertificateDetails.fromJson(e);
        }).toList(),
      );
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
    "isDeletedAt": isDeletedAt,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "status": status,
    "credentials": credentials,
  };
}
