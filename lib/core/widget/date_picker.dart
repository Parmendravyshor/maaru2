import 'dart:convert';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {
  final String textEditingController;

  const DatePicker({Key key, this.textEditingController}) : super(key: key);
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate;
  TextEditingController _ageType;
  TextEditingController textEditingController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(children: [
          GestureDetector(
            child: TextFormField(
              style: MaaruStyle.text.tiny,
              focusNode: AlwaysDisabledFocusNode(),
              controller: textEditingController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MaaruColors.textfeildline),
                ),
                // labelText: "Date of birth",
                hintText: 'BIRTH DATE', hintStyle: MaaruStyle.text.tiny,
              ),
              onSaved: (text) {
                BlocProvider.of<PetProfileBloc>(context)
                    .add(BirthChanged(textEditingController.text));
              },
              onTap: () {
                _selectDate(context);
              },
              onChanged: (text){
                BlocProvider.of<PetProfileBloc>(context)
                    .add(BirthChanged(textEditingController.text));
              },
              onFieldSubmitted: (text){
                BlocProvider.of<PetProfileBloc>(context)
                    .add(BirthChanged(textEditingController.text));
              },
              onEditingComplete: () {
                BlocProvider.of<PetProfileBloc>(context)
                    .add(BirthChanged(textEditingController.text));
                print('datepicker on editing complete');
              },
            ),
          )
        ]));
  }

  _selectDate(
    BuildContext context,
  ) async {
    final _PetProfileBloc = BlocProvider.of<PetProfileBloc>(context);
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
      textEditingController
        ..text =
            "${_selectedDate.month.toString()}-${_selectedDate.day.toString().padLeft(2, '0')}-${_selectedDate.year.toString().padLeft(2, '0')}"
        //   .format(_selectedDate).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: textEditingController.text.length,
            affinity: TextAffinity.upstream));
      BlocProvider.of<PetProfileBloc>(context)
          .add(BirthChanged(textEditingController.text));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Flutter Dynamic Event Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  //  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(color: Colors.green),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events, holidays) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //  color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      event,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                )),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add),
      //   onPressed: _showAddDialog,
      // ),
    );
  }
//
// _showAddDialog() async {
//   await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.white70,
//         title: Text("Add Events"),
//         content: TextField(
//           controller: _eventController,
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//             onPressed: () {
//               if (_eventController.text.isEmpty) return;
//               setState(() {
//                 if (_events[_controller.selectedDay] != null) {
//                   _events[_controller.selectedDay]
//                       .add(_eventController.text);
//                 } else {
//                   _events[_controller.selectedDay] = [
//                     _eventController.text
//                   ];
//                 }
//                 prefs.setString("events", json.encode(encodeMap(_events)));
//                 _eventController.clear();
//                 Navigator.pop(context);
//               });

//       },
//     )
//   ],
// ));
}
//}

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() {
    return CalendarScreenState();
  }
}

class CalendarScreenState extends State<CalendarScreen> {
  CalendarController controller = CalendarController();

  var arr = new List(7);
  @override
  Widget build(BuildContext context) {
    var arr;
    arr[0] = "Mon";
    arr[1] = "Tue";
    arr[2] = "Wed";
    arr[3] = "Thu";
    arr[4] = "Fri";
    arr[5] = "Sat";
    arr[6] = "Sun";
    return Scaffold(
        body: Center(
      child: TableCalendar(
        calendarController: controller,
        initialCalendarFormat: CalendarFormat.week,
        headerVisible: false,
        builders: CalendarBuilders(
          // week days
          dowWeekdayBuilder: (context, weekday) {
            return Container();
          },
          // dates
          dayBuilder: (context, date, events) {
            print(date.month);
            return Container(
              //  color: Colors.green,
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  border: Border.all(color: const Color(0xffd6edff), width: 1)),

              child: Column(
                children: [
                  _showDate(date),
                  _showWeek(date),
                ],
              ),

              // ),
              // )),
            );
            //);
          },
        ),
      ),
    ));
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




class Appointments extends StatefulWidget {
  final String date2;
    const Appointments(this.date2);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with TickerProviderStateMixin {
  var calendarController;
 // Map<DateTime, List> _events;
  AnimationController animationController;
 // DateTime current = DateTime.now();

  @override
  void initState() {
    super.initState();
   // _events = Map<DateTime, List>();
    calendarController = CalendarController();

   // getSameMonthAppointments();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    calendarController.dispose();
    super.dispose();
  }

  // getSameMonthAppointments() async {
  //
  // }
  //
  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      //current = first;
    });
    print('CALLBACK: _onVisibleDaysChanged first ${first.toIso8601String()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Builder(builder: (BuildContext context) {
          return Column(children: <Widget>[
            _buildTableCalendarWithBuilders(),
            const SizedBox(height: 8.0),
            const SizedBox(height: 8.0),
            //_buildEventList()
            //_buildsameMonthEventList()
            // Expanded(child: _buildsameMonthEventList()),
          ]);
        }));
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      calendarController: calendarController,
   //   events: _events,
      //holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,

      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {CalendarFormat.month: ''},

      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.grey[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.grey[800]),
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.grey[800]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
           var date2 = '${date.month.toString()}-${date.day.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')}';
          print(date2);
          BlocProvider.of<BookAppointmentBloc>(context)
              .add(dateChanged(date2.toString(),''));
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MaaruColors.blueColor,
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(width: 2, color: MaaruColors.blueColor)),
              child: Text(
                '${date.day}',

                style: TextStyle().copyWith(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

            ),
          );

        },
        todayDayBuilder: (context, date, _) {
          var date1 = '${date.month.toString()}-${date.day.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')}';
          print(date1);

          return Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MaaruColors.blueColor,
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(width: 2, color: MaaruColors.blueColor)),
              child: Text('${date.day}', style: MaaruStyle.text.greyDisable
                  //   TextStyle().copyWith(
                  //       fontSize: 20.0,
                  //       color: Colors.grey[100],
                  //       fontWeight: FontWeight.bold),
                  // ),
                  ));
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          border: Border.all(width: 2, color: Colors.green[300])),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }
}
