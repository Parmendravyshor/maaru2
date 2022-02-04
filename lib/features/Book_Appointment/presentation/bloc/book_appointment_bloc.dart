import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/book_provider_cancel.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_decline_appointment_request.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/post_review.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:meta/meta.dart';
part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc
    extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookProvider bookProvider;
  final PostReview postREviewAfterBooking;
  final GetUpcomingAndPastAppointmentdddddd getUpcomingAndPastAppointments;
  final GetUpcomingPastAndDeclineAppointment
  getUpcomingPastAndDeclineAppointment;
  final BookProviderCancel bookProviderCancel;

  BookAppointmentBloc(this.bookProvider,
      this.getUpcomingPastAndDeclineAppointment,
      this.postREviewAfterBooking,
      this.bookProviderCancel,
      this.getUpcomingAndPastAppointments);

  @override
  // TODO: implement initialState
  BookAppointmentState get initialState => BookAppointmentInitial();
  var pet_id;
  var provider_id;
  var booking_date;
  var service_id;
  var cardno;
  var expdate;
  var cardHolderNAme;
  var bookingtime;
  var cvv;
  var cardid;

  @override
  Stream<BookAppointmentState> mapEventToState(
      BookAppointmentEvent event) async* {
    if (event is PetIdChanged) {
      if (event.petId != null) {
        pet_id = event.petId;
      } else {
        pet_id;
      }
      print('djdkdjd${booking_date}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is providerIdChanged) {
      if (event.providerid != null) {
        provider_id = event.providerid;
      } else {
        provider_id;
      }
      print('djdkdjd1${provider_id}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is dateChanged) {
      if (event.date.isNotEmpty) {
        booking_date = '${event.date}${event.time}';
      } else {
        booking_date;
        print('djdkdjd${booking_date}');
      }
      print(provider_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is serviceIdChanged) {
      if (event.serviceid != null) {
        service_id = event.serviceid;
      } else {
        service_id;
      }
      print('djdkdjd${booking_date}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is BookingTimeChaned) {
      if (event.BookingTime.isNotEmpty) {
        bookingtime = event.BookingTime;
      } else {
        bookingtime;
      }
      print('djdkdjd${bookingtime}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is CardHolderNameChanged) {
      if (event.cardHolderName.isNotEmpty) {
        cardHolderNAme = event.cardHolderName;
      } else {
        cardHolderNAme;
      }
      print('card holder name${cardHolderNAme}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is CardNumberChanged) {
      if (event.cardno != null) {
        cardno = event.cardno;
      } else {
        cardno;
      }
      print('djdkdjd${cardno}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is CvvIdChanged) {
      if (event.cvv.isNotEmpty) {
        cvv = event.cvv;
      } else {
        cvv;
      }
      print('djdkdjd${cvv}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is ExpDateChanged) {
      if (event.expDate.isNotEmpty) {
        expdate = event.expDate;
      } else {
        expdate;
      }
      print('djdkdjd${expdate}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is BookRegisterButtonTapped) {
      yield BookRegisterInProgress();
       print('check card $pet_id');
      final result = await bookProvider(
          BookProviderParams(
          pet_id: pet_id,
          provider_id: provider_id,
          booking_date: booking_date,
          service_id: service_id,
          cardno: cardno,
          expdate: expdate,
          cardHolderName: cardHolderNAme,
          bookingTime: bookingtime,
          cardId: cardid,
          cvv: cvv));
      yield* result.fold((l) async* {
        if (l is ServerFailure) {
          yield BookRegisterFailure("Signup failed..please try again.. $l");
        } else {
          yield BookRegisterFailure("Signup failed..please try again.. $l");
        }
      }, (r) async* {
        yield BookRegisterSuccess();
      });
      // yield* result.fold((l) async* {
      //
      // }, (r) async* {
      //   yield BookRegisterSuccess();
      // });
    } else if (event is PostREviewAfterBooking) {
      UserReviewParamsMOdel profileParams = UserReviewParamsMOdel(
        providerId: event.provider_id,
        bookingId: event.bookingid,
        Comment: event.comment,
        rating: event.rating,
      );
      final result = await postREviewAfterBooking(profileParams);
      yield RivewPostSuccess();
    } else if (event is DeclineRequestChanged) {
      final result = await getUpcomingPastAndDeclineAppointment(SearchParams(
        text1: event.text,
        date: event.date,
      ));
      yield GGetDeclineRequestData(result.getOrElse(() => null));
    }
     if (event is UpcomingAppointmentChanged) {
      print('djdfjlkfjf');
      final result = await getUpcomingAndPastAppointments(
          UpcomingBooking(
          bookingDate: event.av.toString(),
          serviceName: event.name.toString()));
print('singh find out ${event.av}');
      print('Tomer find out ${event.name}');
      if (result.isRight()) {
        print('djdfjlkfjf');
        yield FetchUpcomingAppointmentModelData(result.getOrElse(() => null));
        print('dddalfa');
      }

    }
  if (event is CancelbookedProvider) {
  final result = await bookProviderCancel.call(event.id1);
  if (result.isRight()) {
  yield CancelbookedProviderButtonTapped();
  }
  }
}
  bool _isFormValid() {
    return pet_id.isNotEmpty &&
        provider_id.isNotEmpty &&
        booking_date.isNotEmpty &&
        service_id.isNotEmpty &&
        bookingtime.isNotEmpty;
  }
}
