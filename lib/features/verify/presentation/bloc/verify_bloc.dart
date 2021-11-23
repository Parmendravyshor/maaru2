

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/domain/usecases/resend_verification_code.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/presentation/edit_profile_screen.dart';

import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:maru/features/verify/presentation/bloc/verify_event.dart';
import 'package:maru/features/verify/presentation/bloc/verify_state.dart';

///
class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final ResendCode _resendCode;
  final VerifyCode _verifyCode;
  final EmailSignin emailSignin;
  final SavePetProfile savePetProfile;
  final CreatePetProfile createProfile;

  VerifyBloc(this._resendCode, this._verifyCode, this.emailSignin, this.createProfile, this.savePetProfile,

  )
      : super();

  @override
  VerifyState get initialState => VerifyInitial();
  @override
  Stream<VerifyState> mapEventToState(VerifyEvent event) async* {
    if (event is CodeEntered) {
      yield VerifyOtpInProgress();
      final res = await _verifyCode(VerifyParams(event.code,event.email ));
      if (res.isRight()) {
        final result = await emailSignin(EmailAuthParams(
            email: event.email,
            password: event.password,
            first_name: "",
            lName: ""));
        if (result.isRight()) {
         //  final create = await createProfile(PetProfileParams());
         //  if (create.isRight()) {
         //    await savePetProfile(PetProfileParams(
         //   profileImage:'',
         //    gender:'',
         //    petName:'',
         //    providerName:'',
         //   petVaccine:'',
         //     uploadVaccineRecord:'',
         // walkingSchedule:'',
         //   feedingSchedule:'',
         //    temperament:'',
         //    medication:'',
         //   notes:'',
         //     age:'',
         //     grooming:'',
         //     vet:'',
         // hotel:'',
         //    walking:'',
         //   dayCare:'',
         //   hospital:'',
         //    breadType:'',
         //    height:'',
         //    weight:'',
         //    birthDate:'',
         //    sex:'',
         //
         //  addMoreVaccine:'',
         //    ));
         //  }
          yield VerifyOtpSuccess();
        } else {
          yield VerifyOtpFailure(
              "Something wrong happened..please try again later");
        }
      } else {
        yield VerifyOtpFailure("Invalid OTP code");
      }
    } else if (event is ResendButtonTapped) {
      yield ResendOtpInProgress();
      final res = await _resendCode(event.email);
      if (res.isRight()) {
        yield ResendOtpSuccess();
      } else {
        yield ResendOtpFailure("Resend OTP failed.. please try again later");
      }
    }
  }


}
