part of 'setting_bloc.dart';


abstract class SettingEvent {}
class RegisterUser extends SettingEvent {
  final String fname;
  final String lname;
  final String phone;
  final String city;
  final String state;
  final String zip;
  RegisterUser(this.fname, this.lname, this.phone, this.city, this.zip,this.state);

  @override
  String toString() => "SubmitProfileTapped";
}

class ChangePassword extends SettingEvent {
  final String oldPassword;
  final String newPasword;

  ChangePassword(this.newPasword,this.oldPassword);

  @override
  String toString() => "SubmitProfileTapped";
}