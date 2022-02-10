import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/do_payment.dart';
import 'package:maru/features/Account_setting/domain/usecases/get_user_payment.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:meta/meta.dart';
part 'payment_event.dart';
part 'payment_state.dart';
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetUSerPayment _getUSerPayment;
final SaveUserPayment _saveUserPayment;
final DoPayment _doPayment;
  PaymentBloc(this._getUSerPayment,this._saveUserPayment, this._doPayment);
  @override
  // TODO: implement initialState
  PaymentState get initialState => PaymentInitial();

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
     if (event is GetUserPayment) {
    final result = await _getUSerPayment(NoParams());
    if (result.isRight()) {
    } else {}
    yield GetUserPaymentModel(result.getOrElse(() => null));
    }
     else if (event is savePayment) {
       PaymentParams profileParams = PaymentParams(
         expirationDate: event.expDate,
         //    bankname: event,
         cardNumber: event.creditCardNumber,
         cardHolderName: event.nameOnCard,
       );
       print(event.expDate);
       final result = await _saveUserPayment(profileParams);
       if (result.isRight()) {
         print("Payment  Saved");
       } else {
         print("Payment faileddd");
       }
       yield SavePaymentButtonTapped();
     }
     else if (event is Dopaymentforuser) {
       PaymentParams profileParams = PaymentParams(
       cardNumber: event.accountNumber,
         exp_month: event.exp_month,
         exp_year: event.exp_year,
         cvc: event.cvc,
         amount: event.amount,
         description: event.description
       );
       print(event.amount);
       final result = await _doPayment(profileParams);
       if (result.isRight()) {
         print("Payment  Saved");
       } else {
         print("Payment faileddd");
       }
       yield CheckOutPaymet();
     }
  }
}
