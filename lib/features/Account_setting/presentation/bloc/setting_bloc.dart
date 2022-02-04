import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:meta/meta.dart';
import 'package:maru/features/Account_setting/presentation/bloc/change_password_screen.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this.saveUserProfile, this._saveChangePassword);
  final SaveUserProfile saveUserProfile;
  final SaveChangePassword _saveChangePassword;
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  @override
  // TODO: implement initialState
  SettingState get initialState => SettingInitial();

  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async* {
    if (event is RegisterUser) {
      yield saveUserProfileLoading();
      UserProfileParams profileParams = UserProfileParams(
        email: _prefHelper.getEmail(),
        fname: event.fname,
        lname: event.lname,
        phone: event.phone,
        city: event.city,
        zipCode: event.zip,
        state: event.state,
      );
      final result = await saveUserProfile(profileParams);
      if (result.isRight()) {
        yield saveUserProfileSuccess('Profile Update Successful');
      } else {
        saveUserProfileFailure();
      }
    } else if (event is ChangePassword) {
      UserProfileParams profileParams = UserProfileParams(
        //email: sharedPrefHelper.getEmail(),
        oldPassword: event.oldPassword,
        NewPassword: event.newPasword,
      );
      final result = await _saveChangePassword(profileParams);
      if (result.isRight()) {
        yield UserChangePasswordButtonTapped();
      } else {
        yield UserChangePasswordButtonTappedFailure();
      }

    }
  }
}
