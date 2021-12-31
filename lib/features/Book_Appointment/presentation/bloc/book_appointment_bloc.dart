import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:meta/meta.dart';
part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  final BookProvider bookProvider;

  BookAppointmentBloc(this.bookProvider);

  @override
  // TODO: implement initialState
  BookAppointmentState get initialState => BookAppointmentInitial();
  var pet_id;
  var provider_id;
  var booking_date_time;
  var service_id;

  @override
  Stream<BookAppointmentState> mapEventToState(BookAppointmentEvent event) async* {
    if (event is PetIdChanged) {
      if (event.petId.isNotEmpty) {
        pet_id = event.petId;
      } else {
        pet_id;
      }
      print(pet_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    }

    else if (event is providerIdChanged) {
      if (event.providerid.isNotEmpty) {
        provider_id = event.providerid;
      } else {
        provider_id;
      }
      print(provider_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    }
    else if (event is dateChanged) {
      if (event.date.isNotEmpty) {
        booking_date_time = event.date;
      } else {
        booking_date_time;
      }
      print(provider_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    }

    else if (event is serviceIdChanged) {
      if (event.serviceid != null) {
        service_id = event.serviceid;
      } else {
        service_id;
      }
      print(service_id);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield BookRegisterFormValidationSuccess();
      } else {
        yield BookRegisterFormValidationFailure();
      }
    }
    else if (event is BookRegisterButtonTapped) {
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
    }
  }
  bool _isFormValid() {
    return pet_id.isNotEmpty &&
        provider_id.isNotEmpty &&
        booking_date_time.isNotEmpty &&
        service_id.isNotEmpty;
  }
}