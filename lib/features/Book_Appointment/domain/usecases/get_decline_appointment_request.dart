import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';

class GetUpcomingPastAndDeclineAppointment implements UseCase<void, SearchParams> {
  UserRepository userRepository;
  GetUpcomingPastAndDeclineAppointment(this.userRepository);

  @override
  Future<Either<Failure, GetAllAppointmentProvider>> call(SearchParams params) {
    // TODO: implement call
    return userRepository.getUpcomingPastAndDeclineAppointment(params);
  }
}
class SearchParams{
  final String text1;
  final String date;

  SearchParams({this.text1, this.date});
}
GetAllAppointmentProvider welcomeFromJson(String str) =>
    GetAllAppointmentProvider.fromJson(json.decode(str));

String welcomeToJson(GetAllAppointmentProvider data) =>
    json.encode(data.toJson());

class GetAllAppointmentProvider {
  GetAllAppointmentProvider({
    this.confirmed,
    this.completed,
    this.cancelled,
  });

  List<Cancelled> confirmed;
  List<Cancelled> completed;
  List<Cancelled> cancelled;

  factory GetAllAppointmentProvider.fromJson(Map<String, dynamic> json) =>
      GetAllAppointmentProvider(
        confirmed: List<Cancelled>.from(
            json["confirmed"].map((x) => Cancelled.fromJson(x))),
        completed: List<Cancelled>.from(
            json["completed"].map((x) => Cancelled.fromJson(x))),
        cancelled: List<Cancelled>.from(
            json["cancelled"].map((x) => Cancelled.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "confirmed": List<dynamic>.from(confirmed.map((x) => x.toJson())),
        "completed": List<dynamic>.from(completed.map((x) => x.toJson())),
        "cancelled": List<dynamic>.from(cancelled.map((x) => x.toJson())),
      };
}

class Cancelled {
  Cancelled({
    this.bookingDate,
    this.bookingStatus,
    this.ownerFName,
    this.ownerLName,
    this.petName,
    this.petImg,
    this.companyName,
    this.description,
    this.city,
    this.state,
    this.zipCode,
    this.service,
    this.bookingStartTime
  });
  String bookingStartTime;
  DateTime bookingDate;
  String bookingStatus;
  String ownerFName;
  String ownerLName;
  String petName;
  String petImg;
  String companyName;
  String description;
  String city;
  String state;
  int zipCode;
  String service;

  factory Cancelled.fromJson(Map<String, dynamic> json) => Cancelled(
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingStatus: json["booking_status"],
        ownerFName: json["owner_f_name"],
        ownerLName: json["owner_l_name"],
    bookingStartTime: json["booking_start_time"],
        petName: json["pet_name"],
        petImg: json["pet_img"],
        companyName: json["company_name"],
        description: json["description"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_status": bookingStatus,
        "owner_f_name": ownerFName,
        "owner_l_name": ownerLName,
    "booking_start_time": bookingStartTime,
        "pet_name": petName,
        "pet_img": petImg,
        "company_name": companyName,
        "description": description,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "service": service,
      };
}
