part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentEvent {}
class dateChanged extends BookAppointmentEvent {
  final String date;
  final String time;
  dateChanged(this.date,this.time);

  @override
  String toString() => "dateChanged";
  List<Object> get props => [date,time];
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
class PostREviewAfterBooking extends BookAppointmentEvent {

  PostREviewAfterBooking(this.provider_id, this.comment, this.bookingid, this.rating);
final String provider_id;
final String comment;
final String  bookingid;
final String rating;
  @override
  String toString() => "PostREviewAfterBooking";


}

class DeclineRequestChanged extends BookAppointmentEvent {
final String text;
final String date;

  DeclineRequestChanged(this.text, this.date);
  @override
  String toString() => "UpcomingAppointmentChanged";


}
class UpcomingAppointmentChanged extends BookAppointmentEvent {
  final String Date;
  final String name;
  UpcomingAppointmentChanged(
      this.Date, this.name);

  @override
  String toString() => "UpcomingAppointmentChanged";
}