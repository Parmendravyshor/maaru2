import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(children: [
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            controller: _textEditingController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]),
              ),
              // labelText: "Date of birth",
              hintText: 'mm/dd/year',hintStyle: MaaruStyle.text.greyDisable,
              prefixIcon:
                  Icon(Icons.calendar_today_outlined, color: MaaruColors.primaryColorsuggesion),
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
        ]));
  }

  _selectDate(BuildContext context) async {
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
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
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

      daysOfWeekStyle:
      DaysOfWeekStyle(decoration: BoxDecoration(color: Colors.green),),


              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,holidays) {
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
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)
                ),
                child: Center(
                    child: Text(event,
                      style: TextStyle(color: Colors.blue,
                          fontWeight: FontWeight.bold,fontSize: 16),)
                ),
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


List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(
    json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
  Appointment({
    this.date,
    this.dateChange,
    this.dateCreate,
    this.detail,
    this.duration,
    this.id,
    this.note,
    this.status,
    this.title,
    this.uid,
  });

  DateTime date;
  DateTime dateChange;
  DateTime dateCreate;
  String detail;
  int duration;
  String id;
  String note;
  String status;
  String title;
  String uid;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    date: DateTime.parse(json["date"]),
    dateChange: DateTime.parse(json["date_change"]),
    dateCreate: DateTime.parse(json["date_create"]),
    detail: json["detail"],
    duration: json["duration"],
    id: json["id"],
    note: json["note"],
    status: json["status"],
    title: json["title"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "date_change": dateChange.toIso8601String(),
    "date_create": dateCreate.toIso8601String(),
    "detail": detail,
    "duration": duration,
    "id": id,
    "note": note,
    "status": status,
    "title": title,
    "uid": uid,
  };
}

