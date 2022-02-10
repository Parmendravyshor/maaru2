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

GetProvidersModel welcomeFromJson(String str) => GetProvidersModel.fromJson(json.decode(str));

String welcomeToJson(GetProvidersModel data) => json.encode(data.toJson());

class GetProvidersModel {
  GetProvidersModel({
    this.providersListing,
    this.taxInPercentage,
    this.count,
    this.pages,
  });

  List<ProvidersListing> providersListing;
  String taxInPercentage;
  int count;
  int pages;

  factory GetProvidersModel.fromJson(Map<String, dynamic> json) => GetProvidersModel(
    providersListing: List<ProvidersListing>.from(json["providers_listing"].map((x) => ProvidersListing.fromJson(x))),
    taxInPercentage: json["tax_in_percentage"],
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "providers_listing": List<dynamic>.from(providersListing.map((x) => x.toJson())),
    "tax_in_percentage": taxInPercentage,
    "count": count,
    "pages": pages,
  };
}

class ProvidersListing {
  ProvidersListing({
    this.serviceType,
    this.serviceIcon,
    this.img,
    this.companyName,
    this.reviews,
    this.averageRating,
    this.totalAmount,
    this.providerServiceId,
    this.id,
  });

  String serviceType;
  String serviceIcon;
  String img;
  String companyName;
  String reviews;
  String averageRating;
  String totalAmount;
  int providerServiceId;
int id;
  factory ProvidersListing.fromJson(Map<String, dynamic> json) => ProvidersListing(
    serviceType: json["service_type"],
    serviceIcon: json["service_icon"],
    img: json["img"],
    id: json['user_id'],
    companyName: json["company_name"],
    reviews: json["reviews"],
    averageRating: json["average_rating"],
    totalAmount: json["total_amount"],
    providerServiceId: json["provider_service_id"],
  );

  Map<String, dynamic> toJson() => {
    'user_id':id,
    "service_type": serviceType,
    "service_icon": serviceIcon,
    "img": img,
    "company_name": companyName,
    "reviews": reviews,
    "average_rating": averageRating,
    "total_amount": totalAmount,
    "provider_service_id": providerServiceId,
  };
}
