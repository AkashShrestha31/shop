class LoginModel {
  String? refreshToken;
  String? accessToken;
  User? user;

  LoginModel({this.refreshToken, this.accessToken, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh_token'] = this.refreshToken;
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  // Null? lastLogin;
  String? phone;
  String? name;
  String? temporaryAddress;
  String? permanentAddress;
  String? phoneNumber;
  String? alternatePhoneNumber;
  String? documentType;
  String? userType;
  String? document;
  bool? sameAddress;
  bool? active;
  bool? shopworker;
  String? created;

  User(
      {this.id,
      // this.lastLogin,
      this.phone,
      this.name,
      this.temporaryAddress,
      this.permanentAddress,
      this.phoneNumber,
      this.alternatePhoneNumber,
      this.documentType,
      this.userType,
      this.document,
      this.sameAddress,
      this.active,
      this.shopworker,
      this.created});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // lastLogin = json['last_login'];
    phone = json['phone'];
    name = json['name'];
    temporaryAddress = json['temporary_address'];
    permanentAddress = json['permanent_address'];
    phoneNumber = json['phone_number'];
    alternatePhoneNumber = json['alternate_phone_number'];
    documentType = json['document_type'];
    userType = json['user_type'];
    document = json['document'];
    sameAddress = json['same_address'];
    active = json['active'];
    shopworker = json['shopworker'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['last_login'] = this.lastLogin;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['temporary_address'] = this.temporaryAddress;
    data['permanent_address'] = this.permanentAddress;
    data['phone_number'] = this.phoneNumber;
    data['alternate_phone_number'] = this.alternatePhoneNumber;
    data['document_type'] = this.documentType;
    data['user_type'] = this.userType;
    data['document'] = this.document;
    data['same_address'] = this.sameAddress;
    data['active'] = this.active;
    data['shopworker'] = this.shopworker;
    data['created'] = this.created;
    return data;
  }
}
