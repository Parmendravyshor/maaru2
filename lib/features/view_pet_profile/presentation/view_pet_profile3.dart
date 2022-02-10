import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';

class ViewPetProfile3 extends StatefulWidget {
  final int id3;

  const ViewPetProfile3({Key key, this.id3}) : super(key: key);
  @override
  _ViewPetProfile3State createState() => _ViewPetProfile3State();
}

class _ViewPetProfile3State extends State<ViewPetProfile3> {
  final SharedPrefHelper _prefHelper =
      KiwiContainer().resolve<SharedPrefHelper>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body: Center(
          child: Container(
            child: Container(
              child: BlocProvider(
                  create: (context) =>
                      KiwiContainer().resolve<PetProfileBloc>(),
                  child: BlocBuilder<PetProfileBloc, PetProfileState>(
                      builder: (context, state) {
                    if (state is PetProfileInitial) {
                      BlocProvider.of<PetProfileBloc>(context)
                          .add(GetSinglePRof(widget.id3));

                      return CircularProgressIndicator();
                    } else if (state is SingleProfileLoaded) {
                      List abc = [];
                      for (int i = 0;
                          i <= state.welcome2.getSinglePe.notes.length - 1;
                          i++) {
                        var a = state.welcome2.getSinglePe.notes[i];
                        abc.add(a);
                      }

                      var note;
                      return SafeArea(
                        bottom: false,
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Container(
                                height: 200,
                                width: 430,
                                child: Image.network(
                                  state.welcome2.getSinglePe.img,
                                  fit: BoxFit.fitWidth,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                        color: Colors.amber,
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            'assets/images/kutta.png'));
                                  },
                                ),
                              ),
                              Container(
                                  //height: size.,
                                  width: 1000,
                                  height: 700,
                                  alignment: FractionalOffset.bottomCenter,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 10, 0, 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ViewPetProfile(
                                                                    id1: widget
                                                                        .id3,
                                                                  )));
                                                    },
                                                    child: Image.asset(
                                                      'assets/icons/Rectangle copy 3.png',
                                                      height: 40,
                                                      width: 40,
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ViewPetProfile2(
                                                                    id2: widget
                                                                        .id3,
                                                                  )));
                                                    },
                                                    child: Image.asset(
                                                      'assets/icons/Rectangle copy 3.png',
                                                      height: 40,
                                                      width: 40,
                                                      //color: Colors.grey[100],
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                ViewPetProfile3(
                                                                  id3: widget
                                                                      .id3,
                                                                )));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/Rectangle copy 3.png',
                                                    height: 40,
                                                    width: 40,
                                                    //color: Colors.grey[100],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    state.welcome2.getSinglePe
                                                        .petName
                                                        .toString(),
                                                    style:
                                                        MaaruStyle.text.large,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    CreateregisterPetProfile1()));
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/icone-setting-29.png',
                                                        height: 40,
                                                      ))
                                                ]),
                                            Text(
                                              state.welcome2.getSinglePe
                                                  .breedType
                                                  .toString(),
                                              style: MaaruStyle.text.tiny,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 30, top: 20),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 80,
                                                            width: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[50],
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              20),
                                                                      child: Text(
                                                                          'Age',
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .red)),
                                                                  Text(
                                                                      state
                                                                          .welcome2
                                                                          .getSinglePe
                                                                          .age
                                                                          .toString(),
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .tinyDisable),
                                                                ]),
                                                          ),
                                                          Container(
                                                            height: 80,
                                                            width: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[50],
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              20),
                                                                      child: Text(
                                                                          'Sex',
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .red)),
                                                                  Text(
                                                                      state
                                                                          .welcome2
                                                                          .getSinglePe
                                                                          .sex,
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .tinyDisable),
                                                                ]),
                                                          ),
                                                          Container(
                                                            height: 80,
                                                            width: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[50],
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              20),
                                                                      child: Text(
                                                                          'Height',
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .red)),
                                                                  Text(
                                                                      state
                                                                          .welcome2
                                                                          .getSinglePe
                                                                          .height
                                                                          .toString(),
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .tinyDisable),
                                                                ]),
                                                          ),
                                                          Container(
                                                            height: 80,
                                                            width: 70,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[50],
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              20),
                                                                      child: Text(
                                                                          'Weight',
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .red)),
                                                                  Text(
                                                                      state
                                                                          .welcome2
                                                                          .getSinglePe
                                                                          .weight
                                                                          .toString(),
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .tinyDisable),
                                                                ]),
                                                          ),
                                                        ])),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Notes',
                                                  style:
                                                      MaaruStyle.text.tiniest,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                if (state.welcome2.getSinglePe
                                                    .petName.isNotEmpty)
                                                  Container(
                                                      // height: size.height * 0.30,
                                                      width: size.width * 0.85,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                  Radius.circular(
                                                                      18.0))),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  top: 20),
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                      left: 20),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      state.welcome2.getSinglePe.temperament.isNotEmpty.toString() !=
                                                                              null
                                                                          ? ''
                                                                          : state
                                                                              .welcome2
                                                                              .getSinglePe
                                                                              .temperament,
                                                                      // state.welcome2.getSinglePe.notes.
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .tiniest,
                                                                    ),
                                                                    Text(
                                                                      state
                                                                          .welcome2
                                                                          .getSinglePe
                                                                          .petName,
                                                                      semanticsLabel:
                                                                          'no data',
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .medium,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      state.welcome2.getSinglePe
                                                                              .walkingSchedule
                                                                              .toString()
                                                                              .isEmpty
                                                                          ? ''
                                                                          : state
                                                                              .welcome2
                                                                              .getSinglePe
                                                                              .temperament,
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .greyDisable,
                                                                    ),
                                                                    Text(
                                                                      '',
                                                                      //    state.welcome2.getSinglePe.notes[
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .greyDisable,
                                                                    )
                                                                  ])))),
                                              ],
                                            )
                                          ])))
                            ])),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })),
            ),
          ),
        ));
  }
}
