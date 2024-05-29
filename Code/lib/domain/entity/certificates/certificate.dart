import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

class Certificate {
  final String id;
  final String degreeType;
  final String degreeName;
  final String fileName;
  final DateTime degreeAwardedDate;
  final DateTime dateOfBirth;
  final DateTime issuanceDate;
  final DateTime expireDate;
  final int certificateTemplateId;
  final String userProfileId;
  final String issuer;
  final bool status;
  // final CredentialJSON credentialsJson;

  Certificate({
    required this.id,
    required this.degreeType,
    required this.degreeName,
    required this.fileName,
    required this.degreeAwardedDate,
    required this.dateOfBirth,
    required this.issuanceDate,
    required this.expireDate,
    required this.certificateTemplateId,
    required this.userProfileId,
    required this.issuer,
    required this.status
    // required this.credentialsJson,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['id'],
      degreeType: json['degreeType'],
      degreeName: json['degreeName'],
      fileName: json['fileName'],
      degreeAwardedDate: DateTime.parse(json['degreeAwardedDate']),
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      issuanceDate: DateTime.parse(json['issuanceDate']),
      expireDate: DateTime.parse(json['expireDate']),
      certificateTemplateId: json['certificateTemplateId'],
      userProfileId: json['userProfileId'],
      issuer: json['issuer'],
      status: json['status'],
      // credentialsJson:
      //     CredentialJSON.fromJson(jsonDecode(json['credentialsJson'])),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'degreeType': degreeType,
        'degreeName': degreeName,
        'fileName': fileName,
        'degreeAwardedDate': degreeAwardedDate,
        'dateOfBirth': dateOfBirth,
        'issuanceDate': issuanceDate,
        'expireDate': expireDate,
        'certificateTemplateId': certificateTemplateId,
        'userProfileId': userProfileId,
        'issuer': issuer,
        'status': status,
        // 'credentialsJson': credentialsJson.toJson(),
      };
}

class CredentialJSON {
  List<ContextModel>? context;
  String? id;
  List<dynamic>? type;
  CredentialSubject? credentialSubject;
  String? issuanceDate;
  Issuer? issuer;
  CredentialSchema? credentialSchema;
  String? name;
  PrettyVC? prettyVC;

  CredentialJSON({
    this.context,
    this.id,
    this.type,
    this.credentialSubject,
    this.issuanceDate,
    this.issuer,
    this.credentialSchema,
    this.name,
    this.prettyVC,
  });

// Add fromJson and toJson methods here
  factory CredentialJSON.fromJson(Map<String, dynamic> json) {
    return CredentialJSON(
      id: json['id'],
      type: json['type'] != null
          ? json['type']?.map((s) => s.toString()).toList()
          : null,
      credentialSubject: json['credentialSubject'] != null
          ? CredentialSubject.fromJson(json['credentialSubject'])
          : null,
      issuanceDate: json['issuanceDate'],
      issuer: json['issuer'] != null ? Issuer.fromJson(json['issuer']) : null,
      credentialSchema: json['credentialSchema'] != null
          ? CredentialSchema.fromJson(json['credentialSchema'])
          : null,
      name: json['name'],
      prettyVC:
          json['prettyVC'] != null ? PrettyVC.fromJson(json['prettyVC']) : null,
      context: json['context'] != null
          ? json['context'].map((s) => ContextModel.fromJson(s)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'context': context,
        'id': id,
        'type': type,
        'credentialSubject': credentialSubject?.toJson(),
        'issuanceDate': issuanceDate,
        'issuer': issuer?.toJson(),
        'credentialSchema': credentialSchema?.toJson(),
        'name': name,
        'prettyVC': prettyVC?.toJson(),
      };
}

class ContextModel {
  String? contextStr;
  Map<String, dynamic>? contextMap;

  ContextModel({this.contextStr, this.contextMap});

// Add fromJson and toJson methods here

  factory ContextModel.fromJson(Map<String, dynamic> json) {
    log('ContextModel json ${jsonEncode(json)}');

    return ContextModel(
      contextStr: json['contextStr'],
      contextMap: json['contextMap'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contextStr': contextStr,
        'contextMap': contextMap,
      };
}

class CredentialSubject {
  String? id;
  String? name;

  CredentialSubject({this.id, this.name});

// Add fromJson and toJson methods here
  factory CredentialSubject.fromJson(Map<String, dynamic> json) {
    print('subject');
    return CredentialSubject(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}

class Issuer {
  String? name;
  String? description;
  String? logo;
  String? id;

  Issuer({this.name, this.description, this.logo, this.id});

// Add fromJson and toJson methods here
  factory Issuer.fromJson(Map<String, dynamic> json) {
    return Issuer(
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
        'logo': logo,
        'id': id,
      };
}

class CredentialSchema {
  String? id;
  String? type;

  CredentialSchema({this.id, this.type});

// Add fromJson and toJson methods here
  factory CredentialSchema.fromJson(Map<String, dynamic> json) {
    return CredentialSchema(
      id: json['id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
      };
}

class PrettyVC {
  String? type;
  String? orientation;
  String? size;
  String? proof;

  PrettyVC({this.type, this.orientation, this.size, this.proof});

// Add fromJson and toJson methods here
  factory PrettyVC.fromJson(Map<String, dynamic> json) {
    return PrettyVC(
      type: json['type'],
      orientation: json['orientation'],
      size: json['size'],
      proof: json['proof'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'orientation': orientation,
        'size': size,
        'proof': proof,
      };
}
