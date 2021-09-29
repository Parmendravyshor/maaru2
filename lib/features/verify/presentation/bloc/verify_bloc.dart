// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/domain/usecases/email_auth_params.dart';
// import '../../../../core/domain/usecases/resend_verification_code.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../../../login/domain/usecases/emailsignin.dart';
// import '../../domain/usecases/create_pet_profile.dart';
// import '../../domain/usecases/save_pet_profile.dart';
// import '../../domain/usecases/verify_code.dart';
// import 'verify_event.dart';
// import 'verify_state.dart';
// //import 'package:fluttertoast/fluttertoast.dart';
//
// /// Bloc for Register page
// ///
// class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
//   final ResendCode _resendCode;
//   final VerifyCode _verifyCode;
//   final EmailSignin emailSignin;
//   final SavePetProfile savePetProfile;
//   final CreatePetProfile createProfile;
//
//   VerifyBloc(this._resendCode, this._verifyCode, this.emailSignin,
//       this.savePetProfile, this.createProfile)
//       : super(VerifyInitial());
//
//   @override
//   Stream<VerifyState> mapEventToState(VerifyEvent event) async* {
//     if (event is CodeEntered) {
//       yield VerifyOtpInProgress();
//       final res = await _verifyCode(VerifyParams(event.code, event.email));
//       if (res.isRight()) {
//         final result = await emailSignin(EmailAuthParams(
//             email: event.email,
//             password: event.password,
//             fName: "",
//             lName: ""));
//         if (result.isRight()) {
//           final create = await createProfile(NoParams());
//           if (create.isRight()) {
//             await savePetProfile(PetProfileParams(
//               profileImage: '',
//               gender: '',
//               petName: '',
//               breadType: '',
//               height: '',
//               weight: '',
//               birthDate: '',
//               sex: '',
//               petVaccine: '',
//               addMoreVaccine: '',
//             ));
//           }
//           yield VerifyOtpSuccess();
//         } else {
//           yield VerifyOtpFailure(
//               "Something wrong happened..please try again later");
//         }
//       } else {
//         yield VerifyOtpFailure("Invalid OTP code");
//       }
//     } else if (event is ResendButtonTapped) {
//       yield ResendOtpInProgress();
//       final res = await _resendCode(event.email);
//       if (res.isRight()) {
//         yield ResendOtpSuccess();
//       } else {
//         yield ResendOtpFailure("Resend OTP failed.. please try again later");
//       }
//     }
//   }
// }
