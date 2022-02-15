
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

import 'package:flutter/material.dart';

import 'dart:math' as math show sin, pi;
import 'package:flutter/animation.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen2.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile3.dart';

class ViewPetProfile2 extends StatefulWidget {
  final int id2;

  const ViewPetProfile2({Key key, this.id2}) : super(key: key);
  @override
  _ViewPetProfile2State createState() => _ViewPetProfile2State();
}

class _ViewPetProfile2State extends State<ViewPetProfile2> {
  final SharedPrefHelper _prefHelper =
      KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: BlocBuilder<PetProfileBloc, PetProfileState>(
                builder: (context, state) {
              if (state is PetProfileInitial) {
                BlocProvider.of<PetProfileBloc>(context)
                    .add(GetSinglePRof(widget.id2));

                return Center(child: CircularProgressIndicator());
              } else if (state is SingleProfileLoaded) {
                //  print('+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.welcome2.getSinglePe.petName}');
                return Center(
                  child: SafeArea(
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
                                          child:
                                          Image.asset('assets/images/kutta.png'));
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
                                    padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
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
                                                                      .id2,
                                                                )));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/icone-setting-68.png',
                                                    height: 40,
                                                    width: 40,
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                ViewPetProfile2(
                                                                  id2: widget
                                                                      .id2,
                                                                )));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/Rectangle copy 3.png',
                                                    height: 40,
                                                    width: 40,
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
                                                                      .id2,
                                                                )));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/icone-setting-68.png',
                                                    height: 40,
                                                    width: 40,
                                                    color: Colors.grey[100],
                                                  )),
                                            ],
                                          ),
                                          Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                 state.welcome2.getSinglePe.petName.toString(),
                                                    style: MaaruStyle.text.large,
                                                  ),
                                                  // SizedBox(
                                                  //   width: size.width * 0.60,
                                                  // ),

                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      CreateRegisterPetProfile2(allergies: state.welcome2.getSinglePe.knownAllergies.toString(),image: state.welcome2.getSinglePe.img.toString(),)));
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/icone-setting-29.png',
                                                          height: 40,
                                                        )),
                                                  )
                                                ]),
                                          ),
                                          Text(
                                            state.welcome2.getSinglePe.breedType.toString(),
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
                                                  padding: EdgeInsets.only(
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
                                                            color:
                                                                Colors.grey[50],
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
                                                                    padding: EdgeInsets
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
                                                            color:
                                                                Colors.grey[50],
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
                                                                    padding: EdgeInsets
                                                                        .only(
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
                                                            color:
                                                                Colors.grey[50],
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
                                                                    padding: EdgeInsets
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
                                                            color:
                                                                Colors.grey[50],
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
                                                                    padding: EdgeInsets
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
                                                                      .tinyDisable,
                                                                ),
                                                              ]),
                                                        ),
                                                      ])),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                'Known Allergies',
                                                style: MaaruStyle.text.tiny,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                state.welcome2.getSinglePe
                                                    .knownAllergies.isEmpty ? '':  state.welcome2.getSinglePe
                                                    .knownAllergies,
                                                style:
                                                    MaaruStyle.text.greyDisable,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Pet Vaccine',
                                                style: MaaruStyle.text.tiny,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  height: size.height * 0.13,
                                                  width: size.width * 0.85,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  18.0))),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  'Robbins',
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .tiniest,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.22,
                                                                ),
                                                                Text(
                                                                  'Jan. 13, 2019',
                                                                  style:
                                                                      MaaruStyle
                                                                          .text
                                                                          .medium,
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20),
                                                                child: Text(
                                                                  'Austin Vet Services',
                                                                  style:
                                                                      MaaruStyle
                                                                          .text
                                                                          .medium,
                                                                ))
                                                          ]))),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  height: size.height * 0.13,
                                                  width: size.width * 0.85,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  18.0))),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  'Parvo',
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .tiniest,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.22,
                                                                ),
                                                                Text(
                                                                  'Mar. 25, 2020',
                                                                  style:
                                                                      MaaruStyle
                                                                          .text
                                                                          .medium,
                                                                )
                                                              ],
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20),
                                                                child: Text(
                                                                  'Austin Vet Services',
                                                                  style:
                                                                      MaaruStyle
                                                                          .text
                                                                          .medium,
                                                                ))
                                                          ]))),
                                            ],
                                          )
                                        ])))
                          ]))),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.red,
                ));
              }
            })));
  }
}
