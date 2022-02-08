import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/booked_confirm.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_calender.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_screen.dart';
import 'package:maru/features/provider_setting/presentation/provider_settin.dart';
import 'bloc/provider_home_bloc.dart';
import 'create_provider_home.dart';
import 'package:flutter/scheduler.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  DateTime _date = DateTime.now();
  int cntwidth = 0;
  _selectDate(
    BuildContext context,
  ) async {
    // final _PetProfileBloc = BlocProvider.of<PetProfileBloc>(context);
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: Colors.deepPurple,
            onPrimary: Colors.white,
            surface: Colors.blueGrey,
            onSurface: Colors.yellow,
          ),
          dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text =
            "${_selectedDate.month.toString()}-${_selectedDate.day.toString().padLeft(2, '0')}-${_selectedDate.year.toString().padLeft(2, '0')}"
        //   .format(_selectedDate).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
      BlocProvider.of<ProviderHomeBloc>(context).add(getProviderRequest(
        page,
        date,
        date,
        _textEditingController.text
      ));

    }
  }

  DateTime _selectedDate;
  TextEditingController _ageType;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _ageType = TextEditingController();
    _selectedDate = _selectedDate;
    super.initState();
  }
  @override
  void dispose() {
    _ageType.dispose();
    super.dispose();
  }
  String limit = '';
  String page = '';
  String date = '';
  String service = '';
  String provider = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var selectedIndex;
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<ProviderHomeBloc>(),
      child: BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
        builder: (context, state) {
          if (state is AcceptRequestSuccessful) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return UpcomingAppointmentCalender1();
              }));
            });
            return Container();
          }
          return Scaffold(
              backgroundColor: MaaruColors.whiteColor,
              bottomNavigationBar: CreateProviderHome(
                selectedIndex: 0,
                Color: selectedIndex == 0
                    ? Colors.grey[300]
                    : MaaruColors.textButtonColor,
              ),
              body: BlocProvider(
                  create: (context) =>
                      KiwiContainer().resolve<ProviderHomeBloc>(),
                  child: BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
                      builder: (context, state) {
                    if (state is ProviderHomeInitial) {
                      BlocProvider.of<ProviderHomeBloc>(context)
                          .add(getProviderRequest(
                        _ageType.text,
                        _ageType.text,
                        _ageType.text,
                        _textEditingController.text,
                      ));
                      // print('figffgfg${text}');
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RequestLoaded) {
                      //  print(
                      // 'datarequestfprcheckeinguseingstaat${state.getProviderRequestModel.appointmentRequests.length}');
                      return SingleChildScrollView(
                        child: SafeArea(
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProviderSetting()));
                            },child: ShowLocation()),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              child: Flexible(
                                            child: TextField(
                                              // cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.grey[300],
                                                          width: 1.0)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.grey[300],
                                                          width: 1.0)),
                                                  hintText: 'Search',
                                                  hintStyle: MaaruStyle
                                                      .text.greyDisable,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0,
                                                          15.0,
                                                          25.0,
                                                          10.0),
                                                  fillColor: Colors.white,
                                                  suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          service = 'grooming';
                                                          print(
                                                              'dhdgdhdhdhdghdgdhgd$service');
                                                          BlocProvider.of<
                                                                      ProviderHomeBloc>(
                                                                  context)
                                                              .add(getProviderRequest(
                                                                  _ageType.text,
                                                                  _ageType.text,
                                                                  _ageType.text,
                                                                  _textEditingController
                                                                      .text));
                                                        });
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/icone-setting-19.png',
                                                        height: 50,
                                                        // width: 30,
                                                      ))),
                                              onChanged: (text) {
                                                setState(() {
                                                  BlocProvider.of<
                                                              ProviderHomeBloc>(
                                                          context)
                                                      .add(getProviderRequest(
                                                    _ageType.text,
                                                    _ageType.text,
                                                    _ageType.text,
                                                    '',
                                                  ));
                                                  print(_ageType);
                                                });
                                              },
                                              // onSubmitted: (text) {
                                              //   setState(() {
                                              //     BlocProvider.of<
                                              //                 ProviderHomeBloc>(
                                              //             context)
                                              //         .add(getProviderRequest(
                                              //       _ageType.text,
                                              //       _ageType.text,
                                              //       _ageType.text,
                                              //       _textEditingController.text,
                                              //     ));
                                              //     print(_ageType);
                                              //   });
                                              // },
                                              controller: _ageType,
                                            ),
                                          )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                _selectDate(context);
                                                BlocProvider.of<
                                                            ProviderHomeBloc>(
                                                        context)
                                                    .add(getProviderRequest(
                                                  _ageType.text,
                                                  _ageType.text,
                                                  _ageType.text,
                                                  _textEditingController.text,
                                                ));
                                              },
                                              child: Image.asset(
                                                'assets/icons/New Project (36).png',
                                                height: 40,
                                              )),
                                        ])),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
