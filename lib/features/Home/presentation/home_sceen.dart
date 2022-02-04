import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/Home/presentation/chat_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/pet_profile.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
//import 'package:maru/features/verify/presentation/pet_profile_event.dart'as event ;
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'message.dart';

import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedIndex = 0;
    return Stack(children: [
      Scaffold(
          backgroundColor: Color(0xFFffffff),
          bottomNavigationBar: CreateHomeScreen(
            selectedIndex: 0,
            Color: selectedIndex == 0
                ? MaaruColors.textButtonColor
                : Colors.grey[350],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            ShowLocation(),
                            const SizedBox(
                              height: 20,
                            ),
                            HorizList(),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Upcoming Appoinments',
                                  style: MaaruStyle.text.tiny,
                                )),
                            Center(
                              child: BlocProvider(
                                create: (context) => KiwiContainer()
                                    .resolve<BookAppointmentBloc>(),
                                child: BlocBuilder<BookAppointmentBloc,
                                        BookAppointmentState>(
                                    builder: (context, state) {
                                  if (state is BookAppointmentInitial) {

                                    BlocProvider.of<BookAppointmentBloc>(
                                            context)
                                        .add(UpcomingAppointmentChanged(
                                            '', '')
                                    );
                                    print('figffgfg123');
                                    return CircularProgressIndicator();
                                  } else if (state
                                      is FetchUpcomingAppointmentModelData) {
                                    print('ssss ${state.upcomingPastAppointmentModel
                                        .upcomingBookings.length}');
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        reverse: true,
                                        itemCount: state
                                            .upcomingPastAppointmentModel
                                            .upcomingBookings
                                            .length,
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 20, 20, 10),
                                              child: Container(
                                                  //  height: size.height*0.30,
                                                  width: size.width * 1,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: MaaruColors
                                                              .textfeildline)),
                                                  child: Container(
                                                      margin: const EdgeInsets
                                                          .all(10),
                                                      child: Row(children: [
                                                        Expanded(
                                                            child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color:
                                                                Colors.white,
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/kutta.png',
                                                            height: 100,
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                state
                                                                    .upcomingPastAppointmentModel
                                                                    .upcomingBookings[
                                                                        index]
                                                                    .companyName,
                                                                style:
                                                                    MaaruStyle
                                                                        .text
                                                                        .tiny,
                                                              ),
                                                              Text(
                                                                  state
                                                                      .upcomingPastAppointmentModel
                                                                      .upcomingBookings[
                                                                          index]
                                                                      .serviceName
                                                                      .toString(),
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .medium),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                state
                                                                    .upcomingPastAppointmentModel
                                                                    .upcomingBookings[
                                                                        index]
                                                                    .companyState
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                              Text(
                                                                '${state.upcomingPastAppointmentModel.upcomingBookings[index].companyZipCode.toString()}${state.upcomingPastAppointmentModel.upcomingBookings[index].companyCity.toString()}',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            //width: 40,
                                                            ),
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              const Icon(
                                                                Icons
                                                                    .calendar_today_outlined,
                                                                size: 22,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                              const SizedBox(
                                                                height: 36,
                                                              ),
                                                              Text(
                                                                state
                                                                    .upcomingPastAppointmentModel
                                                                    .upcomingBookings[
                                                                        index]
                                                                    .bookingDate
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                              Text(
                                                                state
                                                                    .upcomingPastAppointmentModel
                                                                    .upcomingBookings[
                                                                        index]
                                                                    .bookingTime,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ]))));
                                        });
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                }),
                              ),
                            ),
                            ThemedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AppointmentScreen()));
                              },
                              text: 'View All Appoinments',
                              enabled: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Recent Messages',
                                  style: MaaruStyle.text.tiny,
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Austin Pet Groomers',
                                                style: MaaruStyle.text.tiny),
                                            const Text(
                                              'Aug 8,2021 11:00am',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text('Pet Grooming',
                                            style: MaaruStyle.text.tiny),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          'Roscoe needs a trim and was wanting to know if we  could move up our appointmenr?',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 11),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ChatScreen()));
                                              },
                                              child: const Text(
                                                'Show Message',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color:
                                                        MaaruColors.blueColor),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                            ThemedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Messages()));
                              },
                              text: ' All messages',
                              enabled: true,
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ])))))
    ]);
  }
}

