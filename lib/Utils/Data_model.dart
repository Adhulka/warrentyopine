// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? partnerId;
  String? name;
  String? email;
  String? mobile;
  String? address;
  dynamic gstNo;
  String? panNo;
  String? pin;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.partnerId,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.gstNo,
    this.panNo,
    this.pin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? partnerId,
    String? name,
    String? email,
    String? mobile,
    String? address,
    dynamic gstNo,
    String? panNo,
    String? pin,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        partnerId: partnerId ?? this.partnerId,
        name: name ?? this.name,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address,
        gstNo: gstNo ?? this.gstNo,
        panNo: panNo ?? this.panNo,
        pin: pin ?? this.pin,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    partnerId: json["partner_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    gstNo: json["gst_no"],
    panNo: json["pan_no"],
    pin: json["pin"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "partner_id": partnerId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "address": address,
    "gst_no": gstNo,
    "pan_no": panNo,
    "pin": pin,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
