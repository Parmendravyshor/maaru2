import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/core/usecases/usecase.dart';
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
  final GetUpcomingAndPastAppointments getUpcomingAndPastAppointments;
final GetUpcomingPastAndDeclineAppointment getUpcomingPastAndDeclineAppointment;
  BookAppointmentBloc(this.bookProvider,this.getUpcomingPastAndDeclineAppointment, this.postREviewAfterBooking, this.getUpcomingAndPastAppointments);

  @override
  // TODO: implement initialState
  BookAppointmentState get initialState => BookAppointmentInitial();
  var pet_id;
  var provider_id;
  var booking_date_time;
  var service_id;

  @override
  Stream<BookAppointmentState> mapEventToState(
      BookAppointmentEvent event) async* {
    if (event is PetIdChanged) {
      if (event.petId.isNotEmpty) {
        pet_id = event.petId;
      } else {
        pet_id;
      }
      print('djdkdjd${booking_date_time}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is providerIdChanged) {
      if (event.providerid.isNotEmpty) {
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
    } else if (event is dateChanged  ) {
      if (event.date.isNotEmpty) {
        booking_date_time = '${event.date}${event.time}';
      } else {
        booking_date_time;
        print('djdkdjd${booking_date_time}');
      }
      print(provider_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is serviceIdChanged ) {
      if (event.serviceid != null ) {
        service_id = event.serviceid;
      } else {
        service_id;
      }
      print('djdkdjd${booking_date_time}');
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    } else if (event is BookRegisterButtonTapped) {
      yield BookRegisterInProgress();
      final result = await bookProvider(BookProviderParams(
        pet_id: pet_id,
        provider_id: provider_id,
        booking_date_time: booking_date_time,
        service_id: service_id,
      ));
      yield* result.fold((l) async* {
        yield BookRegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
        yield BookRegisterSuccess();
      });
    } else if (event is PostREviewAfterBooking) {
      UserReviewParamsMOdel profileParams = UserReviewParamsMOdel(
        providerId: event.provider_id,
        bookingId: event.bookingid,
        Comment: event.comment,
        rating: event.rating,
      );
      final result = await postREviewAfterBooking(profileParams);
      yield RivewPostSuccess();
    }
    else if (event is DeclineRequestChanged) {
      final result = await getUpcomingPastAndDeclineAppointment(SearchParams(
        text1: event.text,
        date: event.date,
      ));
      yield GGetDeclineRequestData(result.getOrElse(() => null));
    }
    if (event is UpcomingAppointmentChanged) {
      final result = await getUpcomingAndPastAppointments.call(UpcomingBooking(
          bookingDate: DateTime.parse(event.Date),
          serviceName: event.name.toString()));


      // print('ddddd$event.text');
      if (result.isRight()) {
        yield FetchUpcomingAppointmentModelData(result.getOrElse(() => null));
      }
    }
  }

  bool _isFormValid() {
    return pet_id.isNotEmpty &&
        provider_id.isNotEmpty &&
        booking_date_time.isNotEmpty &&
        service_id.isNotEmpty;
  }
}
