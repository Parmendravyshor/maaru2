part of 'pet_profile_bloc.dart';

@immutable
abstract class PetProfileState {}

class PetProfileInitial extends PetProfileState {}

class ResgiterInitial extends PetProfileState {
  ResgiterInitial() : super();

  @override
  String toString() => "ResgiterInitial";

}

class RegisterInProgress extends PetProfileState {
  RegisterInProgress() : super();

  @override
  String toString() => "RegisterInProgress";

}

class RegisterSuccess extends PetProfileState {
  RegisterSuccess() : super();

  @override
  String toString() => "RegisterSuccess";


}

class RegisterFailure extends PetProfileState {
  final String errorMessage;
  RegisterFailure(this.errorMessage) : super();
  @override
  String toString() => "RegisterFailure";


}

class RegisterFormValidationSuccess extends PetProfileState {
  RegisterFormValidationSuccess() : super();

  @override
  String toString() => "RegisterFormValidationSuccess";

}
class RegisterFormValidationFailure extends PetProfileState {
  RegisterFormValidationFailure() : super();

  @override
  String toString() => "RegisterFormValidationFailure";


}