state.getProviderRequestModel.appointmentRequests.isNotEmpty?
                           ListView.builder(
                                    physics:
                                        NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    reverse: true,
                                    itemCount: state
                                        .getProviderRequestModel
                                        .appointmentRequests
                                        .length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      if(state.getProviderRequestModel.appointmentRequests.isNotEmpty) {
                                        var a = state
                                            .getProviderRequestModel
                                            .appointmentRequests;

                                        return Slidable(
                                            actionPane:
                                            SlidableDrawerActionPane(),
                                            actions: <Widget>[
                                              Stack(children: [
                                                IconSlideAction(
                                                  caption: 'Accept',
                                                  color: Colors.blue,
                                                  icon: Icons.done,
                                                  onTap: () {
                                                    BlocProvider.of<
                                                        ProviderHomeBloc>(
                                                        context)
                                                        .add(
                                                        AcceptRequested(
                                                            state
                                                                .getProviderRequestModel
                                                                .appointmentRequests[
                                                            index]
                                                                .id));
                                                    Navigator.of(
                                                        context).push(
                                                        MaterialPageRoute(
                                                            builder: (
                                                                _) =>
                                                                UpcomingAppointmentCalender1()));
                                                  },
                                                ),
                                              ])
                                            ],
                                            secondaryActions: <Widget>[
                                              IconSlideAction(
                                                caption: 'Delete',
                                                color: Colors.red,
                                                icon: Icons.delete,
                                                onTap: () {
                                                  BlocProvider.of<
                                                      ProviderHomeBloc>(
                                                      context)
                                                      .add(Decline(state
                                                      .getProviderRequestModel
                                                      .appointmentRequests[
                                                  index]
                                                      .id));
                                                  Navigator.of(context)
                                                      .push(
                                                      MaterialPageRoute(
                                                          builder: (
                                                              _) =>
                                                              UpcomingAppointmentCalender1()));
                                                },
                                              ),
                                            ],
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  bottom: 15,top: 10),
                                              child:
                                              Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(top: 10,right: 10),
                                                        height: 150,
                                                        decoration: BoxDecoration(
                                                            border: Border
                                                                .all(
                                                                color: Colors
                                                                    .grey[
                                                                200])),
                                                        child:
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize
                                                              .min,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 15.0),
                                                                    child: Text(
                                                                        state
                                                                            .getProviderRequestModel
                                                                            .appointmentRequests[index]
                                                                            .companyName
                                                                            .toString(),
                                                                        style:
                                                                        MaaruStyle
                                                                            .text
                                                                            .tiniest,
                                                                        textAlign: TextAlign
                                                                            .justify),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                  10,
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                    Alignment
                                                                        .centerRight,
                                                                    child:
                                                                    Text(

                                                                        '${state
                                                                            .getProviderRequestModel
                                                                            .appointmentRequests[index]
                                                                            .bookingDate.year.toString()}-${state
                                                                            .getProviderRequestModel
                                                                            .appointmentRequests[index]
                                                                            .bookingDate.month.toString()}-${state
                                                                            .getProviderRequestModel
                                                                            .appointmentRequests[index]
                                                                            .bookingDate.day.toString()}'),

                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                               Expanded(child: Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15.0),
                                                                  child:
                                                                  Text(
                                                                    state
                                                                        .getProviderRequestModel
                                                                        .appointmentRequests[index]
                                                                        .service
                                                                        .toString(),
                                                                    style:
                                                                    MaaruStyle
                                                                        .text
                                                                        .tiniest,
                                                                  ),
                                                                )),
                                                                const SizedBox(
                                                                  width:
                                                                  20,
                                                                ),
                                                                Text(
                                                                  state
                                                                    .getProviderRequestModel
                                                                    .appointmentRequests[index]
                                                                    .bookingStartTime
                                                                    .toString(),)
                                                              ],
                                                            ),
                                                            Expanded(

                                                              child: Align(
                                                                  alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                                  child:
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 15.0),
                                                                    child:
                                                                    Text(
                                                                        '${state
                                                                            .getProviderRequestModel
                                                                            .appointmentRequests[index]
                                                                            .companyCity
                                                                            .toString()} ${a[index]
                                                                            .companyZipCode
                                                                            .toString()} ${a[index]
                                                                            .companyState
                                                                            .toString()}'),
                                                                  )),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment: Alignment.centerRight,
                                                                child: Container(
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    transformAlignment: Alignment.centerRight,
                                                                    margin: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                        120,bottom: 10),
                                                                    height:
                                                                    35,
                                                                    width:
                                                                    150,
                                                                    decoration: BoxDecoration(
                                                                        color: MaaruColors
                                                                            .blueColor,
                                                                        borderRadius: BorderRadius
                                                                            .circular(
                                                                            10.7),
                                                                        border:
                                                                        Border
                                                                            .all(
                                                                            color: Colors
                                                                                .white)),
                                                                    child: InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator
                                                                            .of(
                                                                            context)
                                                                            .push(
                                                                            MaterialPageRoute(
                                                                                builder: (
                                                                                    _) =>
                                                                                BookedConfirm(id4: state.getProviderRequestModel.appointmentRequests[index].id,)));
                                                                      },
                                                                      child:
                                                                      const Text(
                                                                        'View Details',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w700),
                                                                      ),
                                                                    )),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      //Text('Item Data$index'),
                                                    ),
                                                  ]),
                                            ));

                              } else {
                                return const CircularProgressIndicator();
                              }
                            }):const Center(child: Text('No data found')),
                          ]),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })));
        },
      ),
    );
  }
}
