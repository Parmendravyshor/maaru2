part of 'pet_profile_bloc.dart';

@immutable
abstract class PetProfileState {}

class PetProfileInitial extends PetProfileState {}

class ResgiterInitial extends PetProfileState {
  ResgiterInitial() : super();

  @override
  String toString() => "ResgiterInitial";

}
class UpdatedBirthDate extends PetProfileState {
  String birthdate;



  UpdatedBirthDate({this.birthdate});
 //add this line
  @override
  List<Object> get props => [birthdate];
  @override
  String toString() => "ResgiterInitial{$birthdate}";

  }

//CounterState._();
//
//   CounterState({this.counter}); //add this line
//
//   factory CounterState.initial() {
//     return CounterState._()..counter = 0;//
class RegisterInProgress extends PetProfileState {
  RegisterInProgress() : super();

  @override
  String toString() => "RegisterInProgress";

}
class UserPetProfileButtonTapped extends PetProfileState {
  UserPetProfileButtonTapped() : super();

  @override
  String toString() => "UserPetProfileButtonTapped";

}
class pet3rofileButtonTapped extends PetProfileState {
  pet3rofileButtonTapped() : super();

  @override
  String toString() => "pet3rofileButtonTapped";

}
class UserChangePasswordButtonTapped extends PetProfileState {
  UserChangePasswordButtonTapped() : super();

  @override
  String toString() => "UserPetProfileButtonTapped";

}
class SavePaymentButtonTapped extends PetProfileState {
  SavePaymentButtonTapped() : super();

  @override
  String toString() => "SavePaymentButtonTapped";

}
class PetRegisterSuccess extends PetProfileState {
  PetRegisterSuccess() : super();

  @override
  String toString() => "PetRegisterSuccess";


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