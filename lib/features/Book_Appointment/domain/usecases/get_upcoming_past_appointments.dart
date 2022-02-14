import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

import 'dart:convert';
class GetUpcomingAndPastAppointmentdddddd implements UseCase<void, UpcomingBooking> {
  UserRepository userRepository;
  GetUpcomingAndPastAppointmentdddddd(this.userRepository);

  @override
  Future<Either<Failure, UpcomingPastAppointmentModel>> call(UpcomingBooking params) async {
    print('parmendra');
    print('dkjdhjkdhjkdhjkdhdjkhd');
    return userRepository.getUpcomingAndPastAppointment(params);

  }

}

UpcomingPastAppointmentModel welcomeFromJson(String str) => UpcomingPastAppointmentModel.fromJson(json.decode(str));

String welcomeToJson(UpcomingPastAppointmentModel data) => json.encode(data.toJson());



class UpcomingPastAppointmentModel {
  UpcomingPastAppointmentModel({
    this.upcomingBookings,
    this.pastBookings,
  });

  List<UpcomingBooking> upcomingBookings;
  List<UpcomingBooking> pastBookings;

  factory UpcomingPastAppointmentModel.fromJson(Map<String, dynamic> json) => UpcomingPastAppointmentModel(
    upcomingBookings: List<UpcomingBooking>.from(json["Upcoming_bookings"].map((x) => UpcomingBooking.fromJson(x))),
    pastBookings: List<UpcomingBooking>.from(json["past_bookings"].map((x) => UpcomingBooking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Upcoming_bookings": List<dynamic>.from(upcomingBookings.map((x) => x.toJson())),
    "past_bookings": List<dynamic>.from(pastBookings.map((x) => x.toJson())),
  };
}

class UpcomingBooking {
  UpcomingBooking({
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

  factory UpcomingBooking.fromJson(Map<String, dynamic> json) => UpcomingBooking(
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
