import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_single_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:meta/meta.dart';
part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  PetProfileBloc(this.getPetProfile,
      this.saveChangePassword,
      this.savePetProfile,
      this.saveUserProfile,
      this.createPetProfile,
      this.sharedPrefHelper,
      this.getSinglePetProfile,
      this.uploadVaccineREcord,
      this._saveUserPayment)
      : super();
  final SharedPrefHelper sharedPrefHelper;
  final UploadVaccineREcord uploadVaccineREcord;
  final GetSinglePetProfile getSinglePetProfile;
  final CreatePetProfile createPetProfile;
  final SavePetProfile savePetProfile;
  final GetPetProfile getPetProfile;
  final SaveUserProfile saveUserProfile;
  final SaveChangePassword saveChangePassword;
  final SaveUserPayment _saveUserPayment;

  // int step = 1;
  String age = '';
  var petneed = '';
  String petName = "";
  String width = "";
  String hight = "";
  String sex;
  var birthdate = '';
  String breadtype = '';
  String img = '';
  String allergies = '';
  var gender = '';
  var note = '';
  var knownAllergies = '';
  var vaccine = '';

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
      print(event.selectedDate);
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
    else if (event is NoteChanged) {
      print('note event');
      if (event.note.isNotEmpty) {
        note = event.note;
      } else {
        note = "";
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
    else if (event is genderChanged) {
      print(event.gender);
      if (event.gender.isNotEmpty) {
        gender = event.gender;
      } else {
        gender = "";
        print(gender);
      }

      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is PetNeed) {
      print('note event');
      if (event.petneed.isNotEmpty) {
        petneed = event.petneed;
      } else {
        petneed = "";
        print(petneed);
      }

      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is CreateRegisterPetProfile) {
      yield RegisterInProgress();
      final result = await createPetProfile(PetProfile(
          age: age,
          weight: width,
          height: hight,
          birthDate: birthdate,
          breedType: breadtype,
          petName: petName,
          sex: sex,
         // petNeeds: knownAllergies,
          gender: gender,
          notes: note,
          knownAllergies: knownAllergies,
          vaccine: vaccine
      ));
      yield* result.fold((l) async* {
        yield RegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
        // await getPetProfile(NoParams());
        ///  await savePetProfile(PetProfile());

        yield UserCreatePetProfileButtonTapped();
      });
    }
    else if (event is Profile2) {
      PetProfile petProfile2 = PetProfile(
        knownAllergies: event.know_allergies,
        vaccine: event.vaccine,
      );
      final result = await savePetProfile(petProfile2);
      if (result.isRight()) {
        print("Password  Changed");
      } else {
        print("Password faileddd");
      }
      yield PetProfile2Saves();
    }

    else if (event is vaccineUplo) {
      vacineParams petprofile2vaccine = vacineParams(
        pet_id: _prefHelper.getStringByKey('id', ''),
        doc_url: event.vaccine,


      );
      final result = await uploadVaccineREcord(petprofile2vaccine);
      if (result.isRight()) {
        print("Password  Changed");
      } else {
        print("Password faileddd");
      }
      yield PetVaccineSuccessfull();
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
      // yield UserPetProfileButtonTapped();
    }

    else if (event is Profile3) {
      print('kick');
      PetProfile profileParams4 = PetProfile(
        walkingSchedule: event.walking,
        feedingSchedule: event.feeding,
        temperament: event.temprament,
        medication: event.medication,
        name: event.name,
        times_a_day: event.times,
        notes: event.notes,
      );
      final result = await savePetProfile(profileParams4);
      if (result.isRight()) {
        print("Password  Changed");
      } else {
        print("Password faileddd");
      }
      yield pet3rofileButtonTapped();
      print('tapped');
    }
    else if (event is Profile4) {
      print('kick');
      PetProfile profileParams4 = PetProfile(
        knownAllergies:[ event.walking,event.daycare,event.grooming,event.hospital,event.hotel,event.vet]
        // petNeeds: event.daycare,
        // temperament: event.grooming,
        // medication: event.hospital,
        // name: event.hotel,
        // times_a_day: event.vet,
      );
      final result = await savePetProfile(profileParams4);
      if (result.isRight()) {
        print("Password  Changed");
      } else {
        print("Password faileddd");
      }
      yield pet4rofileButtonTapped();
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
    if (event is GetCovidList) {
      final result = await getPetProfile(NoParams());

      // final result =  await getPetProfile1(NoParams());
      if (result.isRight()) {
        print('dkdjddh');
        // await getPetProfile1(NoParams());
        yield CovidLoaded(result.getOrElse(() => null));
        print('dddddddd$CovidLoaded(covidModel)');
        print('445454dkdjddh');
      }
    }
    if (event is GetSinglePRof){
      final result = await getSinglePetProfile(NoParams());
      if(result.isRight()){
        yield SingleProfileLoaded(result.getOrElse(() => null));
      }
    }
  //  if( event is GetProviderBookingRequest ){
   //   final result = await  getPr
  //  }
 }

  bool _isFormValid() {
    return age.isNotEmpty &&
        width.isNotEmpty &&
        hight.isNotEmpty &&
        breadtype.isNotEmpty &&
        birthdate.isNotEmpty &&
        sex.isNotEmpty &&
        gender.isNotEmpty &&
        // img.isNotEmpty &&
        petName.isNotEmpty ;
    // sex.isNotEmpty;
  }
}
