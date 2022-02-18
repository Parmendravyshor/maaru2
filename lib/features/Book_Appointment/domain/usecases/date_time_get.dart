import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class GetDateAndTime implements UseCase<void, GetTimeAndDAteParams> {
  final UserRepository userRepository;
  GetDateAndTime(this.userRepository);
  @override
  Future<Either<Failure, Bookingdatemodels>> call(GetTimeAndDAteParams params) {
    return userRepository.getDateAndTime(params);
  }
}

class GetTimeAndDAteParams {
  final String providerid;
  final String Bookingdate;

  GetTimeAndDAteParams({this.providerid, this.Bookingdate});
}
// To parse this JSON data, do
//
//     final bookingdatemodels = bookingdatemodelsFromJson(jsonString);

Bookingdatemodels bookingdatemodelsFromJson(String str) =>
    Bookingdatemodels.fromJson(json.decode(str));

String bookingdatemodelsToJson(Bookingdatemodels data) =>
    json.encode(data.toJson());

class Bookingdatemodels {
  Bookingdatemodels({
    this.bookedTimes,
    this.times,
  });

  List<BookedTime> bookedTimes;
  List<Time> times;

  factory Bookingdatemodels.fromJson(Map<String, dynamic> json) =>
      Bookingdatemodels(
        bookedTimes: List<BookedTime>.from(
            json["booked_times"].map((x) => BookedTime.fromJson(x))),
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "booked_times": List<dynamic>.from(bookedTimes.map((x) => x.toJson())),
        "times": List<dynamic>.from(times.map((x) => x.toJson())),
      };
}

class BookedTime {
  BookedTime({
    this.bookingStartTime,
    this.bookingDate,
  });

  String bookingStartTime;
  DateTime bookingDate;

  factory BookedTime.fromJson(Map<String, dynamic> json) => BookedTime(
        bookingStartTime: json["booking_start_time"],
        bookingDate: DateTime.parse(json["booking_date"]),
      );

  Map<String, dynamic> toJson() => {
        "booking_start_time": bookingStartTime,
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
      };
}

class Time {
  Time({
    this.time,
    this.booked,
  });

  String time;
  bool booked;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        time: json["time"],
        booked: json["booked"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "booked": booked,
      };
}
