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
  profileImageChanged();

  @override
  String toString() => "profileImageChanged";
}

class CreateProfileVerified extends PetProfileEvent {
  CreateProfileVerified({
      this.profileImage,
      this.gender,
      this.petName,
      this.providerName,
      this.petVaccine,
      this.uploadVaccineRecord,
      this.walkingSchedule,
      this.feedingSchedule,
      this.temperament,
      this.medication,
      this.notes,
      this.age,
      this.grooming,
      this.vet,
      this.hotel,
      this.walking,
      this.dayCare,
      this.hospital,
      this.breadType,
      this.height,
      this.weight,
      this.birthDate,
      this.sex,
      this.addMoreVaccine});
  final String profileImage;
  final String gender;
  final String petName;
  final String providerName;
  final String petVaccine;
  final String uploadVaccineRecord;
  final String walkingSchedule;
  final String feedingSchedule;
  final String temperament;
  final String medication;
  final String notes;
  final String age;
  final String grooming;
  final String vet;
  final String hotel;
  final String walking;
  final String dayCare;
  final String hospital;
  final String breadType;
  final String height;
  final String weight;
  final String birthDate;
  final String sex;

  final String addMoreVaccine;

  @override
  String toString() => "PetProfileRegistered";
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
  final String hight;

  HeightChanged(this.hight);

  @override
  String toString() => "HeightChanged";
}
class BirthChanged extends PetProfileEvent {
  final String birthdate;

  BirthChanged(this.birthdate);

  @override
  String toString() => "BirthChanged";
}
class BreadChanged extends PetProfileEvent {
  final String breadtype;

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