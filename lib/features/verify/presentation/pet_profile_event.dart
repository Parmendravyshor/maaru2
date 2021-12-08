part of 'pet_profile_bloc.dart';

abstract class PetProfileEvent {}

class PetProfileRegistered extends PetProfileEvent {
  PetProfileRegistered();

  @override
  String toString() => "PetProfileRegistered";
}

class createPetProfile extends PetProfileEvent {
  createPetProfile();

  @override
  String toString() => "createPetProfile";
}
class ProfileOpened extends PetProfileEvent {
  ProfileOpened();

  @override
  String toString() => "ProfileOpened";
}
class GetProfileOpened extends PetProfileEvent {
  GetProfileOpened();

  @override
  String toString() => "GetProfileOpened";
}
class ChangePasswordOpened extends PetProfileEvent {
  ChangePasswordOpened();

  @override
  String toString() => "ChangePasswordOpened";
}
class savePetProfile extends PetProfileEvent {

  savePetProfile(this.message);
  final String message;
  @override
  String toString() => "savePetProfile";
}
class getPetProfile extends PetProfileEvent {

  getPetProfile(this.message);
  final String message;
  @override
  String toString() => "getPetProfile";
}
class profileImageChanged extends PetProfileEvent {
  final String img;
  profileImageChanged(this.img);

  @override
  String toString() => "profileImageChanged";
}
class KnowAllergies extends PetProfileEvent {
  final String allergies;
  KnowAllergies(this.allergies);

  @override
  String toString() => "KnowAllergies";
}
class BirthDate extends PetProfileEvent {
  String birthdate;
  BirthDate({this.birthdate}); //add this line
  @override
  List<Object> get props => [birthdate];
  @override
  String toString() => "ResgiterInitial{$birthdate}";

}

class AgeChanged extends PetProfileEvent {

  final String age;
  AgeChanged(this.age);

  @override
  String toString() => "AgeChanged";
}
class petNameChanged extends PetProfileEvent {
  final String petname;

  petNameChanged(this.petname);

  @override
  String toString() => "petNameChanged";
}
class SexChanged extends PetProfileEvent {
  final String sex;

  SexChanged(this.sex);

  @override
  String toString() => "SexChanged";
}
class HeightChanged extends PetProfileEvent {
  final  String hight;

  HeightChanged(this.hight);
  List<Object> get props => [
    hight,

  ];

  @override
  String toString() => "HeightChanged";

}
class BirthChanged extends PetProfileEvent {
   final selectedDate;

   BirthChanged(this.selectedDate);

   @override
  String toString() => "BirthChanged";

}

class BreadChanged extends PetProfileEvent {
   var breadtype;

  BreadChanged(this.breadtype);

  @override
  String toString() => "BirthChanged";
}
class WidthChanged extends PetProfileEvent {
  final String width;

  WidthChanged(this.width);

  @override
  String toString() => "WidthChanged";
}

class RegisterButtonTapped extends PetProfileEvent {
  RegisterButtonTapped();

  @override
  String toString() => "RegisterButtonTapped";


}
class fakeRegisterButtonTapped extends PetProfileEvent {
  fakeRegisterButtonTapped();

  @override
  String toString() => "fakeRegisterButtonTapped";


}
class Profile3 extends PetProfileEvent {
  final String walking;
  final String feeding;
  final String temprament;
  final String medication;
  final String name;
  final String times;
  final String notes;
  Profile3(this.walking, this.feeding, this.temprament, this.medication, this.name, this.times, this.notes,);

  @override
  String toString() => "SubmitProfileTapped";
}
class RegisterUser extends PetProfileEvent {
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
class savePayment extends PetProfileEvent {
  final String nameOnCard;
  final String creditCardNumber;
  final String expDate;
  final String cvv;
  savePayment(this.nameOnCard, this.creditCardNumber, this.expDate, this.cvv);

  @override
  String toString() => "savePayment";
}
class ChangePassword extends PetProfileEvent {
  final String oldPassword;
  final String newPasword;

  ChangePassword(this.newPasword,this.oldPassword);

  @override
  String toString() => "SubmitProfileTapped";
}