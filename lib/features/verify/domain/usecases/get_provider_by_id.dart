import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'get_providers.dart';
import 'dart:convert';
class GetProviderById implements UseCase<void, int> {
  UserRepository userRepository;
  GetProviderById(this.userRepository);
  @override
  Future<Either<Failure, Welcome4>> call(int id1) async {
    return userRepository.getProviderById(id1);
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


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome4 {
  Welcome4({
    this.providerDetails,
    this.reviews,
    this.masterServices,
    this.reviewCount,
    this.fiveStarView,
    this.average,
  });

  ProviderDetails providerDetails;
  List<Review> reviews;
  List<MasterServiceElement> masterServices;
  int reviewCount;
  int fiveStarView;
  String average;

  factory Welcome4.fromJson(Map<String, dynamic> json) => Welcome4(
    providerDetails: ProviderDetails.fromJson(json["provider_details"]),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    masterServices: List<MasterServiceElement>.from(json["master_services"].map((x) => MasterServiceElement.fromJson(x))),
    reviewCount: json["review_count"],
    fiveStarView: json["five_Star_View"],
    average: json["average"],
  );

  Map<String, dynamic> toJson() => {
    "provider_details": providerDetails.toJson(),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "master_services": List<dynamic>.from(masterServices.map((x) => x.toJson())),
    "review_count": reviewCount,
    "five_Star_View": fiveStarView,
    "average": average,
  };
}

class MasterServiceElement {
  MasterServiceElement({
    this.serviceIcon,
    this.id,
    this.serviceType,
    this.createdAt,
    this.updatedAt,
  });

  String serviceIcon;
  int id;
  String serviceType;
  DateTime createdAt;
  DateTime updatedAt;

  factory MasterServiceElement.fromJson(Map<String, dynamic> json) => MasterServiceElement(
    serviceIcon: json["service_icon"],
    id: json["id"],
    serviceType: json["service_type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "service_icon": serviceIcon,
    "id": id,
    "service_type": serviceType,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class ProviderDetails {
  ProviderDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.userType,
    this.email,
    this.token,
    this.password,
    this.deviceToken,
    this.deviceType,
    this.otp,
    this.isVerified,
    this.mailNotifications,
    this.pushNotifications,
    this.createdAt,
    this.updatedAt,
    this.provider,
    this.service,
  });

  int id;
  String firstName;
  String lastName;
  String userType;
  String email;
  dynamic token;
  String password;
  String deviceToken;
  dynamic deviceType;
  String otp;
  String isVerified;
  int mailNotifications;
  int pushNotifications;
  DateTime createdAt;
  DateTime updatedAt;
  Provider provider;
  List<ProviderDetailsService> service;

  factory ProviderDetails.fromJson(Map<String, dynamic> json) => ProviderDetails(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userType: json["user_type"],
    email: json["email"],
    token: json["token"],
    password: json["password"],
    deviceToken: json["device_token"],
    deviceType: json["device_type"],
    otp: json["otp"],
    isVerified: json["is_verified"],
    mailNotifications: json["mail_notifications"],
    pushNotifications: json["push_notifications"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    provider: Provider.fromJson(json["provider"]),
    service: List<ProviderDetailsService>.from(json["service"].map((x) => ProviderDetailsService.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_type": userType,
    "email": email,
    "token": token,
    "password": password,
    "device_token": deviceToken,
    "device_type": deviceType,
    "otp": otp,
    "is_verified": isVerified,
    "mail_notifications": mailNotifications,
    "push_notifications": pushNotifications,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "provider": provider.toJson(),
    "service": List<dynamic>.from(service.map((x) => x.toJson())),
  };
}

class Provider {
  Provider({
    this.img,
    this.id,
    this.userId,
    this.companyName,
    this.contactFirstName,
    this.contactLastName,
    this.contactEmail,
    this.phoneNumber,
    this.city,
    this.state,
    this.zipCode,
    this.longitude,
    this.latitude,
    this.description,
    this.operationHours,
    this.specialOperationHours,
    this.averageRating,
    this.reviews,
    this.createdAt,
    this.updatedAt,
  });

  String img;
  int id;
  int userId;
  String companyName;
  String contactFirstName;
  String contactLastName;
  String contactEmail;
  String phoneNumber;
  String city;
  String state;
  int zipCode;
  dynamic longitude;
  dynamic latitude;
  String description;
  String operationHours;
  dynamic specialOperationHours;
  String averageRating;
  String reviews;
  DateTime createdAt;
  DateTime updatedAt;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    img: json["img"],
    id: json["id"],
    userId: json["user_id"],
    companyName: json["company_name"],
    contactFirstName: json["contact_first_name"],
    contactLastName: json["contact_last_name"],
    contactEmail: json["contact_email"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    description: json["description"],
    operationHours: json["operation_hours"],
    specialOperationHours: json["special_operation_hours"],
    averageRating: json["average_rating"],
    reviews: json["reviews"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "id": id,
    "user_id": userId,
    "company_name": companyName,
    "contact_first_name": contactFirstName,
    "contact_last_name": contactLastName,
    "contact_email": contactEmail,
    "phone_number": phoneNumber,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "longitude": longitude,
    "latitude": latitude,
    "description": description,
    "operation_hours": operationHours,
    "special_operation_hours": specialOperationHours,
    "average_rating": averageRating,
    "reviews": reviews,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class ProviderDetailsService {
  ProviderDetailsService({
    this.id,
    this.serviceId,
    this.userId,
    this.providerName,
    this.serviceCost,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int id;
  int serviceId;
  int userId;
  String providerName;
  int serviceCost;
  DateTime createdAt;
  DateTime updatedAt;
  MasterServiceElement service;

  factory ProviderDetailsService.fromJson(Map<String, dynamic> json) => ProviderDetailsService(
    id: json["id"],
    serviceId: json["service_id"],
    userId: json["user_id"],
    providerName: json["provider_name"],
    serviceCost: json["service_cost"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    service: MasterServiceElement.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "user_id": userId,
    "provider_name": providerName,
    "service_cost": serviceCost,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "service": service.toJson(),
  };
}

class Review {
  Review({
    this.id,
    this.userId,
    this.providerId,
    this.bookingId,
    this.serviceId,
    this.reviewComment,
    this.ratings,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int providerId;
  int bookingId;
  int serviceId;
  String reviewComment;
  int ratings;
  DateTime createdAt;
  DateTime updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["user_id"],
    providerId: json["provider_id"],
    bookingId: json["booking_id"],
    serviceId: json["service_id"],
    reviewComment: json["review_comment"],
    ratings: json["ratings"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "provider_id": providerId,
    "booking_id": bookingId,
    "service_id": serviceId,
    "review_comment": reviewComment,
    "ratings": ratings,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

