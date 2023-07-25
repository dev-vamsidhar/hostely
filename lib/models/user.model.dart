// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String aadhar;
  String photo;
  String phone;
  String parentPhone;
  String address;
  String rent;
  String roomNo;
  String rollNo;
  String paidAmount;
  String year;

  UserModel({
    required this.name,
    required this.aadhar,
    required this.photo,
    required this.phone,
    required this.parentPhone,
    required this.address,
    this.rent = "0",
    this.roomNo = "",
    this.paidAmount = "0",
    this.year = "",
    required this.rollNo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        aadhar: json["aadhar"],
        photo: json["photo"],
        phone: json["phone"],
        parentPhone: json["parentPhone"],
        address: json["address"],
        rent: json["rent"],
        roomNo: json["roomNo"],
        rollNo: json["rollNo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "aadhar": aadhar,
        "photo": photo,
        "phone": phone,
        "parentPhone": parentPhone,
        "address": address,
        "rent": rent,
        "roomNo": roomNo,
        "rollNo": rollNo,
      };
}
