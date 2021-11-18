abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial() : super();

  @override
  String toString() => "LoginInitial";
}

class LoginInProgress extends LoginState {
  LoginInProgress() : super();

  @override
  String toString() => "LoginInProgress";
}

class LoginSuccess extends LoginState {
  LoginSuccess() : super();

  @override
  String toString() => "LoginSuccess";
}

class VerificationNeeded extends LoginState {
  VerificationNeeded() : super();

  @override
  String toString() => "VerificationNeeded";
}

class LoginFailure extends LoginState {
  final String errorMessage;

   LoginFailure( this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'LoginFailure { error: $errorMessage }';
}

class LoginFormValidationSuccess extends LoginState {
  LoginFormValidationSuccess() : super();

  @override
  String toString() => "LoginFormValidationSuccess";
}

class LoginFormValidationFailure extends LoginState {
  LoginFormValidationFailure() : super();

  @override
  String toString() => "LoginFormValidationFailure";
}
