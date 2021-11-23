import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/presentation/bloc/verify_event.dart';
import 'package:meta/meta.dart';

part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  PetProfileBloc(  this.createPetProfile)
      : super();

  final CreatePetProfile createPetProfile;
 // final SavePetProfile savePetProfile;
  //final GetPetProfile getPetProfile;
 // int step = 1;
  String age = "";
  String petname ="";
  String width = "" ;
  String hight = "" ;
  String sex = "";
  String birthdate ='';
  String breadtype = '';
  @override
  // TODO: implement initialState
  PetProfileState get initialState => PetProfileInitial();

  @override
  Stream<PetProfileState> mapEventToState(PetProfileEvent event) async* {
    if (event is petNameChanged) {
      if (event.petname.isNotEmpty) {
        petname = event.petname;
      }
      else {
        petname = '';
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
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

      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    }
    else if (event is BirthChanged) {
      if (event.birthdate.isNotEmpty) {
        birthdate = event.birthdate;
      } else {
        birthdate = "";
      }

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
          sex: sex));
      yield* result.fold((l) async* {
        yield RegisterFailure("Profile failed..please try again.. $l");
      }, (r) async* {
      ///  step = 2;
        yield RegisterSuccess();
      });
    }
  //   else if (event is RegisterButtonTapped) {
  //     yield RegisterInProgress();
  //     final result = await savePetProfile(PetProfileParams(
  //        ));
  //     yield* result.fold((l) async* {
  //       yield RegisterFailure("Profile failed..please try again.. $l");
  //     }, (r) async* {
  //      /// step = 2;
  //       yield RegisterSuccess();
  //     });
  //   }
  //   else if (event is RegisterButtonTapped) {
  //     yield RegisterInProgress();
  //     final result = await getPetProfile(PetProfileParams(
  //        ));
  //     yield* result.fold((l) async* {
  //       yield RegisterFailure("Profile failed..please try again.. $l");
  //     }, (r) async* {
  //      /// step = 2;
  //       yield RegisterSuccess();
  //     });
  //   }
   }
      bool _isFormValid() {
        return petname.isNotEmpty &&
          age.isNotEmpty &&
            width.isNotEmpty &&
            hight.isNotEmpty &&
            breadtype.isNotEmpty &&
            birthdate.isNotEmpty &&
            sex.isNotEmpty;
      }
    }
