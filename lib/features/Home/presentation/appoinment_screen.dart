
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
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
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/Home/presentation/chat_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'message.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
      BlocProvider.of<BookAppointmentBloc>(context).add(UpcomingAppointmentChanged(
          _textEditingController.text,
          '',

        ));
      print(_textEditingController.text);
    }
  }

  DateTime _selectedDate;
  TextEditingController _ageType;
  TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _appointmentController = TextEditingController();
  @override
  void initState() {
    _ageType = TextEditingController();
    _selectedDate = _selectedDate;
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _ageType.dispose();
    _appointmentController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
          ),
      body:
      BlocProvider(
        create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
        child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(builder: (context, state) {
          if (state is BookAppointmentInitial) {
            BlocProvider.of<BookAppointmentBloc>(context).add(
                UpcomingAppointmentChanged(
                  '','',
                ));

            return Center(child: CircularProgressIndicator());
          } else if (state is FetchUpcomingAppointmentModelData) {
            return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10, left: 5),
                          child: ShowLocation()),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 15,
                                        right: 10,
                                      ),
                                      child: TextField(
                                        textInputAction: TextInputAction.search,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.7),
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300],
                                                    width: 1.0)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.7),
                                                borderSide: BorderSide(
                                                    color: Colors.grey[300],
                                                    width: 1.0)),
                                            hintText: 'Search',
                                            hintStyle:
                                                MaaruStyle.text.greyDisable,
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    20.0, 10.0, 20.0, 10.0),
                                            fillColor: Colors.white,
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    BlocProvider.of<BookAppointmentBloc>(
                                                            context)
                                                        .add(
                                                            UpcomingAppointmentChanged(
                                                      _textEditingController.text,_appointmentController.text,
                                                    ));
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/icons/icone-setting-19.png',
                                                  height: 50,
                                                  // width: 30,
                                                ))),
                                        // onSubmitted: (text) {
                                        //   if (mounted) {
                                        //     BlocProvider.of<BookAppointmentBloc>(context)
                                        //         .add(
                                        //             UpcomingAppointmentChanged(
                                        //       _textEditingController.text,_appointmentController.text,
                                        //     ));
                                        //   }
                                        // },
                                        onChanged: (text){
                                          BlocProvider.of<BookAppointmentBloc>(context)
                                              .add(
                                              UpcomingAppointmentChanged(
                                                '',_appointmentController.text,
                                              ));
                                        },
                                        controller: _appointmentController,
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      _selectDate(context);

                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Image.asset(
                                      'assets/icons/icon-bl-19.png',
                                      height: 40,
                                    ),
                                  ),
                                )
                              ])),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Upcoming Appoinments',
                          style: MaaruStyle.text.tiny,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: state.upcomingPastAppointmentModel
                              .upcomingBookings.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProviderBookedConfirm()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 15,bottom: 15),
                                child: Container(
                                  height: 150,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MaaruColors.textfeildline)),
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: Image.asset(
                                            'assets/images/kutta.png',
                                            height: 200,
                                          ),
                                        )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  state
                                                      .upcomingPastAppointmentModel
                                                      .upcomingBookings[index]
                                                      .companyName
                                                      .toString(),
                                                  style: MaaruStyle.text.tiny),
                                              Text(
                                                  state
                                                      .upcomingPastAppointmentModel
                                                      .upcomingBookings[index]
                                                      .serviceName
                                                      .toString(),
                                                  style:
                                                      MaaruStyle.text.medium),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                  '${state.upcomingPastAppointmentModel.upcomingBookings[index].companyZipCode.toString()}${state.upcomingPastAppointmentModel.upcomingBookings[index].companyState.toString()}',
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey)),
                                              Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .upcomingBookings[index]
                                                    .companyCity
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11),
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
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.calendar_today_outlined,
                                                size: 22,
                                                color: Colors.yellow,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.06,
                                              ),
                                              Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .upcomingBookings[index]
                                                    .bookingDate
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11),
                                              ),
                                              Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .upcomingBookings[index]
                                                    .bookingTime,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Past Appoinments',
                          style: MaaruStyle.text.tiny,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.upcomingPastAppointmentModel
                              .pastBookings.length,
                          itemBuilder: (BuildContext context, int index) {
                            if(state.upcomingPastAppointmentModel
                                .pastBookings.length = null){
                              return Text('Not Appointment Found');
                            }
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15,bottom: 15),
                              child: Container(
                                height: size.height * 0.18,
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MaaruColors.textfeildline)),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'assets/images/kutta.png',
                                          height: 200,
                                        ),
                                      )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .pastBookings[index]
                                                    .companyName
                                                    .toString(),
                                                style: MaaruStyle.text.tiny),
                                            Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .pastBookings[index]
                                                    .serviceName
                                                    .toString(),
                                                style: MaaruStyle.text.medium),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '${state.upcomingPastAppointmentModel.pastBookings[index].companyZipCode.toString()}'
                                              '${state.upcomingPastAppointmentModel.pastBookings[index].companyState.toString()}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11),
                                            ),
                                            Text(
                                              state
                                                  .upcomingPastAppointmentModel
                                                  .pastBookings[index]
                                                  .companyCity
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11),
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
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Icon(
                                              Icons.calendar_today_outlined,
                                              size: 22,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.06,
                                            ),
                                            Text(
                                              state
                                                  .upcomingPastAppointmentModel
                                                  .pastBookings[index]
                                                  .bookingDate
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11),
                                            ),
                                            Text(
                                              state
                                                  .upcomingPastAppointmentModel
                                                  .pastBookings[index]
                                                  .bookingTime
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
//
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20),
//                     child: Text(
//                       'Past Appoinments'.toUpperCase(),
//                       style: MaaruStyle.text.tiny,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20, right: 15),
//                     child: Container(
//                       height: size.height * 0.18,
//                       width: 400,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: MaaruColors.textfeildline)),
//                       child: Container(
//                         margin: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 child: Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                               ),
//                               child: Image.asset(
//                                 'assets/images/kutta.png',
//                                 height: 200,
//                               ),
//                             )),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Austin pet care'.toUpperCase(),
//                                       style: MaaruStyle.text.tiny),
//                                   Text('Pet walking'.toUpperCase(),
//                                       style: MaaruStyle.text.medium),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text(
//                                     '1357 Muno Manor'.toUpperCase(),
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 11),
//                                   ),
//                                   Text(
//                                     'Austin,Tx 75923'.toUpperCase(),
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 11),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                                 //width: 40,
//                                 ),
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Icon(
//                                     Icons.calendar_today_outlined,
//                                     size: 22,
//                                     color: Colors.yellow,
//                                   ),
//                                   SizedBox(
//                                     height: size.height * 0.06,
//                                   ),
//                                   Text(
//                                     'Aug 21,2021'.toUpperCase(),
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 11),
//                                   ),
//                                   Text(
//                                     '12:00 am'.toUpperCase(),
//                                     style: TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
// >>>>>>> f38077fb070e945e12e76eb4c96ccef8ae6ff65f
                              ),
                            );
                          }),
                    ])));
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
