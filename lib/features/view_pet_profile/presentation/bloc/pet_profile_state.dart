part of 'pet_profile_bloc.dart';

abstract class PetProfileState {
  PetProfileState();
}

class PetProfileInitial extends PetProfileState {
  PetProfileInitial() : super();
  @override
  String toString() => 'PetProfileInitial';
}
