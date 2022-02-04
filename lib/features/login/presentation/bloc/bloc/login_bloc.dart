import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/domain/usecases/resend_verification_code.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Home/domain/usecases/get_upcoming_appointment.dart';
import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_user.dart';
import 'package:maru/features/provider_login/domain/usecases/provider_email_login.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_review_request.dart';
import 'package:maru/features/verify/domain/usecases/get_single_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'login_event.dart';
import 'login_state.dart';
//import 'package:fluttertoast/fluttertoast.dart';

/// Bloc for Register page
///
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final EmailSignin _emailSignin;
  final ProviderEmailSignin _providerEmailSignin;
  final ResendCode _resendCode;

  final GetPetProfile getPetProfile1;
  final SaveUserProfile saveUserProfile;
  final GetProviders getProviders;
  final GetSinglePetProfile getSinglePetProfile;
  final GetPetProfile getPetProfile;
  final GetReview getReview;
  final GetProviderRequest getProviderRequest;
  final GetUsers getUsers;
  final GetProviderById getProviderById;
 // final GetUpcomingAndPastAppointments getUpcomingAndPastAppointments;

  String text;
  LoginBloc(
      this.getSinglePetProfile,
     // this.getUpcomingAndPastAppointments,
      this._emailSignin,
      this.getProviders,
      this.getReview,
      this.getProviderRequest,
      this.getProviderById,
      this.getPetProfile1,
      this._resendCode,
      this.saveUserProfile,
      this.getUsers,
      this._providerEmailSignin, this.getPetProfile)
      : super();
  String email = "";
  String password = "";

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      if (event.email.isNotEmpty && validateEmail(email) != null) {
        email = event.email;
      } else {
        email = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield LoginFormValidationSuccess();
      } else {
        yield LoginFormValidationFailure();
      }
    } else if (event is PasswordChanged) {
      if (event.password.isNotEmpty && event.password.length > 5) {
        password = event.password;
      } else {
        password = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield LoginFormValidationSuccess();
      } else {
        yield LoginFormValidationFailure();
      }
    } else if (event is LoginButtonTapped) {
      yield LoginInProgress();
      final result = await _emailSignin.call(EmailAuthParams(
          email: email, password: password, first_name: "Tes", lName: "Test"));
      yield* result.fold((l) async* {
        if (l is UserNotConfirmedFailure) {
          final res = await _resendCode(email);
          if (res.isRight()) {
            // final result =  await getPetProfile1(NoParams());
            if (result.isRight()) {
              await getPetProfile1(event.toString());
              yield VerificationNeeded();
            }
          } else {
            yield LoginFailure("Email or password not valid");
          }
        } else {
          yield LoginFailure("Email or password not valid");
        }
        //yield LoginFailure("Signin failed..please try again.. $l");
      }, (r) async* {
        await getPetProfile('');

        int text1;
        await getSinglePetProfile(text1);
        print("RAKA===============================================");
        print(result);
        print("RAKA===============================================");
//await getPetProfile1(NoParams());
//await getUpcomingAppointment(NoParams());
//await getProviders(NoParams());
//await getReview(NoParams());
        // else if (event is RegisterButtonTapped) {
        // yield RegisterInProgress();
        // final result =
        await saveUserProfile(UserProfileParams(
          city: '',
          zipCode: '',
          password: '',
          state: '',
          profileImage: '',
          phone: '',
        ));
        // yield* result.fold((l) async* {
        // yield RegisterFailure("Profile failed..please try again.. $l");
        // }, (r) async* {
        // /// step = 2;
        // yield RegisterSuccess();
        // });
        // }
        await getSinglePetProfile(text1);
        yield LoginSuccess();
      });
    }
    // if (event is GetCovidList) {
    //   final result = await getPetProfile(NoParams());
    //
    //   // final result =  await getPetProfile1(NoParams());
    //   if (result.isRight()) {
    //     // await getPetProfile1(NoParams());
    //     yield CovidLoaded(result);
    //   }
    // }
    else if (event is ProviderLoginButtonTapped) {
      yield LoginInProgress();
      final result = await _providerEmailSignin.call(EmailAuthParams(
          email: email, password: password, first_name: "Tes", lName: "Test"));
      yield* result.fold((l) async* {
        if (l is UserNotConfirmedFailure) {
          final res = await _resendCode(email);
          if (res.isRight()) {
            yield VerificationNeeded();
          } else {
            yield LoginFailure("email or password not valid");
          }
        } else {
          yield LoginFailure("email or password not valid.. $l");
        }
        //yield LoginFailure("Signin failed..please try again.. $l");
      }, (r) async* {
//await getProviderRequest(NoParams());
        yield LoginSuccess();
      });
    } else if (event is GetProvider) {
      final result = await getProviders.call(event.text);
      print('ddddd$event.text');
      if (result.isRight()) {
        yield ProviderLoaded1(result.getOrElse(() => null));
      }
    } else if (event is GetCustomers) {
      final result = await getUsers(NoParams());
      if (result.isRight()) {
        yield CustomerLoaded(result.getOrElse(() => null));
      }
    }
  }

  bool _isFormValid() {
    return email.isNotEmpty && password.isNotEmpty;
  }

  @override
  // TODO: implement initialState
  get initialState => LoginInitial();
}
