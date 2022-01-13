part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentState {}


class BookAppointmentInitial extends BookAppointmentState {
  BookAppointmentInitial(): super();

  @override
  String toString() => "BookAppointmentInitial";
}



class BookRegisterInProgress extends BookAppointmentState {
  BookRegisterInProgress() : super();

  @override
  String toString() => "BookRegisterInProgress";

}
class RivewPostSuccess extends BookAppointmentState {
  RivewPostSuccess() : super();

  @override
  String toString() => "BookRegisterInProgress";

}

class BookRegisterSuccess extends BookAppointmentState {
  BookRegisterSuccess() : super();

  @override
  String toString() => "BookRegisterSuccess";


}
class GGetDeclineRequestData extends BookAppointmentState {
  GGetDeclineRequestData(this.upcomingPastAppointmentModel) : super();
final UpcomingPastAppointmentModel upcomingPastAppointmentModel;
  @override
  String toString() => "GGetDeclineRequestData";


}
class BookRegisterFailure extends BookAppointmentState {
  final String errorMessage;
  BookRegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "BookRegisterFailure";


}

class BookRegisterFormValidationSuccess extends BookAppointmentState {
  BookRegisterFormValidationSuccess() : super();

  @override
  String toString() => "BookRegisterFormValidationSuccess";

}
class BookRegisterFormValidationFailure extends BookAppointmentState {
  BookRegisterFormValidationFailure() : super();

  @override
  String toString() => "BookRegisterFormValidationFailure";


}