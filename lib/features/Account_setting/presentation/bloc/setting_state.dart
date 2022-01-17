part of 'setting_bloc.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}
class saveUserProfileSuccess extends SettingState{
  saveUserProfileSuccess():super();
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
class saveUserProfileFailure extends SettingState{
  saveUserProfileFailure():super();
  @override
  String toString() =>'saveUserProfileFailure';

}
class UserChangePasswordButtonTapped extends SettingState {
  UserChangePasswordButtonTapped() : super();

  @override
  String toString() => "UserPetProfileButtonTapped";

}