import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
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
        id: json["id"],
        service_cost: json['service_cost'],
        name: json['name'],
        times_a_day: json['times_a_day'],
        userId: json["user_id"],
        petName: json["pet_name"],
        img: json["img"],
        breedType: json["breed_type"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        knownAllergies: json["known_allergies"] == null
            ? null
            : knownAllergiesValues.map[json["known_allergies"]],
        petNeeds: knownAllergiesValues.map[json["pet_needs"]],
        birthDate: DateTime.parse(json["birth_date"]),
        sex: sexValues.map[json["sex"]].toString(),
        gender: json["gender"],
        walkingSchedule:
            json["walking_schedule"] == null ? null : json["walking_schedule"],
        feedingSchedule:
            json["feeding_schedule"] == null ? null : json["feeding_schedule"],
        temperament: json["temperament"] == null
            ? null
            : knownAllergiesValues.map[json["temperament"]],
        medication: json["medication"] == null
            ? null
            : medicationValues.map[json["medication"]],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        vaccine:
            List<Vaccine>.from(json["vaccine"].map((x) => Vaccine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pet_name": petName,
        "img": img,
        'times_a_day': times_a_day,
        'name': name,
        "breed_type": breedTypeValues.reverse[breedType],
        "age": age,
        "weight": weight,
        "height": height,
        "known_allergies": knownAllergies == null
            ? null
            : knownAllergiesValues.reverse[knownAllergies],
        "pet_needs": petNeeds == null ? null : petNeedsValues.reverse[petNeeds],
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "sex": sexValues.reverse[sex],
        "gender": gender,
        'service_cost': service_cost,
        "walking_schedule": walkingSchedule == null ? null : walkingSchedule,
        "feeding_schedule": feedingSchedule == null ? null : feedingSchedule,
        "temperament": temperament == null
            ? null
            : knownAllergiesValues.reverse[temperament],
        "medication":
            medication == null ? null : medicationValues.reverse[medication],
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "vaccine": List<dynamic>.from(vaccine.map((x) => x.toJson())),
      };
}

enum BreedType { BOG, BULL_DOG, CAT, SS }

final breedTypeValues = EnumValues({
  "bog": BreedType.BOG,
  "bull dog": BreedType.BULL_DOG,
  "cat": BreedType.CAT,
  "ss": BreedType.SS
});

enum KnownAllergies { NO, KNOWN_ALLERGIES_NO, YES, EMPTY }

final knownAllergiesValues = EnumValues({
  "": KnownAllergies.EMPTY,
  "No": KnownAllergies.KNOWN_ALLERGIES_NO,
  "no": KnownAllergies.NO,
  "yes": KnownAllergies.YES
});

enum Medication { YES, MEDICATION_YES, EMPTY }

final medicationValues = EnumValues({
  "": Medication.EMPTY,
  "yes": Medication.MEDICATION_YES,
  "Yes": Medication.YES
});

class Note {
  Note({
    this.id,
    this.petId,
    this.name,
    this.timesADay,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int petId;
  String name;
  int timesADay;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        petId: json["pet_id"],
        name: json["name"] == null ? null : json["name"],
        timesADay: json["times_a_day"] == null ? null : json["times_a_day"],
        note: json["note"] == null ? null : json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "name": name == null ? null : name,
        "times_a_day": timesADay == null ? null : timesADay,
        "note": note == null ? null : note,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum PetNeeds { MILK_BISCUITS, WALKING, FOOD, WALKING_MILK, EMPTY }

final petNeedsValues = EnumValues({
  "": PetNeeds.EMPTY,
  "food ": PetNeeds.FOOD,
  "Milk, biscuits": PetNeeds.MILK_BISCUITS,
  "walking": PetNeeds.WALKING,
  "walking,milk": PetNeeds.WALKING_MILK
});

enum Sex { NEITHER }

final sexValues = EnumValues({"neither": Sex.NEITHER});

class Vaccine {
  Vaccine({
    this.id,
    this.petId,
    this.docUrl,
    this.vaccineCreatedAt,
    this.vaccineUpdatedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int petId;
  String docUrl;
  DateTime vaccineCreatedAt;
  DateTime vaccineUpdatedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"],
        petId: json["pet_id"],
        docUrl: json["doc_url"],
        vaccineCreatedAt: DateTime.parse(json["created_at"]),
        vaccineUpdatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pet_id": petId,
        "doc_url": docUrl,
        "created_at": vaccineCreatedAt.toIso8601String(),
        "updated_at": vaccineUpdatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
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
