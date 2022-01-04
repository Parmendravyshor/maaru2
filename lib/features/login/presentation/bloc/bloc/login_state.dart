import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';

abstract class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {
  LoginInitial() : super();

  @override
  String toString() => "LoginInitial";
}
// class CovidLoaded3 extends LoginState {
//   //final Welcome _newsBloc = Welcome();
//   final Welcome covidModel;
//   CovidLoaded3(this.covidModel);
//
//   List<Object> get props => [covidModel];
// }
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
class ProviderLoaded1 extends LoginState {
  //final Welcome _newsBloc = Welcome();
  final GetProvidersModel getProviderModel;
  ProviderLoaded1(this.getProviderModel);

  @override
  String toString() => "VerificationNeeded";
}
class FetchUpcomingAppointmentModelData extends LoginState {
  final UpcomingPastAppointmentModel upcomingPastAppointmentModel;
  FetchUpcomingAppointmentModelData(this.upcomingPastAppointmentModel);

  @override
  String toString() => "FetchUpcomingAppointmentModelData";
}
class VerificationNeeded extends LoginState {
  VerificationNeeded() : super();

  @override
  String toString() => "VerificationNeeded";

}

class CovidLoading extends LoginState {
  CovidLoading();
  @override
  List<Object> get props => null;
}

class CovidLoaded extends LoginState {
  //final Welcome _newsBloc = Welcome();
  final Welcome covidModel;
  CovidLoaded(this.covidModel);
  List<Object> get props => [covidModel];
}

class CovidError extends LoginState {
  final String message;
  CovidError(this.message);
  @override
  List<Object> get props => [message];
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
