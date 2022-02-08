import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'dart:convert';
class GetBookingss implements UseCase<void,String> {
  final UserRepository userRepository;
  GetBookingss(this.userRepository);
  @override
  Future<Either<Failure, Bookingsss>> call(String id1) {
    return userRepository.getBookingss(id1);
  }
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



Bookingsss welcomeFromJson(String str) => Bookingsss.fromJson(json.decode(str));

String welcomeToJson(Bookingsss data) => json.encode(data.toJson());

class Bookingsss {
  Bookingsss({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Bookingsss.fromJson(Map<String, dynamic> json) => Bookingsss(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.userId,
    this.providerId,
    this.amount,
    this.bookingId,
    this.bookingDate,
    this.bookingTime,
    this.status,
    this.serviceName,
    this.serviceCost,
    this.totalAmount,
    this.petImage,
    this.petName,
    this.companyName,
    this.companyCity,
    this.companyState,
    this.companyZipCode,
    this.companyLongitude,
    this.companyLatitude,
    this.userLongitude,
    this.userLatitude,
    this.proivderEmail,
    this.firstName,
    this.lastName,
  });

  int userId;
  int providerId;
  String amount;
  int bookingId;
  DateTime bookingDate;
  String bookingTime;
  String status;
  String serviceName;
  dynamic serviceCost;
  dynamic totalAmount;
  String petImage;
  String petName;
  String companyName;
  String companyCity;
  String companyState;
  int companyZipCode;
  String companyLongitude;
  String companyLatitude;
  String userLongitude;
  String userLatitude;
  String proivderEmail;
  String firstName;
  String lastName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["user_id"],
    providerId: json["provider_id"],
    amount: json["amount"],
    bookingId: json["booking_id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    bookingTime: json["booking_time"],
    status: json["status"],
    serviceName: json["service_name"],
    serviceCost: json["service_cost"],
    totalAmount: json["total_amount"],
    petImage: json["pet_image"],
    petName: json["pet_name"],
    companyName: json["company_name"],
    companyCity: json["company_city"],
    companyState: json["company_state"],
    companyZipCode: json["company_zip_code"],
    companyLongitude: json["company_longitude"],
    companyLatitude: json["company_latitude"],
    userLongitude: json["user_longitude"],
    userLatitude: json["user_latitude"],
    proivderEmail: json["proivder_email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "provider_id": providerId,
    "amount": amount,
    "booking_id": bookingId,
    "booking_date": "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
    "booking_time": bookingTime,
    "status": status,
    "service_name": serviceName,
    "service_cost": serviceCost,
    "total_amount": totalAmount,
    "pet_image": petImage,
    "pet_name": petName,
    "company_name": companyName,
    "company_city": companyCity,
    "company_state": companyState,
    "company_zip_code": companyZipCode,
    "company_longitude": companyLongitude,
    "company_latitude": companyLatitude,
    "user_longitude": userLongitude,
    "user_latitude": userLatitude,
    "proivder_email": proivderEmail,
    "first_name": firstName,
    "last_name": lastName,
  };
}
