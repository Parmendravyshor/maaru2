part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentEvent {}

class dateChanged extends BookAppointmentEvent {
  final String date;
  final String time;
  dateChanged(this.date, this.time);
  @override
  String toString() => "dateChanged";
  List<Object> get props => [date, time];
}

class PetIdChanged extends BookAppointmentEvent {
  final int petId;
  PetIdChanged(this.petId);

  @override
  String toString() => "PetIdChanged";
  List<Object> get props => [petId];
}

class providerIdChanged extends BookAppointmentEvent {
  final int providerid;
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

class CardNumberChanged extends BookAppointmentEvent {
  final String cardno;
  CardNumberChanged(this.cardno);
  @override
  String toString() {
    // TODO: implement toString
    return 'CardNumberChanged';
  }
}

class ExpDateChanged extends BookAppointmentEvent {
  final String expDate;
  ExpDateChanged(this.expDate);
  @override
  String toString() {
    // TODO: implement toString
    return 'ExpDateChanged';
  }
}

class CardHolderNameChanged extends BookAppointmentEvent {
  final String cardHolderName;
  CardHolderNameChanged(this.cardHolderName);
  @override
  String toString() {
    // TODO: implement toString
    return 'CardHolderNameChanged';
  }
}

class BookingTimeChaned extends BookAppointmentEvent {
  final String BookingTime;
  BookingTimeChaned(this.BookingTime);
  @override
  String toString() {
    // TODO: implement toString
    return 'BookingTimeChaned';
  }
}

class CardIdChanged extends BookAppointmentEvent {
  final int cardid;
  CardIdChanged(this.cardid);
  @override
  String toString() {
    // TODO: implement toString
    return 'CardIdChanged';
  }
}

class CvvIdChanged extends BookAppointmentEvent {
  final String cvv;
  CvvIdChanged(this.cvv);
  @override
  String toString() {
    // TODO: implement toString
    return 'CvvIdChanged';
  }
}

class BookRegisterButtonTapped extends BookAppointmentEvent {
  @override
  String toString() {
    return 'BookRegisterButtonTapped';
  }
}

class PostREviewAfterBooking extends BookAppointmentEvent {
  PostREviewAfterBooking(
      this.provider_id, this.comment, this.bookingid, this.rating);
  final String provider_id;
  final String comment;
  final String bookingid;
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
  UpcomingAppointmentChanged(this.Date, this.name);

  @override
  String toString() => "UpcomingAppointmentChanged";
}
