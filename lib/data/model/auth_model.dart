class AuthModel {
  int? expiresIn;
  String? orgName;
  String? accessToken;
  User? user;
  String? status;

  AuthModel(
      {this.expiresIn, this.orgName, this.accessToken, this.user, this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    try {
      expiresIn = json['expiresIn'];
      orgName = json['orgName'];
      accessToken = json['accessToken'];
      user = json['user'] != null ? User.fromJson(json['user']) : null;
      status = json['status'];
    } catch (e) {
      print('Error parsing AuthModel: $e');
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expiresIn'] = this.expiresIn;
    data['orgName'] = this.orgName;
    data['accessToken'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class User {
  int? id;
  int? createdAt;
  int? updatedAt;
  bool? deleted;
  String? userId;
  String? firstName;
  String? lastName;
  String? role;
  String? orgName;
  bool? emailVerified;
  String? tenantId;
  String? tenantName;
  bool? termsAgreed;
  bool? privacyAgreed;
  TenantProps? tenantProps;
  String? fullName;
  String? uid;

  User(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deleted,
        this.userId,
        this.firstName,
        this.lastName,
        this.role,
        this.orgName,
        this.emailVerified,
        this.tenantId,
        this.tenantName,
        this.termsAgreed,
        this.privacyAgreed,
        this.tenantProps,
        this.fullName,
        this.uid});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deleted = json['deleted'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    orgName = json['orgName'];
    emailVerified = json['emailVerified'];
    tenantId = json['tenantId'];
    tenantName = json['tenantName'];
    termsAgreed = json['termsAgreed'];
    privacyAgreed = json['privacyAgreed'];
    tenantProps = json['tenantProps'] != null
        ? new TenantProps.fromJson(json['tenantProps'])
        : null;
    fullName = json['fullName'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deleted'] = this.deleted;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['role'] = this.role;
    data['orgName'] = this.orgName;
    data['emailVerified'] = this.emailVerified;
    data['tenantId'] = this.tenantId;
    data['tenantName'] = this.tenantName;
    data['termsAgreed'] = this.termsAgreed;
    data['privacyAgreed'] = this.privacyAgreed;
    if (this.tenantProps != null) {
      data['tenantProps'] = this.tenantProps!.toJson();
    }
    data['fullName'] = this.fullName;
    data['uid'] = this.uid;
    return data;
  }
}

class TenantProps {
  String? tenantType;
  String? displayName;
  String? name;

  TenantProps({this.tenantType, this.displayName, this.name});

  TenantProps.fromJson(Map<String, dynamic> json) {
    tenantType = json['tenantType'];
    displayName = json['displayName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantType'] = this.tenantType;
    data['displayName'] = this.displayName;
    data['name'] = this.name;
    return data;
  }
}
