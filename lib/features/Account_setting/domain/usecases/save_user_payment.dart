import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:convert/convert.dart';
class SaveUserPayment extends UseCase<void, PaymentParams> {
  UserRepository userRepository;
  SaveUserPayment(this.userRepository);

  @override
  Future<Either<Failure, void>> call(PaymentParams params) {
    return userRepository.saveUserPayment(params);
  }
}
FetchCardDetailsModel welcomeFromJson(String str) => FetchCardDetailsModel.fromJson(json.decode(str));

String welcomeToJson(FetchCardDetailsModel data) => json.encode(data.toJson());

class FetchCardDetailsModel {
  FetchCardDetailsModel({
    this.getCardDetails,
  });

  List<PaymentParams> getCardDetails;

  factory FetchCardDetailsModel.fromJson(Map<String, dynamic> json) => FetchCardDetailsModel(
    getCardDetails: List<PaymentParams>.from(json["get_card_details"].map((x) => PaymentParams.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "get_card_details": List<dynamic>.from(getCardDetails.map((x) => x.toJson())),
  };
}

class PaymentParams {
  PaymentParams({
    this.id,
    this.userId,
    this.expirationDate,
    this.cardHolderName,
    this.cardNumber,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.amount,
    this.cvc,
    this.exp_month,
    this.exp_year
  });

  int id;
  int userId;
  String expirationDate;
  String cardHolderName;
  String cardNumber;
  String exp_month;
  String exp_year;
  String cvc;
  String amount;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentParams.fromJson(Map<String, dynamic> json) => PaymentParams(
    id: json["id"],
    userId: json["user_id"],
    expirationDate: json["expiration_date"],
    cardHolderName: json["card_holder_name"],
    cardNumber: json["card_number"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "expiration_date": expirationDate,
    "card_holder_name": cardHolderName,
    "card_number": cardNumber,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
//
// class PaymentParams {
//   final String nameOnCard;
//   final String bankname;
//   final String creditCardNumber;
//   final String expDate;
//   final String cvv;
//
//   PaymentParams(
//       {this.nameOnCard, this.creditCardNumber, this.expDate, this.cvv, this.bankname });
// }
