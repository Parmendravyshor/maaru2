import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'dart:convert';
class GetUserProfile implements UseCase<void, void> {
  UserRepository userRepository;
  GetUserProfile(this.userRepository);

  @override
  Future<Either<Failure, GetUserProfileMOdel>> call(void params) async {
    return userRepository.getUserProfile();
  }
}
GetUserProfileMOdel welcomeFromJson(String str) => GetUserProfileMOdel.fromJson(json.decode(str));

String welcomeToJson(GetUserProfileMOdel data) => json.encode(data.toJson());

class GetUserProfileMOdel {
  GetUserProfileMOdel({
    this.user,
  });

  List<User> user;

  factory GetUserProfileMOdel.fromJson(Map<String, dynamic> json) => GetUserProfileMOdel(
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": List<dynamic>.from(user.map((x) => x.toJson())),
  };
}

class User {
  User({
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
    this.userProfile,
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
  UserProfile userProfile;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    userProfile: UserProfile.fromJson(json["userProfile"]),
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
    "userProfile": userProfile.toJson(),
  };
}

class UserProfile {
  UserProfile({
    this.img,
    this.id,
    this.userId,
    this.phoneNo,
    this.city,
    this.state,
    this.zipcode,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
  });

  String img;
  int id;
  int userId;
  String phoneNo;
  String city;
  String state;
  String zipcode;
  String longitude;
  String latitude;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    img: json["img"],
    id: json["id"],
    userId: json["user_id"],
    phoneNo: json["phone_no"],
    city: json["city"],
    state: json["state"],
    zipcode: json["zipcode"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "id": id,
    "user_id": userId,
    "phone_no": phoneNo,
    "city": city,
    "state": state,
    "zipcode": zipcode,
    "longitude": longitude,
    "latitude": latitude,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
