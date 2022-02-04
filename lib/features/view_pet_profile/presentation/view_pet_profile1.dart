import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile3.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;

class ViewPetProfile extends StatefulWidget {
  final int id1;

  const ViewPetProfile({Key key, this.id1}) : super(key: key);

  @override
  _ViewPetProfileState createState() => _ViewPetProfileState();
}

class _ViewPetProfileState extends State<ViewPetProfile> {
  String text;
  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body: SafeArea(
            bottom: false,
            child: BlocProvider(
                create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
                child: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  if (state is PetProfileInitial) {
                    BlocProvider.of<PetProfileBloc>(context)
                        .add(GetSinglePRof(widget.id1));
                    print('sssss${widget.id1}');
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SingleProfileLoaded) {
                    print(
                        '+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.welcome2.getSinglePe.petName}');

                    return SingleChildScrollView(
                        //   itemCount: state.welcome2.getSinglePe[inde]
                        //   itemBuilder: (context, index) {
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
                            //  height: 800,
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
                                            Image.asset(
                                              'assets/icons/Rectangle copy 3.png',
                                              height: 40,
                                              width: 40,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              ViewPetProfile2(
                                                                id2: widget.id1,
                                                              )));
                                                },
                                                child: Image.asset(
                                                  'assets/icons/icone-setting-68.png',
                                                  height: 40,
                                                  width: 40,
                                                  color: Colors.grey[100],
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ViewPetProfile3(
                                                              id3: widget.id1,
                                                            )));
                                              },
                                              child: Image.asset(
                                                'assets/icons/icone-setting-68.png',
                                                height: 40,
                                                width: 40,
                                                color: Colors.grey[100],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                _prefHelper.getStringByKey(
                                                    MaruConstant.firstName, ''),
                                                style: MaaruStyle.text.large,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.60,
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
                                          _prefHelper.getStringByKey(
                                              MaruConstant.lastName, ''),
                                          style: MaaruStyle.text.tiny,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
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
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 20),
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
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 20),
                                                                  child: Text(
                                                                      'Sex',
                                                                      style: MaaruStyle
                                                                          .text
                                                                          .red)),
                                                              Text(
                                                                  state
                                                                      .welcome2
                                                                      .getSinglePe
                                                                      .sex
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
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 20),
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
                                                                      .tinyDisable),
                                                            ]),
                                                      ),
                                                    ])),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                                height: size.height * 0.13,
                                                width: size.width * 0.99,
                                                decoration: BoxDecoration(
                                                  color: Colors.green[50],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  30)),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 43),
                                                              child: Text(
                                                                'Jimmmy Booker',
                                                                style: MaaruStyle
                                                                    .text
                                                                    .tiniest,
                                                              )),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                'Owner',
                                                                style:
                                                                    MaaruStyle
                                                                        .text
                                                                        .tiny,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.22,
                                                              ),
                                                              Image.asset(
                                                                'assets/icons/icone-setting-69.png',
                                                                height: 20,
                                                              )
                                                            ],
                                                          ),
                                                        ]))),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              'Upcoming Appointments',
                                              style: MaaruStyle.text.tiniest,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child:    BlocProvider(
                                                create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
                                                child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(builder: (context, state) {
                                                  if (state is BookAppointmentInitial) {
                                                    BlocProvider.of<BookAppointmentBloc>(context).add(
                                                        UpcomingAppointmentChanged(
                                                          '','',
                                                        ));

                                                    return Center(child: CircularProgressIndicator());
                                                  } else if (state is FetchUpcomingAppointmentModelData) {
                                                    return ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        shrinkWrap: true,
                                                        physics: ScrollPhysics(),
                                                        itemCount: state
                                                            .upcomingPastAppointmentModel
                                                            .upcomingBookings
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          if (state
                                                                  .upcomingPastAppointmentModel
                                                                  .upcomingBookings
                                                                  .length !=
                                                              null) {
                                                            return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        10,
                                                                        20,
                                                                        20,
                                                                        10),
                                                                child: Container(
                                                                    //  height: size.height*0.30,
                                                                    width: size.width * 1,
                                                                    decoration: BoxDecoration(border: Border.all(color: MaaruColors.textfeildline)),
                                                                    child: Container(
                                                                        margin: const EdgeInsets.all(10),
                                                                        child: Row(children: [
                                                                          Expanded(
                                                                              child: Container(
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              color: Colors.white,
                                                                            ),
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/kutta.png',
                                                                              height: 100,
                                                                            ),
                                                                          )),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Container(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  state.upcomingPastAppointmentModel.upcomingBookings[index].companyName,
                                                                                  style: MaaruStyle.text.tiny,
                                                                                ),
                                                                                Text(state.upcomingPastAppointmentModel.upcomingBookings[index].serviceName.toString(), style: MaaruStyle.text.medium),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                Text(
                                                                                  state.upcomingPastAppointmentModel.upcomingBookings[index].companyState.toString(),
                                                                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                                                                ),
                                                                                Text(
                                                                                  '${state.upcomingPastAppointmentModel.upcomingBookings[index].companyZipCode.toString()}${state.upcomingPastAppointmentModel.upcomingBookings[index].companyCity.toString()}',
                                                                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                              //width: 40,
                                                                              ),
                                                                          Container(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.calendar_today_outlined,
                                                                                  size: 22,
                                                                                  color: Colors.yellow,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 36,
                                                                                ),
                                                                                Text(
                                                                                  state.upcomingPastAppointmentModel.upcomingBookings[index].bookingDate.toString(),
                                                                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                                                                ),
                                                                                Text(
                                                                                  state.upcomingPastAppointmentModel.upcomingBookings[index].bookingTime,
                                                                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ]))));
                                                          } else {
                                                            return const Text(
                                                                'No Data  Found');
                                                          }
                                                        });
                                                  } else {
                                                    return CircularProgressIndicator();
                                                  }
                                                }),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              AppointmentScreen()));
                                                },
                                                child: RoundedButton(
                                                  buttonName:
                                                      'View all Appointments',
                                                  Color: MaaruColors
                                                      .primaryColorsuggesion,
                                                  Color1:
                                                      MaaruColors.button2Color,
                                                ))
                                          ],
                                        )
                                      ])))
                        ]));
                  } else {
                    return CircularProgressIndicator();
                  }
                  ;
                }))));
  }
}
