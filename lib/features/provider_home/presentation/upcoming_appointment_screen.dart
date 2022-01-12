import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_calender.dart';

import 'bloc/provider_home_bloc.dart';
import 'create_provider_home.dart';

enum actiontaken { accept, decline, none }

class UpcomingAppointmentCalender1 extends StatefulWidget {
  @override
  _UpcomingAppointmentCalender1State createState() =>
      _UpcomingAppointmentCalender1State();
}

class _UpcomingAppointmentCalender1State
    extends State<UpcomingAppointmentCalender1> {
  @override
  Widget build(BuildContext context) {
    double calendercontainer = 0;
    actiontaken actionchoosen = actiontaken.none;
    String switchimage = 'images/icone-setting.png';
    final size = MediaQuery.of(context).size;
    var selectedIndex;
    String limit = '';
    String page = '';
    String date = '';
    String service = '';
    String provider = '';
    String name = '';
    return Scaffold(
        backgroundColor: MaaruColors.whiteColor,
        bottomNavigationBar: CreateProviderHome(
          selectedIndex: 2,
          // Color1:  selectedIndex == 2
          //     ? Colors.grey[300]
          //     :  MaaruColors.textButtonColor
        ),
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<ProviderHomeBloc>(),
            child: BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
                builder: (context, state) {
              if (state is ProviderHomeInitial) {
                BlocProvider.of<ProviderHomeBloc>(context).add(
                    getProviderRequest(
                        limit, limit, limit, limit, limit, limit));
                // print('figffgfg${text}');
                return const Center(child: CircularProgressIndicator());
              } else if (state is RequestLoaded) {
                print(
                    'datarequestfprcheckeinguseingstaat${state.getProviderRequestModel.appointmentRequests.length}');
                return SafeArea(
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                      //  BackArrowButton(),
                      SizedBox(
                        height: 20,
                      ),
                      ShowLocation(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 18),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    height: 48,
                                    //     width: 350,
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(90),
                                              bottomRight: Radius.circular(90),
                                              topLeft: Radius.circular(30),
                                              bottomLeft: Radius.circular(30),
                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              left: 10, top: 20),
                                          hintText: 'Search',
                                          fillColor: Colors.white,
                                          suffixIcon: Image.asset(
                                            'assets/icons/icone-setting-19.png',
                                            height: 65,
                                            width: 45,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  UpcomingAppointmentCalender()));
                                    },
                                    child: Image.asset(
                                      'assets/icons/icon-bl-05.png',
                                      height: 40,
                                    ))
                              ])),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Upcoming Appointment',
                            style: MaaruStyle.text.tiniest,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.getProviderRequestModel
                              .appointmentRequests.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 10, bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5, color: Color(0xffE8E8E8)),
                                    borderRadius: BorderRadius.circular(25)),
                                height: size.height * 0.18,
                                width: 360,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, top: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: size.height * 0.12,
                                              width: size.width * 0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Image.network('',
                                                  // state
                                                  //     .getProviderRequestModel
                                                  //     .appointmentRequests[
                                                  //         index]
                                                  //     .userImg
                                                  //     .toString(),
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                return Container(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                        'assets/images/kutta.png'));
                                              })),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .getProviderRequestModel
                                                    .appointmentRequests[index]
                                                    .companyName
                                                    .toString(),
                                                style: MaaruStyle.text.xlarge,
                                              ),
                                              Text(
                                                state
                                                    .getProviderRequestModel
                                                    .appointmentRequests[index]
                                                    .service
                                                    .toString(),
                                                style: MaaruStyle.text.tiniest,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              const Text(
                                                '1357 muno manor',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              const Text(
                                                'Austin,Tx 75923',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: const [
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color: Colors.yellow,
                                              ),
                                              SizedBox(
                                                height: 35,
                                              ),
                                              // functions.sizebox(height: size.width * 0.070),
                                              Text(
                                                'Aug,21,2021',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                '11:00 am',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),

                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Text(
                            'Past Appointment',
                            style: MaaruStyle.text.tiniest,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ])));
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }
}
