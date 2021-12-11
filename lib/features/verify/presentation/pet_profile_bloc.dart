import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:meta/meta.dart';
part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  PetProfileBloc(this.getPetProfile,
      this.saveChangePassword,
      this.savePetProfile,
      this.saveUserProfile,
      this.createPetProfile,
      this.sharedPrefHelper,
      this._saveUserPayment)
      : super();
  final SharedPrefHelper sharedPrefHelper;
  final CreatePetProfile createPetProfile;
  final SavePetProfile savePetProfile;
  final GetPetProfile getPetProfile;
  final SaveUserProfile saveUserProfile;
  final SaveChangePassword saveChangePassword;
  final SaveUserPayment _saveUserPayment;

  // int step = 1;
  String age = '';

  String petName = "";
  String width = "";
  String hight = "";
  String sex = "";
  String birthdate = '';
  String breadtype = '';
  String img = '';
  String allergies = '';

  @override
  // TODO: implement initialState
  PetProfileState get initialState => PetProfileInitial();

  @override
  Stream<PetProfileState> mapEventToState(PetProfileEvent event) async* {

    if (event is WidthChanged) {
      if (event.width.isNotEmpty) {
        width = event.width;
      } else {
        width = "";
      }
      print(width);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
     else if (event is AgeChanged) {
        print('djdd');
        if (event.age.isNotEmpty) {
          age = event.age;
        } else {
          age = '';
        }
        print(age);
        bool isValidated = _isFormValid();
        if (isValidated) {
          yield RegisterFormValidationSuccess();
        } else {
          yield RegisterFormValidationFailure();
        }
    } else if (event is HeightChanged) {
      if (event.hight.isNotEmpty) {
        hight = event.hight;
      } else {
        hight = "";
      }
      print(hight);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is BreadChanged) {
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
    } else if (event is BirthChanged) {
      print('datepicker on BirthChanged event');
      if (event.selectedDate.isNotEmpty) {
        birthdate = event.selectedDate;
      } else {
        birthdate = "";
        print(birthdate);
      }
      print(birthdate);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield UpdatedBirthDate(birthdate: event.selectedDate);
        print(birthdate);
      }
    } else if (event is petNameChanged) {
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
    } else if (event is SexChanged) {
      print('datepicker on BirthChanged event');
      if (event.sex.isNotEmpty) {
        hight = event.sex;
      } else {
        sex = "";
        print(birthdate);
      }
      print(sex);
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is fakeRegisterButtonTapped){
      yield RegisterInProgress();
     final result = await getPetProfile(NoParams());
      yield* result.fold((l) async* {
        yield RegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
       // await savePetProfile(PetProfileParams());
        yield  fakeUserPetProfileButtonTapped();
      });

    }
   else if (event is GetCovidList) {
      yield RegisterInProgress();
      final response = await getPetProfile(PetProfile());
        yield* response.fold((l) async* {
          yield RegisterFailure("Signup failed..please try again.. $l");
        },
                (r) async* {
           //   await savePetProfile(PetProfile());
              PetProfile _petProfile;
              yield UsergetPetProfileButtonTapped(_petProfile);
            });
    }



    else if (event is RegisterButtonTapped) {
      yield RegisterInProgress();
      final result = await createPetProfile(PetProfile(
        age: age,
        weight: width,
        height: hight,
        birthDate: birthdate,
       // breedType: breadtype.toString(),
        petName: petName,

      ));
      yield* result.fold((l) async* {
        yield RegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
        await savePetProfile(PetProfile());
        yield UserPetProfileButtonTapped();
      });
    }
    if (event is ProfileOpened) {} else if (event is RegisterUser) {
      await getPetProfile(NoParams());
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

    else if (event is Profile3) {
      print('kkfkfk');
      PetProfile profileParams = PetProfile(
        walkingSchedule: event.walking,
        feedingSchedule: event.feeding,
      //  temperament: event.temprament,
      //  medication: event.medication,
     //   name: event.name,
     //   : event.times,
       // notes: event.notes,

      );
      print('dddd');
      final result = await createPetProfile(profileParams);
      if (result.isRight()) {
        getPetProfile(NoParams());
       // await savePetProfile(PetProfileParams());
        print("profileeee saveddd");
      } else {
        print("profileeee faileddd");
      }
      yield pet3rofileButtonTapped();
      print('tapped');
    }
    if (event is ProfileOpened) {} else if (event is ChangePassword) {
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
    if (event is ProfileOpened) {} else if (event is savePayment) {
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
      yield SavePaymentButtonTapped();
    }

  if (event is ProfileOpened) {
  } else if (event is GetProfileOpened) {
    PetProfile profileParams = PetProfile(
 age: sharedPrefHelper.getStringByKey(MaruConstant.age, ''),
      height: sharedPrefHelper.getStringByKey(MaruConstant.height, ''),
      weight: sharedPrefHelper.getStringByKey(MaruConstant.height, ''),
  );
  final result = await getPetProfile(profileParams);
  if (result.isRight()) {
  print("Payment  Saved");
  } else {
  print("Payment faileddd");
  }
  yield SavePaymentButtonTapped();
  }
}
  bool _isFormValid() {
    return age.isNotEmpty &&
        width.isNotEmpty &&
        hight.isNotEmpty &&
        breadtype.isNotEmpty &&
        birthdate.isNotEmpty &&
        // img.isNotEmpty &&
        petName.isNotEmpty ;
    // sex.isNotEmpty;
  }
}
