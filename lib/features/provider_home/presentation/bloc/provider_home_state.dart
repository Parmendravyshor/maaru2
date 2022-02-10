part of 'provider_home_bloc.dart';

@immutable
abstract class ProviderHomeState {}

class ProviderHomeInitial extends ProviderHomeState {}
class RegisterInProgress extends ProviderHomeState {
  RegisterInProgress() : super();

  @override
  String toString() => "RegisterInProgress";

}

class RegisterSuccess extends ProviderHomeState {
  RegisterSuccess() : super();

  @override
  String toString() => "RegisterSuccess";


}

class RegisterFailure extends ProviderHomeState {
  final String errorMessage;
  RegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "RegisterFailure";


}
class RequestLoaded extends ProviderHomeState {
  final GetProviderRequestModel getProviderRequestModel;
  RequestLoaded(this.getProviderRequestModel) : super();
  @override
  String toString() => "RegisterFailure";


}
class RegisterFormValidationSuccess extends ProviderHomeState {
  RegisterFormValidationSuccess() : super();

  @override
  String toString() => "RegisterFormValidationSuccess";

}
class AcceptRequestSuccessful extends ProviderHomeState{
  AcceptRequestSuccessful():super();
  @override
  String toString() =>'AcceptRequestSuccessful';
}
class DeclineRequestSuccessful extends ProviderHomeState{
  DeclineRequestSuccessful():super();
  @override
  String toString() =>'DeclineRequestSuccessful';
}