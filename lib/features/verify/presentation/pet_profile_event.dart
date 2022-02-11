part of 'pet_profile_bloc.dart';

abstract class PetProfileEvent {
  PetProfileEvent();
}

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


class CreateRegisterPetProfile extends PetProfileEvent {
  final String image;
  final String gender;
  final String petName;
  final String breedType;
  final String age;
  final String height;
  final String width;
  final String birthdate;
  final String sex;
  final String notes;
  CreateRegisterPetProfile(this.image, this.gender, this.petName, this.breedType, this.age, this.height, this.width, this.birthdate, this.sex, this.notes);

  @override
  String toString() => "CreatePetRegisterButtonTapped";


}
class GetCovidList extends PetProfileEvent {
final String text;

    GetCovidList(this.text);
  @override
  String toString() => "fakeRegisterButtonTapped";
}
class GetProvider extends PetProfileEvent {

final String text;

  GetProvider(this.text);

  @override
  String toString() => "GetProvider";

}

class GetSinglePRof extends PetProfileEvent {
 final int id;

  GetSinglePRof(this.id);
}
class GetSinglePRovider extends PetProfileEvent {
  final int id1;

  GetSinglePRovider(this.id1);
  @override
  String toString() => "GetSinglePRovider";
}
class GetProviderBookingRequest extends PetProfileEvent {
  @override
  String toString() => "GetProviderBookingRequest";
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
  String toString() => "SubmitProfileTapped3";
}
class Profile4 extends PetProfileEvent {
  final String grooming;
  final String vet;
  final String walking;
  final String hotel;
  final String hospital;
  final String daycare;
  Profile4({this.grooming, this.vet, this.walking, this.hotel, this.hospital, this.daycare});


  @override
  String toString() => "SubmitProfileTapped4";
}
class Profile2 extends PetProfileEvent {
   var know_allergies;
   var vaccine;

  Profile2(this.know_allergies, this.vaccine);

  @override
  String toString() => "SubmitProfileTapped2";
}
class vaccineUplo extends PetProfileEvent {

  final vaccine;
  final id;

  vaccineUplo( this.vaccine,this.id);

  @override
  String toString() => "vaccineUplo";
}


