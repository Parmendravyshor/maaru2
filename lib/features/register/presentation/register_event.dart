part of 'register_bloc.dart';

abstract class RegisterEvent  {

}
class RegisterOpened extends RegisterEvent {
  RegisterOpened();

  @override
  String toString() => "RegisterOpened";


}

/// Register Button Tapped
///
/// This event is fired when Register button is tapped
class RegisterButtonTapped extends RegisterEvent {

  RegisterButtonTapped();

  @override
  String toString() => "RegisterButtonTapped";
  List<Object> get props => [RegisterButtonTapped];

}
class ProviderRegisterButtonTapped extends RegisterEvent {

  ProviderRegisterButtonTapped();

  @override
  String toString() => "ProviderRegisterButtonTapped";
  List<Object> get props => [RegisterButtonTapped];

}
/// Name Changed
///
/// This event is fired when Name is changed
class FNameChanged extends RegisterEvent {
  final String name;
  FNameChanged(this.name);

  @override
  String toString() => "NameChanged";

  List<Object> get props => [name];
}

/// Name Changed
///
/// This event is fired when Name is changed
class LNameChanged extends RegisterEvent {
  final String name;
  LNameChanged(this.name);

  @override
  String toString() => "NameChanged";


}

/// Email Changed
///
/// This event is fired when Email is changed
class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged(this.email);

  @override
  String toString() => "EmailChanged";


}

/// Password Changed
///
/// This event is fired when password is changed
class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged(this.password);

  @override
  String toString() => "PasswordChanged";
}
class GoogleSignupButtonTapped extends RegisterEvent {
  GoogleSignupButtonTapped();
  @override
  String toString() => "GoogleSignupButtonTapped";
}
class FacebookSignupButtonTapped extends RegisterEvent {
  FacebookSignupButtonTapped();
  @override
  String toString() => "FacebookSignupButtonTapped";
}