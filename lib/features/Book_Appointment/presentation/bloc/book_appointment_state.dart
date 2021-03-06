part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentState {}


class BookAppointmentInitial extends BookAppointmentState {
  BookAppointmentInitial(): super();

  @override
  String toString() => "BookAppointmentInitial";
}

class BookRegisterFailure extends BookAppointmentState {
  final String text;
  BookRegisterFailure(this.text) : super();

  @override
  String toString() => "BookRegisterFailure";

}

class BookRegisterInProgress extends BookAppointmentState {
  BookRegisterInProgress() : super();

  @override
  String toString() => "BookRegisterInProgress";

}

class GetBookingSuccesss extends BookAppointmentState {
  final Bookingsss bookingsss;
  GetBookingSuccesss(this.bookingsss) : super();

  @override
  String toString() => "GetBookingSuccesss";

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
class CancelbookedProviderButtonTapped extends BookAppointmentState{
  CancelbookedProviderButtonTapped() : super();

  @override
  String toString() => "BookRegisterSuccess";
}
class GGetDeclineRequestData extends BookAppointmentState {
  GGetDeclineRequestData(this.upcomingPastAppointmentModel) : super();
final GetAllAppointmentProvider upcomingPastAppointmentModel;
  @override
  String toString() => "GGetDeclineRequestData";


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
class FetchUpcomingAppointmentModelData extends BookAppointmentState {
  final UpcomingPastAppointmentModel upcomingPastAppointmentModel;
  FetchUpcomingAppointmentModelData(this.upcomingPastAppointmentModel);

  @override
  String toString() => "FetchUpcomingAppointmentModelData";
}