import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

import 'dart:convert';
class GetUpcomingAndPastAppointments implements UseCase<void, String> {
  UserRepository userRepository;
  GetUpcomingAndPastAppointments(this.userRepository);

  @override
  Future<Either<Failure, UpcomingPastAppointmentModel>> call(String text) async {
    return userRepository.getUpcomingAndPastAppointments(text);
  }
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class UpcomingPastAppointmentModel {
  UpcomingPastAppointmentModel({
    this.upcomingBookings,
    this.pastBookings,
  });

  List<Booking> upcomingBookings;
  List<Booking> pastBookings;

  factory UpcomingPastAppointmentModel.fromJson(Map<String, dynamic> json) => UpcomingPastAppointmentModel(
    upcomingBookings: List<Booking>.from(json["Upcoming_bookings"].map((x) => Booking.fromJson(x))),
    pastBookings: List<Booking>.from(json["past_bookings"].map((x) => Booking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Upcoming_bookings": List<dynamic>.from(upcomingBookings.map((x) => x.toJson())),
    "past_bookings": List<dynamic>.from(pastBookings.map((x) => x.toJson())),
  };
}

class Booking {
  Booking({
    this.bookingId,
    this.bookingDate,
    this.bookingTime,
    this.status,
    this.serviceName,
    this.petImage,
    this.petName,
    this.companyName,
    this.companyCity,
    this.companyState,
    this.companyZipCode,
  });

  int bookingId;
  String bookingDate;
  String bookingTime;
  String status;
  String serviceName;
  String petImage;
  String petName;
  String companyName;
  String companyCity;
  String companyState;
  int companyZipCode;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    bookingId: json["booking_id"],
    bookingDate: json["booking_date"],
    bookingTime: json["booking_time"],
    status: json["status"],
    serviceName: json["service_name"],
    petImage: json["pet_image"],
    petName: json["pet_name"],
    companyName: json["company_name"],
    companyCity: json["company_city"],
    companyState: json["company_state"],
    companyZipCode: json["company_zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "booking_date": bookingDate,

    "booking_time": bookingTime,
    "status": status,
    "service_name": serviceName,
    "pet_image": petImage,
    "pet_name": petName,
    "company_name": companyName,
    "company_city": companyCity,
    "company_state": companyState,
    "company_zip_code": companyZipCode,
  };
}
