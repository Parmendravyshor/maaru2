/// Events class for Register screen
abstract class LoginEvent {
  LoginEvent();
}

/// Register Opened
///
/// This event is fired when register is opened
class LoginOpened extends LoginEvent {
  LoginOpened();

  @override
  String toString() => "LoginOpened";
}

class GetProvider extends LoginEvent {
  final String text;

  GetProvider(this.text);
}
class GetCustomers extends LoginEvent {
  GetCustomers();

  @override
  String toString() => "LoginButtonTapped";
}
/// Register Button Tapped
///
/// This event is fired when Register button is tapped
class LoginButtonTapped extends LoginEvent {
  LoginButtonTapped();

  @override
  String toString() => "LoginButtonTapped";
}

class ProviderLoginButtonTapped extends LoginEvent {
  ProviderLoginButtonTapped();

  @override
  String toString() => "ProviderLoginButtonTapped";
}

/// Email Changed
///
/// This event is fired when Email is changed
class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);

  @override
  String toString() => "EmailChanged";
}

/// Password Changed
///
/// This event is fired when password is changed
class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);

  @override
  String toString() => "PasswordChanged";
}


// class GetCovidList extends LoginEvent {
//   final String text;
//
//   GetCovidList(this.text);
//   @override
//   String toString() => "fakeRegisterButtonTapped";
// }
