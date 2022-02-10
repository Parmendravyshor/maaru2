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
  Future<Either<Failure, GetProviderRequestModel>> call(
      SearchRequestProviderParams params) async {
    return userRepository.getProviderRequest(params);
  }
}

class SearchRequestProviderParams {
  final String name;
  final String service;
  final String provider;
  final String date;
  final String page;
  final String limit;

  SearchRequestProviderParams(
      {this.name,
      this.service,
      this.provider,
      this.date,
      this.page,
      this.limit});
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

GetProviderRequestModel welcomeFromJson(String str) =>
    GetProviderRequestModel.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class GetProviderRequestModel {
  GetProviderRequestModel({
    this.appointmentRequests,
    this.count,
    this.pages,
  });

  List<GetBookingsRequest> appointmentRequests;
  int count;
  int pages;

  factory GetProviderRequestModel.fromJson(Map<String, dynamic> json) =>
      GetProviderRequestModel(
        appointmentRequests: List<GetBookingsRequest>.from(
            json["get_bookings_request"]
                .map((x) => GetBookingsRequest.fromJson(x))),
        count: json["count"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "get_bookings_request":
            List<dynamic>.from(appointmentRequests.map((x) => x.toJson())),
        "count": count,
        "pages": pages,
      };
}

class GetBookingsRequest {
  GetBookingsRequest({
    this.id,
    this.bookingDate,
    this.bookingStartTime,
    this.bookingStatus,
    this.ownerFName,
    this.ownerLName,
    this.petName,
    this.petImg,
    this.companyName,
    this.companyCity,
    this.companyState,
    this.companyZipCode,
    this.service,
  });

  int id;
  DateTime bookingDate;
  String bookingStartTime;
  String bookingStatus;
  String ownerFName;
  String ownerLName;
  String petName;
  String petImg;
  String companyName;
  String companyCity;
  String companyState;
  int companyZipCode;
  String service;

  factory GetBookingsRequest.fromJson(Map<String, dynamic> json) =>
      GetBookingsRequest(
        id: json["id"],
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingStartTime: json["booking_start_time"],
        bookingStatus: json["booking_status"],
        ownerFName: json["owner_f_name"],
        ownerLName: json["owner_l_name"],
        petName: json["pet_name"],
        petImg: json["pet_img"],
        companyName: json["company_name"],
        companyCity: json["company_city"],
        companyState: json["company_state"],
        companyZipCode: json["company_zip_code"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_start_time": bookingStartTime,
        "booking_status": bookingStatus,
        "owner_f_name": ownerFName,
        "owner_l_name": ownerLName,
        "pet_name": petName,
        "pet_img": petImg,
        "company_name": companyName,
        "company_city": companyCity,
        "company_state": companyState,
        "company_zip_code": companyZipCode,
        "service": service,
      };
}
