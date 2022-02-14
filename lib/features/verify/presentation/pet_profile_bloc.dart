import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/get_user_payment.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/verify/domain/usecases/get_single_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:meta/meta.dart';
part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  PetProfileBloc(
      this.getPetProfile,
      this.savePetProfile,
      this.createPetProfile,
      this.sharedPrefHelper,
      this.getSinglePetProfile,
      this.uploadVaccineREcord,
      this.getProviders,
      this.getProviderById,
   )
      : super();
  final SharedPrefHelper sharedPrefHelper;
  final GetProviderById getProviderById;
  final GetProviders getProviders;
  final UploadVaccineREcord uploadVaccineREcord;
  final GetSinglePetProfile getSinglePetProfile;
  final CreatePetProfile createPetProfile;
  final SavePetProfile savePetProfile;
  final GetPetProfile getPetProfile;


  // int step = 1;
  String img = '';
  String allergies = '';
  var knownAllergies = '';
  var vaccine = '';
  var text2 = '';
  @override
  // TODO: implement initialState
  PetProfileState get initialState => PetProfileInitial();

  @override
  Stream<PetProfileState> mapEventToState(PetProfileEvent event) async* {
    if (event is CreateRegisterPetProfile) {
      yield RegisterInProgress();
      final result = await createPetProfile(PetProfile1(
          age: event.age,
          weight: event.width,
          height: event.height,
          birthDate: event.birthdate,
          breedType: event.breedType,
          petName: event.petName,
          sex: event.sex,
          // petNeeds: knownAllergies,
          gender: event.gender,
          notes: event.notes,
          knownAllergies: knownAllergies,
          vaccine: vaccine));
      yield* result.fold((l) async* {
        yield RegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
        // await getPetProfile(text);
        ///  await savePetProfile(PetProfile());

        yield UserCreatePetProfileButtonTapped();
      });
    } else if (event is Profile2) {
      PetProfile1 petProfile2 = PetProfile1(
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
    } else if (event is vaccineUplo) {
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
   else if (event is Profile3) {
      print('kick');
      PetProfile1 profileParams4 = PetProfile1(
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
    } else if (event is Profile4) {
      print('kick');
      PetProfile1 profileParams4 = PetProfile1(knownAllergies: [
        event.walking,
        event.daycare,
        event.grooming,
        event.hospital,
        event.hotel,
        event.vet
      ]
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

    if (event is GetProvider) {
      final result = await getProviders(event.text);
      print('ddddd$event.text');
      // final result =  await getPetProfile1(NoParams());
      if (result.isRight()) {
        yield ProviderLoaded(result.getOrElse(() => null));
      }
    }
    if (event is GetSinglePRof) {
      final result = await getSinglePetProfile(event.id1);
      if (result.isRight()) {
        yield SingleProfileLoaded(result.getOrElse(() => null));
      }
    }

    if (event is GetCovidList) {
      if (event.text.isNotEmpty) {
        text2 = event.text;
      } else {
        text2 = "";
      }
      print('gdgddgyd$text2');
      final result = await getPetProfile(event.text);
      print('jhhhhhy${event.text}');
      // final result =  await getPetProfile1(NoParams());
      if (result.isRight()) {
        print('dkdjddh');
        // await getPetProfile1(NoParams());
        yield CovidLoaded3(result.getOrElse(() => null));
        print('dddddddd$CovidLoaded(covidModel)');
        print('445454dkdjddh');
      }
    }

    if (event is GetSinglePRovider) {
      final result = await getProviderById(event.id1);
      if (result.isRight()) {
        yield SingleProviderLoaded(result.getOrElse(() => null));
      }
    }
    //  if( event is GetProviderBookingRequest ){
    //   final result = await  getPr
    //  }
  }


}
