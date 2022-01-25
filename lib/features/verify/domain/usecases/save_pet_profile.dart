import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
//part 'save_pet_profile.g.dart';

//TODO: Ricky
class SavePetProfile extends UseCase<void, PetProfile1> {
  UserRepository userRepository;
  SavePetProfile(this.userRepository);

  @override
  Future<Either<Failure, void>> call(PetProfile1 params) {
    return userRepository.savePetProfile(params);
  }
}

// @JsonSerializable()
// class PetProfile {
//   final String profileImage;
//   final String gender;
//   final String petName;
//   final String providerName;
//   final String petVaccine;
//   final String known_allergies;
//   final String uploadVaccineRecord;
//   final String walkingSchedule;
//   final String feedingSchedule;
//   final String temperament;
//   final String medication;
//   final String notes;
//   final String age;
//   final String grooming;
//   final String vet;
//   final String hotel;
//   final String walking;
//   final String dayCare;
//   final String hospital;
//   final String breadType;
//   final String height;
//   final String weight;
//   String birthDate;
//   String sex;
//   final String file;
//   final String name;
//   final String petneeds;
//   final String times_aday;
//   final String addMoreVaccine;
//
//   PetProfile({
//     this.times_aday,
//     this.petneeds,
//     this.known_allergies,
//     this.file,
//     this.providerName,
//     this.uploadVaccineRecord,
//     this.walkingSchedule,
//     this.feedingSchedule,
//     this.temperament,
//     this.medication,
//     this.notes,
//     this.grooming,
//     this.vet,
//     this.hotel,
//     this.walking,
//     this.dayCare,
//     this.hospital,
//     this.profileImage,
//     this.gender,
//     this.petName,
//     this.breadType,
//     this.height,
//     this.weight,
//     this.birthDate,
//     this.sex,
//     this.petVaccine,
//     this.addMoreVaccine,
//     this.age,
//     this.name
//   });
// factory PetProfile.fromJson(Map<String, dynamic> json) =>
//     _$PetProfileParamsFromJson(json);
// Map<String,dynamic> toJson() =>_$PetProfileParamsToJson(this);
// }
// To parse this JSON data, do
//
//   final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

//
// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));
//
// String welcomeToJson(Welcome data) => json.encode(data.toJson());
//
// class Welcome {
//   Welcome({
//     this.meta,
//     this.data,
//   });
//
//   dynamic meta;
//   Data data;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     meta: json["meta"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "meta": meta,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.email,
//     this.gender,
//     this.status,
//   });
//
//   int id;
//   String name;
//   String email;
//   String gender;
//   String status;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     gender: json["gender"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "gender": gender,
//     "status": status,
//   };
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.petProfiles,
  });

  List<PetProfile1> petProfiles;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        petProfiles: List<PetProfile1>.from(
            json["pet_profiles"].map((x) => PetProfile1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pet_profiles": List<dynamic>.from(petProfiles.map((x) => x.toJson())),
      };
}

class PetProfile1 {
  PetProfile1({
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
    this.notes,
    this.vaccine,
    this.name,
    this.times_a_day,
    this.service_cost,
  });

  var id;
  var userId;
  var petName;
  var img;
  var breedType;
  var age;
  var weight;
  var height;
  var knownAllergies;
  var petNeeds;
  var birthDate;
  var name;
  var times_a_day;
  String sex;
  var gender;
  var service_cost;
  var walkingSchedule;
  var feedingSchedule;
  var temperament;
  var medication;
  var status;
  var createdAt;
  var updatedAt;
  var notes;
  var vaccine;

  factory PetProfile1.fromJson(Map<String, dynamic> json) => PetProfile1(
    img: json["img"],
    id: json["id"],
    userId: json["user_id"],
    petName: json["pet_name"],
    breedType: json["breed_type"],
      );

  Map<String, dynamic> toJson() => {
    "img": img,
    "id": id,
    "user_id": userId,
    "pet_name": petName,
    "breed_type": breedType,
};
}


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Welcome2 welcome2FromJson(String str) => Welcome2.fromJson(json.decode(str));

String welcome2ToJson(Welcome data) => json.encode(data.toJson());

class Welcome2 {
  Welcome2({
    this.getSinglePe,
  });
  GetSinglePe getSinglePe;

  factory Welcome2.fromJson(Map<String, dynamic> json) => Welcome2(
        getSinglePe: GetSinglePe.fromJson(json["pet_profile"]),
      );

  Map<String, dynamic> toJson() => {
        "pet_profile": getSinglePe.toJson(),
      };
}

class GetSinglePe {
  GetSinglePe({
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
  String img;
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

  factory GetSinglePe.fromJson(Map<String, dynamic> json) => GetSinglePe(
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
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
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
