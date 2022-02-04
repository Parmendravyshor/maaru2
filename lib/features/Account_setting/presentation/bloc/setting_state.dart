part of 'setting_bloc.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}
class saveUserProfileSuccess extends SettingState{
  final String text;
  saveUserProfileSuccess(this.text):super();
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
class saveUserProfileLoading extends SettingState{
  saveUserProfileLoading():super();
  @override
  String toString() =>'saveUserProfileLoading';

}
class UserChangePasswordButtonTapped extends SettingState {
  UserChangePasswordButtonTapped() : super();

  @override
  String toString() => "UserPetProfileButtonTapped";

}
class UserChangePasswordButtonTappedFailure extends SettingState {
  UserChangePasswordButtonTappedFailure() : super();

  @override
  String toString() => "UserChangePasswordButtonTappedFailure";

}