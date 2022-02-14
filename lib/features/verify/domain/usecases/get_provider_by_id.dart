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
Welcome4 welcome4FromJson(String str) => Welcome4.fromJson(json.decode(str));

String welcome4ToJson(Welcome4 data) => json.encode(data.toJson());

class Welcome4 {
  Welcome4({
    this.providerDetails,
    this.reviews,
    this.masterServices,
    this.reviewCount,
    this.fiveStarView,
    this.average,
    this.tax,
  });

  ProviderDetails providerDetails;
  List<dynamic> reviews;
  List<MasterServiceElement> masterServices;
  int reviewCount;
  int fiveStarView;
  String average;
  String tax;

  factory Welcome4.fromJson(Map<String, dynamic> json) => Welcome4(
    providerDetails: ProviderDetails.fromJson(json["provider_details"]),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    masterServices: List<MasterServiceElement>.from(json["master_services"].map((x) => MasterServiceElement.fromJson(x))),
    reviewCount: json["review_count"],
    fiveStarView: json["five_Star_View"],
    average: json["average"],
    tax: json["tax"],
  );

  Map<String, dynamic> toJson() => {
    "provider_details": providerDetails.toJson(),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "master_services": List<dynamic>.from(masterServices.map((x) => x.toJson())),
    "review_count": reviewCount,
    "five_Star_View": fiveStarView,
    "average": average,
    "tax": tax,
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
  String token;
  String password;
  String deviceToken;
  String deviceType;
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
    this.operationHours,
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
    this.providerOperationHours,
    this.specialOperationHours,
    this.averageRating,
    this.reviews,
    this.createdAt,
    this.updatedAt,
  });

  String img;
  OperationHours operationHours;
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
  String longitude;
  String latitude;
  dynamic description;
  String providerOperationHours;
  String specialOperationHours;
  String averageRating;
  String reviews;
  DateTime createdAt;
  DateTime updatedAt;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    img: json["img"],
    operationHours: OperationHours.fromJson(json["operationHours"]),
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
    providerOperationHours: json["operation_hours"],
    specialOperationHours: json["special_operation_hours"],
    averageRating: json["average_rating"],
    reviews: json["reviews"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "operationHours": operationHours.toJson(),
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
    "operation_hours": providerOperationHours,
    "special_operation_hours": specialOperationHours,
    "average_rating": averageRating,
    "reviews": reviews,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class OperationHours {
  OperationHours({
    this.week,
  });

  List<Week> week;

  factory OperationHours.fromJson(Map<String, dynamic> json) => OperationHours(
    week: List<Week>.from(json["week"].map((x) => Week.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "week": List<dynamic>.from(week.map((x) => x.toJson())),
  };
}

class Week {
  Week({
    this.day,
  });

  Day day;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    day: Day.fromJson(json["day"]),
  );

  Map<String, dynamic> toJson() => {
    "day": day.toJson(),
  };
}

class Day {
  Day({
    this.name,
    this.status,
    this.startTime,
    this.endTime,
  });

  String name;
  bool status;
  String startTime;
  String endTime;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    name: json["name"],
    status: json["status"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "status": status,
    "start_time": startTime == null ? null : startTime,
    "end_time": endTime == null ? null : endTime,
  };
}

class ProviderDetailsService {
  ProviderDetailsService({
    this.totalAmountWithTax,
    this.id,
    this.serviceId,
    this.userId,
    this.providerName,
    this.serviceCost,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  double totalAmountWithTax;
  int id;
  int serviceId;
  int userId;
  String providerName;
  int serviceCost;
  DateTime createdAt;
  DateTime updatedAt;
  MasterServiceElement service;

  factory ProviderDetailsService.fromJson(Map<String, dynamic> json) => ProviderDetailsService(
    totalAmountWithTax: json["totalAmountWithTax"].toDouble(),
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
    "totalAmountWithTax": totalAmountWithTax,
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
