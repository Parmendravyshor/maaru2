part of 'register_bloc.dart';

abstract class RegisterState {
   RegisterState();
}

class RegisterInitial extends RegisterState {
  RegisterInitial(): super();

  @override
  String toString() => "RegisterInitial";
}

class ResgiterInitial extends RegisterState {
  ResgiterInitial() : super();

  @override
  String toString() => "ResgiterInitial";

}

class RegisterInProgress extends RegisterState {
  RegisterInProgress() : super();

  @override
  String toString() => "RegisterInProgress";

}

class RegisterSuccess extends RegisterState {
  RegisterSuccess() : super();

  @override
  String toString() => "RegisterSuccess";


}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "RegisterFailure";


}

class RegisterFormValidationSuccess extends RegisterState {
  RegisterFormValidationSuccess() : super();

  @override
  String toString() => "RegisterFormValidationSuccess";

}
class RegisterFormValidationFailure extends RegisterState {
  RegisterFormValidationFailure() : super();

  @override
  String toString() => "RegisterFormValidationFailure";


}
class GoogleRegisterInProgress extends RegisterState {
  GoogleRegisterInProgress() : super();

  @override
  String toString() => "GoogleRegisterInProgress";

}

class GoogleRegisterSuccess extends RegisterState {
  GoogleRegisterSuccess() : super();

  @override
  String toString() => "GoogleRegisterSuccess";

}

class GoogleRegisterFailure extends RegisterState {
  final String errorMessage;
  GoogleRegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "GoogleRegisterFailure";


}
class fbRegisterInProgress extends RegisterState {
  fbRegisterInProgress() : super();

  @override
  String toString() => "fbRegisterInProgress";

}

class fbRegisterSuccess extends RegisterState {
  fbRegisterSuccess() : super();

  @override
  String toString() => "fbRegisterSuccess";

}

class fbRegisterFailure extends RegisterState {
  final String errorMessage;
  fbRegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "fbRegisterFailure";

}