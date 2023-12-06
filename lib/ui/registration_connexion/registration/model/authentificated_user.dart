import 'dart:convert';

class ConnectingData {
  String? message;
  String? token;
  User? user;
  bool? admin;

  ConnectingData({
    this.message,
    this.token,
    this.user,
    this.admin,
  });

  factory ConnectingData.fromRawJson(String str) =>
      ConnectingData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConnectingData.fromJson(Map<String, dynamic> json) => ConnectingData(
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user": user?.toJson(),
        "admin": admin,
      };
}

class User {
  int? id;
  String? fullName;
  String? email;
  dynamic emailVerifiedAt;
  String? password;
  String? phoneNumber;
  String? profileImagePath;
  String? livingAddress;
  String? profession;
  String? statusMatrimonial;
  String? birthday;
  String? nationalCardId;
  String? revenuAnnuel;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.fullName,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.phoneNumber,
    this.profileImagePath,
    this.livingAddress,
    this.profession,
    this.statusMatrimonial,
    this.birthday,
    this.nationalCardId,
    this.revenuAnnuel,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        profileImagePath: json["profileImagePath"],
        livingAddress: json["livingAddress"],
        profession: json["profession"],
        statusMatrimonial: json["statusMatrimonial"],
        birthday: json["birthday"],
        nationalCardId: json["nationalCardID"],
        revenuAnnuel: json["revenuAnnuel"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "phoneNumber": phoneNumber,
        "profileImagePath": profileImagePath,
        "livingAddress": livingAddress,
        "profession": profession,
        "statusMatrimonial": statusMatrimonial,
        "birthday": birthday,
        "nationalCardID": nationalCardId,
        "revenuAnnuel": revenuAnnuel,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
