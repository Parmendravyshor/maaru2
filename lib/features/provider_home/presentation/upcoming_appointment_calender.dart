import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'package:maru/core/theme/maaru_style.dart';

import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import 'bloc/provider_home_bloc.dart';
import 'create_provider_home.dart';

class UpcomingAppointmentCalender extends StatefulWidget {
  String text;

  @override
  _UpcomingAppointmentCalenderState createState() =>
      _UpcomingAppointmentCalenderState();
}

class _UpcomingAppointmentCalenderState
    extends State<UpcomingAppointmentCalender> {
  String limit = '';
  String page = '';
  String date = '';
  String service = '';
  String provider = '';
  String name = '';
  TextEditingController _textEditingController;
////
  CalendarController controller = CalendarController();
  var arr = new List(7);
  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
        backgroundColor: MaaruColors.whiteColor,
        bottomNavigationBar: CreateProviderHome(
            selectedIndex: 1,
            Color1: selectedIndex == 1
                ? Colors.grey[300]
                : MaaruColors.textButtonColor),
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
            child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
                builder: (context, state) {
              if (state is BookAppointmentInitial) {
                BlocProvider.of<BookAppointmentBloc>(context)
                    .add(DeclineRequestChanged(_textEditingController.text,''));
                // print('figffgfg${text}');
                return const Center(child: CircularProgressIndicator());
              } else if (state is GGetDeclineRequestData) {
                return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowLocation(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Flexible(
                                  child: TextField(
                                    // cursorColor: Colors.black,
                                   textInputAction:TextInputAction.search ,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.7),
                                            borderSide: BorderSide(
                                                color: Colors.grey[300],
                                                width: 1.0)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[300],
                                                width: 1.0)),
                                        hintText: 'Search',
                                        hintStyle: MaaruStyle.text.greyDisable,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 15.0, 25.0, 10.0),
                                        fillColor: Colors.white,
                                        suffixIcon:
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              BlocProvider.of<BookAppointmentBloc>(context)
                                                  .add(DeclineRequestChanged(_textEditingController.text,''));
                                            });
                                          },
                                          child: Image.asset(
                                            'assets/icons/icone-setting-19.png',
                                            height: 50,
                                            // width: 30,
                                          ),
                                        )),
                                    onChanged: (text){
                                      BlocProvider.of<BookAppointmentBloc>(context)
                                          .add(DeclineRequestChanged(_textEditingController.text,''));
                                    },
                                    onSubmitted: (text){
                                      BlocProvider.of<BookAppointmentBloc>(context)
                                          .add(DeclineRequestChanged(_textEditingController.text,''));
                                    },

                                    controller: _textEditingController,
                                  ),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) =>
                                              UpcomingAppointmentCalender1()));
                                    },
                                    child: Image.asset(
                                      'assets/icons/icone-setting-40.png',
                                      height: 40,
                                    )),
                              ])),
                      Container(
                          height: 440,
                          width: 400,
                          color: Colors.white,

                           child: Appointments(widget.text)),
                  //Container(
                          //   height: 440, width: 400, child:  TableCalendar(
                          //   calendarController: controller,
                          //   initialCalendarFormat: CalendarFormat.week,
                          //   headerVisible: false,
                          //   builders: CalendarBuilders(
                          //     // week days
                          //     dowWeekdayBuilder: (context, weekday) {
                          //       return Container();
                          //     },
                          //     // dates
                          //     dayBuilder: (context, date, events) {
                          //       print(date.month);
                          //       return Container(
                          //         //  color: Colors.green,
                          //         margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.all(Radius.circular(6)),
                          //             border: Border.all(color: const Color(0xffd6edff), width: 1)),
                          //
                          //         child: Column(
                          //           children: [
                          //             _showDate(date),
                          //             _showWeek(date),
                          //           ],
                          //         ),
                          //
                          //         // ),
                          //         // )),
                          //       );
                          //       //);
                          //     },
                          //   ),
                          // ),),),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, right: 0),
                          child: Text(
                            'Upcoming Appointment',
                            style: MaaruStyle.text.tiniest,
                          )),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state
                              .upcomingPastAppointmentModel.cancelled.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(10),
                              height: 170,
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: Colors.grey)),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: Image.network('',
                                              //state.getProviderRequestModel.appointmentRequests[index].userImg.toString(),
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                            return Container(
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                    'assets/images/kutta.png'));
                                          })),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .cancelled[index]
                                                    .companyName
                                                    ,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                state
                                                    .upcomingPastAppointmentModel
                                                    .cancelled[index]
                                                    .service
                                                    ,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                '1357 Muno Manor',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                'Austin,Tx 75923',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.calendar_today_outlined,
                                              size: 22,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: 36,
                                            ),
                                            Text(
                                              '',
                                              //state.getProviderRequestModel.appointmentRequests[index].bookingDate.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              '',
                                              //   state.getProviderRequestModel.appointmentRequests[index]
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 220),
                                    child: Container(
                                      alignment: Alignment.center,
                                      //  padding: EdgeInsets.only(right: 80),
                                      height: 35,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          color: MaaruColors.blueColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: const Text(
                                        'View Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          }),
                    ],
                  )),
                );
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }

  Widget _showDate(DateTime date) {
    return Container(
        padding: EdgeInsets.all(2), child: Text(arr[date.weekday - 1]));
  }

  Widget _showWeek(DateTime date) {
    return Card(
        elevation: 14,
        child:
        Container(padding: EdgeInsets.all(2), child: Text('${date.day}')));
  }
}
