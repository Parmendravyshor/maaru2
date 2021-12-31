import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import 'dart:convert';
class GetProviders implements UseCase<void, String> {
  UserRepository userRepository;
  GetProviders(this.userRepository);
  @override
  Future<Either<Failure, GetProvidersModel>> call( String text) async {
    print('getProvidera value $text');
    return userRepository.getProviders(text);

  }

}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



GetProvidersModel welcomeFromJson(String str) => GetProvidersModel.fromJson(json.decode(str));

String welcomeToJson(GetProvidersModel data) => json.encode(data.toJson());

class GetProvidersModel {
  GetProvidersModel({
    this.providersListing,
    this.count,
    this.pages,
  });

  List<ProvidersListing> providersListing;
  int count;
  int pages;

  factory GetProvidersModel.fromJson(Map<String, dynamic> json) => GetProvidersModel(
    providersListing: List<ProvidersListing>.from(json["providers_listing"].map((x) => ProvidersListing.fromJson(x))),
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "providers_listing": List<dynamic>.from(providersListing.map((x) => x.toJson())),
    "count": count,
    "pages": pages,
  };
}

class ProvidersListing {
  ProvidersListing({
    this.id,
    this.serviceId,
    this.userId,
    this.providerName,
    this.serviceCost,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
    this.serviceIcon,
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
    this.title
  });

  int id;
  int serviceId;
  int userId;
  var title;
  String providerName;
  int serviceCost;
  DateTime createdAt;
  DateTime updatedAt;
  String serviceType;
  String serviceIcon;
  String img;
  String companyName;
  String contactFirstName;
  String contactLastName;
  String contactEmail;
  String phoneNumber;
  String operationHours;
  dynamic specialOperationHours;
  String city;
  String state;
  int zipCode;
  dynamic longitude;
  dynamic latitude;
  String description;
  String averageRating;
  String reviews;

  factory ProvidersListing.fromJson(Map<String, dynamic> json) => ProvidersListing(
    id: json["id"],
    title: json['title'],
    serviceId: json["service_id"],
    userId: json["user_id"],
    providerName: json["provider_name"],
    serviceCost: json["service_cost"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    serviceType: json["service_type"],
    serviceIcon: json["service_icon"],
    img: json["img"],
    companyName: json["company_name"],
    contactFirstName: json["contact_first_name"],
    contactLastName: json["contact_last_name"],
    contactEmail: json["contact_email"],
    phoneNumber: json["phone_number"],
    operationHours: json["operation_hours"],
    specialOperationHours: json["special_operation_hours"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    description: json["description"],
    averageRating: json["average_rating"],
    reviews: json["reviews"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "user_id": userId,
    'title':title,
    "provider_name": providerName,
    "service_cost": serviceCost,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "service_type": serviceType,
    "service_icon": serviceIcon,
    "img": img,
    "company_name": companyName,
    "contact_first_name": contactFirstName,
    "contact_last_name": contactLastName,
    "contact_email": contactEmail,
    "phone_number": phoneNumber,
    "operation_hours": operationHours,
    "special_operation_hours": specialOperationHours,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "longitude": longitude,
    "latitude": latitude,
    "description": description,
    "average_rating": averageRating,
    "reviews": reviews,
  };
}
