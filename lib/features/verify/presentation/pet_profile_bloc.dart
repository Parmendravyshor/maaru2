import 'dart:async';
import 'dart:developer';


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/presentation/bloc/verify_event.dart';
import 'package:meta/meta.dart';

part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  PetProfileBloc(this.getPetProfile,this.saveChangePassword, this.savePetProfile,this.saveUserProfile,
      this.createPetProfile, this.sharedPrefHelper,this._saveUserPayment)
      : super();
  final SharedPrefHelper sharedPrefHelper;
  final CreatePetProfile createPetProfile;
  final SavePetProfile savePetProfile;
  final GetPetProfile getPetProfile;
  final SaveUserProfile saveUserProfile;
  final SaveChangePassword saveChangePassword;
  final SaveUserPayment _saveUserPayment;
  // int step = 1;
  String age = "";
  String petName ="";
  String width = "" ;
  String hight = "" ;
  String sex = "";
  String birthdate ='';
  String breadtype = '';
  String img ='';

  @override
  // TODO: implement initialState
  PetProfileState get initialState => PetProfileInitial();

  @override
  Stream<PetProfileState> mapEventToState(PetProfileEvent event) async* {

    if (event is AgeChanged) {
      if (event.age.isNotEmpty) {
        age = event.age;
      }
      else {
        age = '';
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is WidthChanged) {

      if (event.width.isNotEmpty) {
        width = event.width;
      } else {
        width = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is HeightChanged) {
      if (event.hight.isNotEmpty) {
        hight = event.hight;
      } else {
        hight = "";
      }

      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is BreadChanged) {
      if (event.breadtype.isNotEmpty) {
        breadtype = event.breadtype;
      } else {
        breadtype = "";
      }
print(breadtype);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }

    else if (event is BirthChanged) {
      if (event._selectedDate.isNotEmpty) {
        birthdate =
            event._selectedDate;

      } else {
        birthdate = "";
      }
print(birthdate);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield UpdatedBirthDate(birthdate: event._selectedDate);
        print(birthdate);
      }

    }
    else if (event is petNameChanged) {
      if (event.petname.isNotEmpty) {
        petName = event.petname;
      } else {
        petName = "";
      }
print(petName);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is SexChanged) {
      if (event.sex.isNotEmpty) {
        hight = event.sex;
      } else {
        sex = "";
      }
print(sex);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();

      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is profileImageChanged) {
      if (event.img.isNotEmpty) {
        img = event.img;
      } else {
        img = "";
      }

      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is RegisterButtonTapped) {

      yield RegisterInProgress();
      final result = await createPetProfile(PetProfileParams(
          age: age,
          weight: width,
          height:  hight,
          birthDate: birthdate,
          breadType: breadtype,
          petName: petName,
          profileImage: img,
          sex: sex));
      yield* result.fold((l) async* {
        yield RegisterFailure("Profile failed..please try again.. $l");
      },
              (r) async* {
        ///  step = 2;
        yield RegisterSuccess();
      });
    }

    if (event is ProfileOpened) {
    } else if (event is RegisterUser) {
      UserProfileParams profileParams = UserProfileParams(
        email: sharedPrefHelper.getEmail(),
        fname: event.fname,
        lname: event.lname,
        phone: event.phone,
        city: event.city,
        zipCode: event.zip,
        state: event.state,
      );
      final result = await saveUserProfile(profileParams);
      if (result.isRight()) {
        print("profileeee saveddd");
      } else {
        print("profileeee faileddd");
      }
      yield UserPetProfileButtonTapped();
    }

  if (event is ProfileOpened) {
  } else if (event is ChangePassword) {
  UserProfileParams profileParams = UserProfileParams(
  //email: sharedPrefHelper.getEmail(),
  oldPassword: event.oldPassword,
  NewPassword: event.newPasword,

  );
  final result = await saveChangePassword(profileParams);
  if (result.isRight()) {
  print("Password  Changed");
  } else {
  print("Password faileddd");
  }
  yield UserChangePasswordButtonTapped();
  }
    if (event is ProfileOpened) {
    } else if (event is savePayment) {
      PaymentParams profileParams = PaymentParams(
      expDate: event.expDate,
        creditCardNumber: event.creditCardNumber,
        nameOnCard: event.nameOnCard,
        cvv: event.cvv,

      );
      final result = await _saveUserPayment(profileParams);
      if (result.isRight()) {
        print("Payment  Saved");
      } else {
        print("Payment faileddd");
      }
      yield UserChangePasswordButtonTapped();
    }
}
bool _isFormValid() {
    return age.isNotEmpty &&
        width.isNotEmpty &&
        hight.isNotEmpty &&
        breadtype.isNotEmpty &&
        birthdate.isNotEmpty &&
        img.isNotEmpty &&
        petName.isNotEmpty &&
        sex.isNotEmpty;
  }

}

