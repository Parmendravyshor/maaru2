import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

import 'get_provider_request.dart';

import 'dart:convert';
class GetUsers implements UseCase<void, void> {
  UserRepository userRepository;
  GetUsers(this.userRepository);
  @override
  Future<Either<Failure, GetUserModel>> call(
      void params) async {
    return userRepository.getUsers();
  }
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


GetUserModel welcomeFromJson(String str) => GetUserModel.fromJson(json.decode(str));

String welcomeToJson(GetUserModel data) => json.encode(data.toJson());

class GetUserModel {
  GetUserModel({
    this.customers,
    this.count,
    this.pages,
  });

  List<Customer> customers;
  int count;
  int pages;

  factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
    customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
    "count": count,
    "pages": pages,
  };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.userType,
    this.email,
    this.token,
    this.password,
    this.deviceToken,
    this.deviceType,
    this.otp,
    this.isVerified,
    this.mailNotifications,
    this.pushNotifications,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String userType;
  String email;
  String token;
  String password;
  String deviceToken;
  String deviceType;
  String otp;
  String isVerified;
  int mailNotifications;
  int pushNotifications;
  DateTime createdAt;
  DateTime updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userType: json["user_type"],
    email: json["email"],
    token: json["token"],
    password: json["password"],
    deviceToken: json["device_token"],
    deviceType: json["device_type"],
    otp: json["otp"],
    isVerified: json["is_verified"],
    mailNotifications: json["mail_notifications"],
    pushNotifications: json["push_notifications"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_type": userType,
    "email": email,
    "token": token,
    "password": password,
    "device_token": deviceToken,
    "device_type": deviceType,
    "otp": otp,
    "is_verified": isVerified,
    "mail_notifications": mailNotifications,
    "push_notifications": pushNotifications,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