class HorizList extends StatefulWidget {
  final int id;
  bool aet;

  HorizList({Key key, this.id}) : super(key: key);
  @override
  State<HorizList> createState() => _HorizListState();
}

class _HorizListState extends State<HorizList> {
  bool closedImage = false;
  bool openImage = true;
  bool switchOn = true;

  void _onSwitchChanged(bool value) {
    setState(() {
      switchOn = false;
    });
  }

  String text = '';
  List<Container> containers = List<Container>();
  TextEditingController _petNameController;
////
  @override
  void initState() {
    _petNameController = TextEditingController();

    super.initState();
  }

  void dispose() {
    _petNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    final size = MediaQuery.of(context).size;
    final List Message = [10];
    return Center(
        child: Container(
            color: Colors.white,
            child: BlocProvider(
                create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
                child: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  if (state is PetProfileInitial) {
                    BlocProvider.of<PetProfileBloc>(context)
                        .add(GetCovidList(_petNameController.text));

                    return const CircularProgressIndicator();
                  } else if (state is CovidLoaded3) {
                    print(
                        '+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.covidModel.petProfiles}');

                    return Column(children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 15, right: 10, left: 10),
                          child: TextFormField(
                            // cursorColor: Colors.black,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide: BorderSide(
                                        color: MaaruColors.textfeildline,
                                        width: 1.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide: BorderSide(
                                        color: MaaruColors.textfeildline,
                                        width: 1.0)),
                                hintText: 'Search',
                                hintStyle: MaaruStyle.text.greyDisable,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 25.0, 10.0),
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        BlocProvider.of<PetProfileBloc>(context)
                                            .add(GetCovidList(
                                                _petNameController.text));
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/icons/icone-setting-19.png',
                                      height: 52,
                                      // width: 30,
                                    ))),
                            // onFieldSubmitted: (text) {
                            //   BlocProvider.of<PetProfileBloc>(context)
                            //       .add(GetCovidList(text));
                            // },
                            onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context)
                                  .add(GetCovidList(_petNameController.text));
                            },
                            controller: _petNameController,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: size.height * 0.27,
                          child: ListView.builder(

                              itemCount: state.covidModel.petProfiles.length,
                              scrollDirection: Axis.horizontal,

                              reverse: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: index == Message.length - 1
                                        ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                        : const EdgeInsets.only(
                                            left: 8, right: 8),
                                    child: InkWell(
                                        onTap: () {
                                          var a = _prefHelper.saveInt(
                                              'id',
                                              state.covidModel
                                                  .petProfiles[index].id);
                                          //state.covidModel.petProfiles[index].id;
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ViewPetProfile(
                                                          id1: state
                                                              .covidModel
                                                              .petProfiles[
                                                                  index]
                                                              .id)));
                                        },
                                        child: Container(
                                            alignment: FractionalOffset.topLeft,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey[300],
                                                  width: 1.0),
                                            ),
                                            width: size.width * 0.44,
                                            child: Column(children: [
                                              Container(
                                                child: Image.network(
                                                    state.covidModel
                                                        .petProfiles[index].img
                                                        .toString(),
                                                    height: 140,
                                                    width: 180,
                                                    fit: BoxFit.fitWidth,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                  return Container(
                                                      color: Colors.amber,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Expanded(
                                                          child: Image.asset(
                                                              'assets/images/kutta.png')));
                                                }),
                                              ),
                                              Container(
                                                  height: size.height * 0.09,
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                state
                                                                    .covidModel
                                                                    .petProfiles[
                                                                        index]
                                                                    .petName
                                                                    .toString(),
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle:
                                                                      MaaruStyle
                                                                          .text
                                                                          .tiny,
                                                                )),
                                                            Image.asset(
                                                              'assets/icons/icone-setting-31.png',
                                                              width: 25,
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 70),
                                                            child: Text(
                                                              state
                                                                  .covidModel
                                                                  .petProfiles[
                                                                      index]
                                                                  .breedType
                                                                  .toString(),
                                                              style: MaaruStyle
                                                                  .text.tiny,
                                                            ))
                                                      ])
                                                  // alignment: Alignment.center,
                                                  )
                                            ]))));
                              }))
                    ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }))));
  }
}