class Appointments extends StatefulWidget {
  const Appointments({Key key}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with TickerProviderStateMixin {
  var _calendarController;
  Map<DateTime, List> _events;
  List<Appointment> _samemonthevents = List<Appointment>();
  AnimationController _animationController;
  DateTime current = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = Map<DateTime, List>();
    _calendarController = CalendarController();

    getSameMonthAppointments();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  getSameMonthAppointments() async {
    String jsonString = '''
    [
  {
    "date": "2020-09-01T11:15:00Z",
    "date_change": "2018-05-14T10:17:40Z",
    "date_create": "2018-05-14T10:17:40Z",
    "detail": "Inflisaport Insertion",
    "duration": 15,
    "id": "2",
    "note": "Looking forward to see you! Take care",
    "status": "CONFIRMED",
    "title": "Private Hospital",
    "uid": "1"
  },
  {
    "date": "2020-09-22T01:15:00Z",
    "date_change": "2018-05-14T10:17:40Z",
    "date_create": "2018-05-14T10:17:40Z",
    "detail": "Inflisaport Insertion",
    "duration": 15,
    "id": "2",
    "note": "Looking forward to see you! Take care",
    "status": "CONFIRMED",
    "title": "Private Hospital",
    "uid": "1"
  },
  {
    "date": "2020-10-01T07:15:00Z",
    "date_change": "2018-05-14T10:17:40Z",
    "date_create": "2018-05-14T10:17:40Z",
    "detail": "Inflisaport Insertion",
    "duration": 15,
    "id": "2",
    "note": "Looking forward to see you! Take care",
    "status": "CONFIRMED",
    "title": "Private Hospital",
    "uid": "1"
  },
  {
    "date": "2020-10-22T09:15:00Z",
    "date_change": "2018-05-14T10:17:40Z",
    "date_create": "2018-05-14T10:17:40Z",
    "detail": "Inflisaport Insertion",
    "duration": 15,
    "id": "2",
    "note": "Looking forward to see you! Take care",
    "status": "CONFIRMED",
    "title": "Private Hospital",
    "uid": "1"
  },
  {
    "date": "2020-10-30T10:15:00Z",
    "date_change": "2018-05-14T10:17:40Z",
    "date_create": "2018-05-14T10:17:40Z",
    "detail": "Inflisaport Insertion",
    "duration": 15,
    "id": "2",
    "note": "Looking forward to see you! Take care",
    "status": "CONFIRMED",
    "title": "Private Hospital",
    "uid": "1"
  }
]
    ''';

    // http.Response response = http.Response(jsonString, 200);
    // if (response.statusCode == 200) {
    //   _samemonthevents = appointmentFromJson(response.body);
    // }
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      current = first;
    });
    print('CALLBACK: _onVisibleDaysChanged first ${first.toIso8601String()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60.0),
//           child: AppBar(
//             leading: IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 color: Colors.black,
//                 onPressed: () {
//                   setState(() {});
//                   /* Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => MainPage()));*/
//                 }),
//             centerTitle: true,
//             title: Text("Appointment", style: TextStyle(color: Colors.black)),
//             backgroundColor: Colors.white,
//             brightness: Brightness.light,
//             automaticallyImplyLeading: false,
// //          backgroundColor: Color(0x44000000),
//             elevation: 0.5,
//             actions: <Widget>[
//               IconButton(
//                 color: Colors.black,
//                 icon: Icon(Icons.list),
//                 onPressed: () {
//                   setState(() {});
//                   /* Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => AppointmentList()));*/
//                 },
//               )
//             ],
//           ),
//         ),
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
      calendarController: _calendarController,
      events: _events,
      //holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,

      startingDayOfWeek:
      StartingDayOfWeek.sunday,
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
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MaaruColors.primaryColorsuggesion1,
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(width: 2, color: MaaruColors.primaryColorsuggesion1)),
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
          return Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: MaaruColors.primaryColorsuggesion1,
                borderRadius: BorderRadius.circular(36.0),
                border: Border.all(width: 2, color: MaaruColors.primaryColorsuggesion1)),
            child: Text(
              '${date.day}',
              style:MaaruStyle.text.greyDisable
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

//   Widget _buildsameMonthEventList() {
//     var _samemontheventsFilter = _samemonthevents.where((element) =>
//     element.date.year == current.year &&
//         element.date.month == current.month);
//
//     return Scaffold(
// //         appBar: PreferredSize(
// //           preferredSize: Size.fromHeight(22.0),
// //           child: AppBar(
// //             centerTitle: true,
// //             title: Text("",
// //                 style: TextStyle(color: Colors.black, fontSize: 18)),
// //             backgroundColor: Colors.white,
// //             //brightness: Brightness.light,
// //           //  automaticallyImplyLeading: false,
// // //          backgroundColor: Color(0x44000000),
// //           //  elevation: 0.5,
// //           ),
//
//         body: (_samemontheventsFilter.length == 0)
//             ? Text("",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black, fontSize: 16))
//             : ListView(
//             children: _samemontheventsFilter
//                 .map((event) => Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.8),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 margin: const EdgeInsets.symmetric(
//                     horizontal: 8.0, vertical: 4.0),
//                 child: (event is Appointment)
//                     ? ListTile(
//                   leading: SizedBox(
//                     width: 90,
//                     child: Column(children: <Widget>[
//                       //Show Weekday, Month and day of Appiontment
//                       Text(
//                           DateFormat('EE').format(event.date) +
//                               '  ' +
//                               DateFormat.MMMd().format(event.date),
//                           style: TextStyle(
//                             color: Colors.blue.withOpacity(1.0),
//                             fontWeight: FontWeight.bold,
//                           )),
//                       //Show Start Time of Appointment
//                       Text(DateFormat.jm().format(event.date),
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             height: 1.5,
//                           )),
//                       //Show End Time of Appointment
//                       Text(
//                         DateFormat.jm().format(event.date.add(
//                             Duration(
//                                 minutes: event.duration ?? 0))),
//                         style: TextStyle(
//                             color: Colors.black.withOpacity(0.6)),
//                       ),
//                     ]),
//                   ), //Text(DateFormat.Hm().format(event.date)),//DateFormat.Hm().format(now)
//                   title: Text(event.title),
//                   trailing: event.status == 'UNCONFIRMED'
//                       ? Column(children: <Widget>[
//                     //event.status=='CONFIRMED' ?
//                     Icon(Icons.error,
//                         color: Colors.pink,
//                         //size:25.0,
//                         semanticLabel:
//                         'Unconfirmed Appointment'), //:Container(width:0,height:0),
//                     Icon(Icons.arrow_right),
//                   ])
//                       : Icon(Icons.arrow_right),
//                   onTap: () {
//                     setState(() {});
//                     /* Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 AppointmentDetail(event)));*/
//                   },
//                 )
//                     : null))
//                 .toList()));
//   }
}