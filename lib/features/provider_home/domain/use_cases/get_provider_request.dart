import 'package:maru/features/Home/presentation/pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';

import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import 'dart:convert';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
class GetProviderRequest implements UseCase<void, SearchRequestProviderParams> {
  UserRepository userRepository;
  GetProviderRequest(this.userRepository);
  @override
  Future<Either<Failure, GetProviderRequestModel>> call(SearchRequestProviderParams params) async {
    return userRepository.getProviderRequest(params);
  }
}
class SearchRequestProviderParams{
  final String name;
  final String service;
  final String provider;
  final String date;
  final String page;
  final String limit;

  SearchRequestProviderParams({this.name, this.service, this.provider, this.date, this.page, this.limit});
}
GetProviderRequestModel welcomeFromJson(String str) => GetProviderRequestModel.fromJson(json.decode(str));

String welcomeToJson(GetProviderRequestModel data) => json.encode(data.toJson());

class GetProviderRequestModel {
  GetProviderRequestModel({
    this.appointmentRequests,
    this.count,
    this.pages,
  });

  List<AppointmentRequest> appointmentRequests;
  int count;
  int pages;

  factory GetProviderRequestModel.fromJson(Map<String, dynamic> json) => GetProviderRequestModel(
    appointmentRequests: List<AppointmentRequest>.from(json["appointment_requests"].map((x) => AppointmentRequest.fromJson(x))),
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "appointment_requests": List<dynamic>.from(appointmentRequests.map((x) => x.toJson())),
    "count": count,
    "pages": pages,
  };
}

class AppointmentRequest {
  AppointmentRequest({
    this.id,
    this.bookingDate,
    this.bookingStatus,
    this.ownerFName,
    this.ownerLName,
    this.petName,
    this.companyName,
    this.service,
    this.userImg,
  });

  int id;
  DateTime bookingDate;
  String bookingStatus;
  String ownerFName;
  String ownerLName;
  String petName;
  String companyName;
  String service;
  String userImg;

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) => AppointmentRequest(
    id: json["id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    bookingStatus: json["booking_status"],
    ownerFName: json["owner_f_name"],
    ownerLName: json["owner_l_name"],
    petName: json["pet_name"],
    companyName: json["company_name"],
    service: json["service"],
    userImg: json["user_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_date": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
    "booking_status": bookingStatus,
    "owner_f_name": ownerFName,
    "owner_l_name": ownerLName,
    "pet_name": petName,
    "company_name": companyName,
    "service": service,
    "user_img": userImg,
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
    this.otp,
    this.isVerified,
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
  String otp;
  String isVerified;
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
    otp: json["otp"],
    isVerified: json["is_verified"],
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
    "otp": otp,
    "is_verified": isVerified,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Pet {
  Pet({
    this.id,
    this.userId,
    this.petName,
    this.img,
    this.breedType,
    this.age,
    this.weight,
    this.height,
    this.knownAllergies,
    this.petNeeds,
    this.birthDate,
    this.sex,
    this.gender,
    this.walkingSchedule,
    this.feedingSchedule,
    this.temperament,
    this.medication,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String petName;
  dynamic img;
  String breedType;
  int age;
  int weight;
  int height;
  String knownAllergies;
  String petNeeds;
  DateTime birthDate;
  String sex;
  dynamic gender;
  String walkingSchedule;
  String feedingSchedule;
  String temperament;
  String medication;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["id"],
    userId: json["user_id"],
    petName: json["pet_name"],
    img: json["img"],
    breedType: json["breed_type"],
    age: json["age"],
    weight: json["weight"],
    height: json["height"],
    knownAllergies: json["known_allergies"],
    petNeeds: json["pet_needs"],
    birthDate: DateTime.parse(json["birth_date"]),
    sex: json["sex"],
    gender: json["gender"],
    walkingSchedule: json["walking_schedule"],
    feedingSchedule: json["feeding_schedule"],
    temperament: json["temperament"],
    medication: json["medication"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "pet_name": petName,
    "img": img,
    "breed_type": breedType,
    "age": age,
    "weight": weight,
    "height": height,
    "known_allergies": knownAllergies,
    "pet_needs": petNeeds,
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "sex": sex,
    "gender": gender,
    "walking_schedule": walkingSchedule,
    "feeding_schedule": feedingSchedule,
    "temperament": temperament,
    "medication": medication,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
