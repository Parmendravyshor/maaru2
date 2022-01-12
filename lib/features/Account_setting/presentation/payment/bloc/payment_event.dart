part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}
class GetUserPayment extends PaymentEvent {
  GetUserPayment();

  @override
  String toString() => "GetUserPayment";
}
class savePayment extends PaymentEvent {
  final String nameOnCard;
  final String creditCardNumber;
  final String expDate;
  final String cvv;
  savePayment(this.nameOnCard, this.creditCardNumber, this.expDate, this.cvv);

  @override
  String toString() => "savePayment";
}
class Dopaymentforuser extends PaymentEvent {
  final String accountNumber;
  final String exp_month;
  final String exp_year;
  final String cvc;
  final String amount;
  final String description;
  Dopaymentforuser(this.accountNumber, this.exp_month, this.exp_year, this.cvc, this.amount, this.description);

  @override
  String toString() => "savePayment";
}