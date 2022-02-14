part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class GetUserPaymentModel extends PaymentState {
  //final Welcome _newsBloc = Welcome();
  final FetchCardDetailsModel fetchCardDetailsModel;
  GetUserPaymentModel(this.fetchCardDetailsModel);
  List<Object> get props => [fetchCardDetailsModel];

}
class SavePaymentButtonTapped extends PaymentState {
  SavePaymentButtonTapped() : super();

  @override
  String toString() => "SavePaymentButtonTapped";
}
class CheckOutPaymet extends PaymentState{
  CheckOutPaymet():super();
  @override
  String toString() => "SavePaymentButtonTapped";
}
