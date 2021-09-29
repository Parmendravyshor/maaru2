part of 'pet_profile_bloc.dart';

abstract class PetProfileEvent {
  PetProfileEvent();
}

class IconButtonClicked extends PetProfileEvent {
  IconButtonClicked();

  @override
  String toString() => 'IconButtonClicked';
}

class ProfileButtonClicked extends PetProfileEvent {
  ProfileButtonClicked();
  @override
  String toString() => 'ProfileButtonClicked';
}
