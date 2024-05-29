class Employees {
  final String userId;
  final bool userStatus;
  final String userName;
  final String userEmail;
  final String userCountryCode;
  final String userPhoneNumber;
  final String userAddress;
  final String userIndustry;
  final bool userLoginStatus;
  final String userSpecificIndustry;
  final bool userIsDeleted;
  final String userIsDeletedAt;
  final String userCreatedAt;
  final String userUpdatedAt;

  final String profileId;
  final String profileUserId;
  final String profileDescription;
  final String? profilePicture;
  final String profileName;
  final String? profileType;
  final bool profileIsDeleted;
  final String? profileIsDeletedAt;
  final String? profileCreatedAt;
  final String? profileUpdatedAt;
  final String? profileCreatedBy;
  final String? profileUpdatedBy;

  Employees({
    required this.userId,
    required this.userStatus,
    required this.userName,
    required this.userEmail,
    required this.userCountryCode,
    required this.userPhoneNumber,
    required this.userAddress,
    required this.userIndustry,
    required this.userLoginStatus,
    required this.userSpecificIndustry,
    required this.userIsDeleted,
    required this.userIsDeletedAt,
    required this.userCreatedAt,
    required this.userUpdatedAt,
    required this.profileId,
    required this.profileUserId,
    required this.profileDescription,
     this.profilePicture,
    required this.profileName,
     this.profileType,
    required this.profileIsDeleted,
     this.profileIsDeletedAt,
     this.profileCreatedAt,
     this.profileUpdatedAt,
     this.profileCreatedBy,
     this.profileUpdatedBy,
  });

  factory Employees.fromJson(Map<String, dynamic> json) {
    return Employees(
      userId: json['user']['id'],
      userStatus: json['user']['status'],
      userName: json['user']['name'],
      userEmail: json['user']['email'],
      userCountryCode: json['user']['countryCode'],
      userPhoneNumber: json['user']['phoneNumber'],
      userAddress: json['user']['address'],
      userIndustry: json['user']['industry'],
      userLoginStatus: json['user']['loginStatus'],
      userSpecificIndustry: json['user']['specificIndustry'],
      userIsDeleted: json['user']['isDeleted'],
      userIsDeletedAt: json['user']['isDeletedAt'],
      userCreatedAt: json['user']['createdAt'],
      userUpdatedAt: json['user']['updatedAt'],
      profileId: json['profile']['id'],
      profileUserId: json['profile']['userID'],
      profileDescription: json['profile']['description'],
      profilePicture: json['profile']['picture'],
      profileName: json['profile']['name'],
      profileType: json['profile']['type'],
      profileIsDeleted: json['profile']['isDeleted'],
      profileIsDeletedAt: json['profile']['isDeletedAt'],
      profileCreatedAt: json['profile']['createdAt'],
      profileUpdatedAt: json['profile']['updatedAt'],
      profileCreatedBy: json['profile']['createdBy'],
      profileUpdatedBy: json['profile']['updatedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id': userId,
        'status': userStatus,
        'name': userName,
        'email': userEmail,
        'countryCode': userCountryCode,
        'phoneNumber': userPhoneNumber,
        'address': userAddress,
        'industry': userIndustry,
        'loginStatus': userLoginStatus,
        'specificIndustry': userSpecificIndustry,
        'isDeleted': userIsDeleted,
        'isDeletedAt': userIsDeletedAt,
        'createdAt': userCreatedAt,
        'updatedAt': userUpdatedAt,
      },
      'profile': {
        'id': profileId,
        'userID': profileUserId,
        'description': profileDescription,
        'picture': profilePicture,
        'name': profileName,
        'type': profileType,
        'isDeleted': profileIsDeleted,
        'isDeletedAt': profileIsDeletedAt,
        'createdAt': profileCreatedAt,
        'updatedAt': profileUpdatedAt,
        'createdBy': profileCreatedBy,
        'updatedBy': profileUpdatedBy,
      }
    };
  }
}
