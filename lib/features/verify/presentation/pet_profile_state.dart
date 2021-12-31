part of 'pet_profile_bloc.dart';

@immutable
abstract class PetProfileState {}

class PetProfileInitial extends PetProfileState {}

class ResgiterInitial extends PetProfileState {
  ResgiterInitial() : super();

  @override
  String toString() => "ResgiterInitial";

}
// class CovidLoading extends PetProfileState {
//    CovidLoading();
//   @override
//   List<Object> get props => null;
// }
// class CovidError extends PetProfileState {
//   CovidError();
//   @override
//   List<Object> get props => null;
// }
// class CovidLoaded extends PetProfileState {
//
//    CovidLoaded();
//   @override
//   List<Object> get props => [];
// }
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
class UsergetPetProfileButtonTapped extends PetProfileState {
  final PetProfile _petProfile;
   UsergetPetProfileButtonTapped(this._petProfile);
  @override
  List<Object> get props => [_petProfile];

}
class UserCreatePetProfileButtonTapped extends PetProfileState {
  UserCreatePetProfileButtonTapped() : super();

  @override
  String toString() => "UserCreatePetProfileButtonTapped";

}
class fakeUserPetProfileButtonTapped extends PetProfileState {
  fakeUserPetProfileButtonTapped() : super();

  @override
  String toString() => "fakeUserPetProfileButtonTapped";

}
class GetUserPetProfileButtonTapped extends PetProfileState {
  GetUserPetProfileButtonTapped() : super();

  @override
  String toString() => "GetUserPetProfileButtonTapped";

}
class pet3rofileButtonTapped extends PetProfileState {
  pet3rofileButtonTapped() : super();

  @override
  String toString() => "pet3rofileButtonTapped";

}
class pet4rofileButtonTapped extends PetProfileState {

  pet4rofileButtonTapped() : super();

  @override
  String toString() => "pet4rofileButtonTapped";

}
class UserChangePasswordButtonTapped extends PetProfileState {
  UserChangePasswordButtonTapped() : super();

  @override
  String toString() => "UserPetProfileButtonTapped";

}
class PetProfile2Saves extends PetProfileState {
  PetProfile2Saves() : super();

  @override
  String toString() => "PetProfile2Saves";

}
class PetVaccineSuccessfull extends PetProfileState {
  PetVaccineSuccessfull() : super();

  @override
  String toString() => "PetVaccineSuccessfull";

}
class CovidLoading extends PetProfileState {
   CovidLoading();
  @override
  List<Object> get props => null;
}

class CovidLoaded3 extends PetProfileState {
  //final Welcome _newsBloc = Welcome();
  final Welcome covidModel;
  CovidLoaded3(this.covidModel);

  List<Object> get props => [covidModel];
}
class ProviderLoaded extends PetProfileState {
  //final Welcome _newsBloc = Welcome();
  final GetProvidersModel getProviderModel;
  ProviderLoaded(this.getProviderModel);

  List<Object> get props => [getProviderModel];
}
class SingleProfileLoaded extends PetProfileState {
  //final Welcome _newsBloc = Welcome();
  final Welcome2 welcome2;
  SingleProfileLoaded(this.welcome2);
  List<Object> get props => [welcome2];

}
class SingleProviderLoaded extends PetProfileState {
  //final Welcome _newsBloc = Welcome();
  final Welcome4 welcome4;

  SingleProviderLoaded(this.welcome4);

  List<Object> get props => [Welcome4];

}
class CovidError extends PetProfileState {
  final String message;
   CovidError(this.message);
  @override
  List<Object> get props => [message];
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