class UserProfile {
  final String id;
  final String userID;
  final String description;
  final dynamic picture; // Assuming picture can be of any type
  final String name;
  final String type;
  final bool isDeleted;
  final String? isDeletedAt; // Nullable property
  final String createdAt;
  final String updatedAt;
  final String createdBy;
  final String updatedBy;

  UserProfile({
    required this.id,
    required this.userID,
    required this.description,
    required this.picture,
    required this.name,
    required this.type,
    required this.isDeleted,
    this.isDeletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      userID: json['userID'],
      description: json['description'],
      picture: json['picture'],
      name: json['name'],
      type: json['type'],
      isDeleted: json['isDeleted'],
      isDeletedAt: json['isDeletedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
    );
  }
}

class UserRole {
  final String id;
  final String userId;
  final int userRoleId;
  final String createdAt;
  final String updatedAt;
  final String userRoleGuid;

  UserRole({
    required this.id,
    required this.userId,
    required this.userRoleId,
    required this.createdAt,
    required this.updatedAt,
    required this.userRoleGuid,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      userId: json['userId'],
      userRoleId: json['userRoleId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userRoleGuid: json['userRoleGuid'],
    );
  }
}

class RolePermissionMapping {
  final String id;
  final String concurrencyStamp;
  final String name;
  final String normalizedName;

  RolePermissionMapping({
    required this.id,
    required this.concurrencyStamp,
    required this.name,
    required this.normalizedName,
  });

  factory RolePermissionMapping.fromJson(Map<String, dynamic> json) {
    return RolePermissionMapping(
      id: json['id'],
      concurrencyStamp: json['concurrencyStamp'],
      name: json['name'],
      normalizedName: json['normalizedName'],
    );
  }
}

class Role {
  final String id;
  final String concurrencyStamp;
  final String name;
  final String normalizedName;

  Role({
    required this.id,
    required this.concurrencyStamp,
    required this.name,
    required this.normalizedName,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      concurrencyStamp: json['concurrencyStamp'],
      name: json['name'],
      normalizedName: json['normalizedName'],
    );
  }
}

class RolesAndPermissionDTO {
  final Role role;
  final List<dynamic> permissions; // Assuming permissions can be of any type
  final List<RolePermissionMapping> rolePermissionMappings;

  RolesAndPermissionDTO({
    required this.role,
    required this.permissions,
    required this.rolePermissionMappings,
  });

  factory RolesAndPermissionDTO.fromJson(Map<String, dynamic> json) {
    return RolesAndPermissionDTO(
      role: Role.fromJson(json['role']),
      permissions: json['permissions'],
      rolePermissionMappings: List<RolePermissionMapping>.from(
          json['rolePermissionMappings']
              .map((x) => RolePermissionMapping.fromJson(x))),
    );
  }
}

class User {
  final String id;
  final String email;
  final String name;
  final bool status;
  final UserProfile userProfile;
  final UserRole userRole;
  final String did;
  final RolesAndPermissionDTO rolesAndPermissionDTO;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.status,
    required this.userProfile,
    required this.userRole,
    required this.did,
    required this.rolesAndPermissionDTO,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      status: json['status'],
      userProfile: UserProfile.fromJson(json['userProfile']),
      userRole: UserRole.fromJson(json['userRole']),
      did: json['did'],
      rolesAndPermissionDTO:
      RolesAndPermissionDTO.fromJson(json['rolesAndPermissionDTO']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
