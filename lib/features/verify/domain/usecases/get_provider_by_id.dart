import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'get_providers.dart';
import 'dart:convert';
class GetProviderById implements UseCase<void, Welcome4> {
  UserRepository userRepository;
  GetProviderById(this.userRepository);

  @override
  Future<Either<Failure, Welcome4>> call(void params) async {
    return userRepository.getProviderById();
  }
}
/// To parse this JSON data, do
//
///     final welcome = welcomeFromJson(jsonString);
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


Welcome4 welcomeFromJson(String str) => Welcome4.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome4 {
  Welcome4({
    this.providerDetails,
    this.reviewCount,
    this.fiveStarView,
    this.average,
  });

  List<ProviderDetail> providerDetails;
  int reviewCount;
  int fiveStarView;
  String average;

  factory Welcome4.fromJson(Map<String, dynamic> json) => Welcome4(
    providerDetails: List<ProviderDetail>.from(json["provider_details"].map((x) => ProviderDetail.fromJson(x))),
    reviewCount: json["review_count"],
    fiveStarView: json["five_Star_View"],
    average: json["average"],
  );

  Map<String, dynamic> toJson() => {
    "provider_details": List<dynamic>.from(providerDetails.map((x) => x.toJson())),
    "review_count": reviewCount,
    "five_Star_View": fiveStarView,
    "average": average,
  };
}

class ProviderDetail {
  ProviderDetail({
    this.id,
    this.serviceId,
    this.userId,
    this.providerName,
    this.serviceCost,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.userType,
    this.email,
    this.password,
    this.token,
    this.otp,
    this.rememberMeToken,
    this.isVerified,
    this.mailNotifications,
    this.pushNotifications,
    this.img,
    this.companyName,
    this.contactFirstName,
    this.contactLastName,
    this.contactEmail,
    this.phoneNumber,
    this.operationHours,
    this.specialOperationHours,
    this.city,
    this.state,
    this.zipCode,
    this.longitude,
    this.latitude,
    this.description,
    this.averageRating,
    this.reviews,
    this.serviceType,
    this.serviceIcon,
    this.providerId,
    this.bookingId,
    this.reviewComment,
    this.ratings,
  });

  int id;
  int serviceId;
  int userId;
  String providerName;
  int serviceCost;
  DateTime createdAt;
  DateTime updatedAt;
  var firstName;
  var lastName;
  var userType;
  var email;
  var password;
  var token;
  var otp;
  dynamic rememberMeToken;
  String isVerified;
  int mailNotifications;
  int pushNotifications;
  var img;
  var companyName;
  var contactFirstName;
  var contactLastName;
  var contactEmail;
  String phoneNumber;
  String operationHours;
  String specialOperationHours;
  var city;
  var state;
  var zipCode;
  var longitude;
  var latitude;
  var description;
  String averageRating;
  String reviews;
  var serviceType;
  String serviceIcon;
  int providerId;
  int bookingId;
  var reviewComment;
  int ratings;

  factory ProviderDetail.fromJson(Map<String, dynamic> json) => ProviderDetail(
    id: json["id"] == null ? null : json["id"],
    serviceId: json["service_id"] == null ? null : json["service_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    providerName: json["provider_name"],
    serviceCost: json["service_cost"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    firstName: json["first_name"],
    lastName: json["last_name"],
    userType: json["user_type"],
    email: json["email"],
    password: json["password"],
    token: json["token"] == null ? null : json["token"],
    otp: json["otp"],
    rememberMeToken: json["remember_me_token"],
    isVerified: json["is_verified"],
    mailNotifications: json["mail_notifications"],
    pushNotifications: json["push_notifications"],
    img: json["img"],
    companyName: json["company_name"],
    contactFirstName: json["contact_first_name"],
    contactLastName: json["contact_last_name"],
    contactEmail: json["contact_email"],
    phoneNumber: json["phone_number"],
    operationHours: json["operation_hours"],
    specialOperationHours: json["special_operation_hours"] == null ? null : json["special_operation_hours"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    description: json["description"] == null ? null :json["description"],
    averageRating: json["average_rating"],
    reviews: json["reviews"],
    serviceType: json["service_type"],
    serviceIcon: json["service_icon"],
    providerId: json["provider_id"] == null ? null : json["provider_id"],
    bookingId: json["booking_id"] == null ? null : json["booking_id"],
    reviewComment:  json["review_comment"],
    ratings: json["ratings"] == null ? null : json["ratings"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "service_id": serviceId == null ? null : serviceId,
    "user_id": userId == null ? null : userId,
    "provider_name": providerName,
    "service_cost": serviceCost,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "first_name":firstName,
    "last_name": lastName,
    "user_type": userType,
    "email": email,
    "password": password,
    "token": token == null ? null : token,
    "otp": otp,
    "remember_me_token": rememberMeToken,
    "is_verified": isVerified,
    "mail_notifications": mailNotifications,
    "push_notifications": pushNotifications,
    "img": img,
    "company_name": companyName,
    "contact_first_name": contactFirstName,
    "contact_last_name": contactLastName,
    "contact_email": contactEmail,
    "phone_number": phoneNumber,
    "operation_hours": operationHours,
    "special_operation_hours": specialOperationHours == null ? null : specialOperationHours,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "description": description == null ? null : description,
    "average_rating": averageRating,
    "reviews": reviews,
    "service_type": serviceType,
    "service_icon": serviceIcon,
    "provider_id": providerId == null ? null : providerId,
    "booking_id": bookingId == null ? null : bookingId,
    "review_comment": reviewComment,
    "ratings": ratings == null ? null : ratings,
  };
}


