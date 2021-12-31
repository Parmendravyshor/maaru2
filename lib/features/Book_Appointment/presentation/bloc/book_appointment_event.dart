part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentEvent {}
class dateChanged extends BookAppointmentEvent {
  final String date;
  dateChanged(this.date);

  @override
  String toString() => "dateChanged";
  List<Object> get props => [date];
}
class PetIdChanged extends BookAppointmentEvent {
  final String petId;
  PetIdChanged(this.petId);

  @override
  String toString() => "PetIdChanged";
  List<Object> get props => [petId];
}
class providerIdChanged extends BookAppointmentEvent {
  final String providerid;
  providerIdChanged(this.providerid);

  @override
  String toString() => "providerIdChanged";
  List<Object> get props => [providerid];
}
class serviceIdChanged extends BookAppointmentEvent {
  final int serviceid;
  serviceIdChanged(this.serviceid);

  @override
  String toString() => "serviceid";
  List<Object> get props => [serviceid];
}
class BookRegisterButtonTapped extends BookAppointmentEvent {

  BookRegisterButtonTapped();

  @override
  String toString() => "BookRegisterButtonTapped";
  List<Object> get props => [BookRegisterButtonTapped];

}
class UpcomingAppointmentChanged extends BookAppointmentEvent {

  final String text;

  UpcomingAppointmentChanged({this.text});

  @override
  String toString() => "UpcomingAppointmentChanged";
  List<Object> get props => [text];

}