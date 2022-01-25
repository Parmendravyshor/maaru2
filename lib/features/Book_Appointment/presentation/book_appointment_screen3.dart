import 'dart:math';
import 'dart:ui';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/dialog.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Account_setting/presentation/payment/bloc/payment_bloc.dart';
import 'package:maru/features/Account_setting/presentation/payment/input_formetters.dart';
import 'package:maru/features/Account_setting/presentation/payment/my_strings.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_card_details.dart';
import 'package:maru/features/Book_Appointment/presentation/booked_confirm.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/dialog.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Account_setting/presentation/payment/bloc/payment_bloc.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_card_details.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_screen.dart';

import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';

import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Book_Appointment/presentation/reviewe_screen.dart';
import 'package:maru/features/Home/presentation/chat_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/provider_home/presentation/provider_hat_sreen.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart'
    as event;
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:table_calendar/table_calendar.dart';
import 'bloc/book_appointment_bloc.dart';
import 'bloc/book_appointment_bloc.dart';
import 'bloc/book_appointment_bloc.dart';
import 'book_appointment_screen2.dart';
import 'booked_confirm.dart';

//enum Use { good, after }

class BookAppointmentScreen3 extends StatefulWidget {
  final int id3;
  BookAppointmentScreen3({this.id3});
  String text = '';

  @override
  _BookAppointmentScreen3State createState() => _BookAppointmentScreen3State();
}

class _BookAppointmentScreen3State extends State<BookAppointmentScreen3>
    with SingleTickerProviderStateMixin {
  String date1 = '';
  List<KeyValueModel1> _dates1 = [];
  bool enabled = false;
  bool viewVisible1 = false;
  bool viewVisible2 = false;
  String tomer = '';
  bool _status = true;
  String date2;
  Widget card(List<int> list) {
    return Visibility(
        maintainSize: false,
        maintainAnimation: false,
        maintainState: false,
        visible: viewVisible1,
        child: Container(
          height: 40,
          width: 130,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.white,
              icon: Image.asset(
                'assets/images/card_cvv.png',
                width: 25,
                color: Colors.grey[600],
              ),
              border: UnderlineInputBorder(),
              filled: true,
              hintText: 'Number behind the card',
              labelText: 'CVV',
            ),
            validator: CardUtils.validateCVV,
            keyboardType: TextInputType.number,
            onSaved: (value) {
              _paymentCard.cvv = int.parse(value);
            },
            controller: _cvvController,
          ),
        ));
  }

  Widget AddPayment() {
    return Visibility(
      maintainSize: false,
      maintainAnimation: false,
      maintainState: false,
      visible: viewVisible2,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.white,
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(
                Icons.person,
                size: 40.0,
              ),
              hintText: 'What name is written on card?',
              labelText: 'Card Name',
            ),
            onSaved: (String value) {
              _card.name = value;
            },
            keyboardType: TextInputType.text,
            validator: (String value) =>
                value.isEmpty ? Strings.fieldReq : null,
            controller: _nameOnCardController,
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              CardNumberInputFormatter()
            ],
            controller: _creditCardNumberController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hoverColor: Colors.white,
              border: const UnderlineInputBorder(),
              filled: true,
              icon: CardUtils.getCardIcon(_paymentCard.type),
              hintText: 'What number is written on card?',
              labelText: 'Number',
            ),
            onSaved: (String value) {
              print('onSaved = $value');
              print('Num controller has = ${numberController.text}');
              _paymentCard.number = CardUtils.getCleanedNumber(value);
            },
            validator: CardUtils.validateCardNum,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      icon: Image.asset(
                        'assets/images/card_cvv.png',
                        width: 25,
                        color: Colors.grey[600],
                      ),
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: 'Number behind the card',
                      labelText: 'CVV',
                    ),
                    validator: CardUtils.validateCVV,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _paymentCard.cvv = int.parse(value);
                    },
                    controller: _cvvController,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(),
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter()
                    ],
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: Image.asset(
                        'assets/icons/icone-setting-21.png',
                        width: 25,
                        color: Colors.grey[600],
                      ),
                      hintText: 'MM/YY',
                      labelText: 'Expiry Date',
                    ),
                    validator: CardUtils.validateDate,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      List<int> expiryDate = CardUtils.getExpiryDate(value);
                      _paymentCard.month = expiryDate[0];
                      _paymentCard.year = expiryDate[1];
                      print(expiryDate);
                    },
                    controller: _expDateController,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final FocusNode myFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  TextEditingController _expDateController;
  TextEditingController _creditCardNumberController;
  TextEditingController _nameOnCardController;
  TextEditingController _cvvController;
  TextEditingController _bankNameController;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;

  var _card = new PaymentCard();
  TextEditingController _nameEditingController;
  TextEditingController _controller;
  double _scale;

  //Use SelectedUSe = Use.good;
  List<bool> isSelected;
  bool pressed = true;
  String text1;
  void showWidget() {
    setState(() {
      viewVisible1 = true;
    });
  }

  void showPayment() {
    setState(() {
      viewVisible2 = true;
    });
  }

  @override
  void initState() {
    calendarController = CalendarController();

    // getSameMonthAppointments();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationController.forward();
    setState(() {
      _paymentCard.type = CardType.Others;
      numberController.addListener(_getCardTypeFrmNumber);
    });

    super.initState();
  }

  String text;

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  bool pressAttention = true;
  bool _debug = false;
  bool _contextoff = false;
  bool _contextrand = false;

  int _dropDownValue = 0;
  String _selValue = "Select Service";
  String _selValue1 = 'SELECT PET';
  String _selValue2 = 'SELECT PROVIDER';
  int i;
String parmendra = '';
String singh = '';
  var calendarController;
  // Map<DateTime, List> _events;
  AnimationController animationController;
  // DateTime current = DateTime.now();

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      //current = first;
    });
    print('CALLBACK: _onVisibleDaysChanged first ${first.toIso8601String()}');
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget buildTableCalendarWithBuilders() {
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
          date2 =
              'singh${date.month.toString()}-${date.day.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')}';
          print(date2);

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
          date1 =
              '${date.month.toString()}-${date.day.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')}';
          print('gfgffhjgfhj${date1}');
          BlocProvider.of<BookAppointmentBloc>(context)
              .add(dateChanged(date1.toString(), ''));

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // _scale = 1 - _controller1.value;
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
        child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
            builder: (context, state) {
          if (state is BookRegisterSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ChatScreen();
              }));
            });
            return Container();
          } else if (state is BookRegisterFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(seconds: 1), () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(state.errorMessage,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins',
                            fontSize: 20,
                            color: MaaruStyle.colors.textColorWhite)),
                  ),
                );
              });
            });
          }
          return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: const CreateHomeScreen(
                  // Color:MaaruColors.textButtonColor
                  ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Flex(direction: Axis.vertical, children: [
                Column(
                  children: [
                    Container(
                      child: Image.network(
                        _prefHelper.getStringByKey('img', ''),
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                              color: Colors.amber,
                              alignment: Alignment.center,
                              child: Image.asset('assets/images/kutta.png'));
                        },
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            color: Colors.white),
                        height: 250,
                        width: size.width * 1,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            color: Colors.white,
                            //height: size.height*0.80,
                            width: size.width * 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      BookAppointment1(
                                                        id1: widget.id3,
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
                                                      BookAppointment2(
                                                        id2: widget.id3,
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
                                                      BookAppointmentScreen3(
                                                        id3: widget.id3,
                                                      )));
                                        },
                                        child: Image.asset(
                                          'assets/icons/Rectangle copy 3.png',
                                          height: 40,
                                          width: 40,
                                        )),
                                  ],
                                ),
                                BlocProvider(
                                  create: (context) =>
                                      KiwiContainer().resolve<PetProfileBloc>(),
                                  child: BlocBuilder<PetProfileBloc,
                                          PetProfileState>(
                                      builder: (context, state) {
                                    if (state is PetProfileInitial) {
                                      BlocProvider.of<PetProfileBloc>(context)
                                          .add(GetSinglePRovider(widget.id3));

                                      return const CircularProgressIndicator();
                                    } else if (state is SingleProviderLoaded) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            //  mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.welcome4.providerDetails
                                                    .provider.companyName,
                                                style: MaaruStyle.text.tiniest,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.16,
                                              ),
                                              // Image.asset(
                                              //   'assets/icons/New Project (2).png',
                                              //   width: size.width * 0.10,
                                              // )
                                            ],
                                          ),
                                          Text(
                                            '${state.welcome4.providerDetails.provider.city.toString()} '
                                            '${state.welcome4.providerDetails.provider.state} '
                                            '${state.welcome4.providerDetails.provider.zipCode}',
                                            style: MaaruStyle.text.tiny,
                                          ),
                                          Text(
                                            'Book Appointments',
                                            style: MaaruStyle.text.tiniest,
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  }),
                                ),
                              ],
                            )))
                  ],
                ),
                Container(
                    height: 440,
                    width: 400,
                    child: buildTableCalendarWithBuilders()),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Services',
                    style: MaaruStyle.text.tiniest,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: BlocProvider(
                        create: (context) =>
                            KiwiContainer().resolve<PetProfileBloc>(),
                        child: BlocBuilder<PetProfileBloc, PetProfileState>(
                            builder: (context, state) {
                          if (state is PetProfileInitial) {
                            String text = '';
                            BlocProvider.of<PetProfileBloc>(context)
                                .add(GetSinglePRovider(widget.id3));

                            return CircularProgressIndicator();
                          }
                          if (state is SingleProviderLoaded) {
                            var abc2 = [];

                            String _selectedValue =
                                //_prefHelper.getStringByKey(MaruConstant.first_name, '');
                                state.welcome4.providerDetails.service[0]
                                    .serviceId
                                    .toString();
                            for (int i = 0;
                                i <=
                                    state.welcome4.providerDetails.service
                                            .length -
                                        1;
                                i++) {
                              _dates1.add(
                                KeyValueModel1(
                                    key1: state.welcome4.providerDetails
                                        .service[i].service.serviceType
                                        .toString(),
                                    value1: state.welcome4.providerDetails
                                        .service[i].serviceId
                                        .toString()),
                              );
                              abc2.add(state.welcome4.providerDetails.service[i]
                                  .service.serviceType);
                              // print(abc2);
                              // abc2.add(state.covidModel.petProfiles[i]
                              //     .service_cost);
                            }
                            return Container(
                              width: 350,
                              color: Colors.grey[50],
                              alignment: Alignment.center,
                              child: Center(
                                child: DropdownButton(
                                  hint: Text(
                                    _selValue,
                                    style: MaaruStyle.text.tiniest,
                                  ),

                                  icon: Icon(
                                    Icons.expand_more,
                                    color: MaaruColors.textButtonColor,
                                    size: 40.09,
                                  ),
                                  // hint: Center(
                                  //     child: Text(
                                  //   _selectedValue,
                                  //   style: MaaruStyle.text.small,
                                  // )),
                                  isExpanded: false,
                                  iconSize: 30.0,
                                  style: TextStyle(color: Colors.white),
                                  items: _dates1.map(
                                    (val) {
                                      var index;
                                      //    print('singham is on back ${val.value}');
                                      return DropdownMenuItem<String>(
                                        value: val.key1,
                                        child: Center(
                                            child: InkWell(
                                          onTap: () {
                                            singh = val.value1;
                                            print(
                                                'singham is back ${val.value1}');
                                            BlocProvider.of<
                                                        BookAppointmentBloc>(
                                                    context)
                                                .add(PetIdChanged(
                                              val.value1.toString(),
                                            ));
                                            setState(() {
                                              _selValue = val.key1;

                                              print(
                                                  'gdgdhgdhd${val.key1.toString()}');

                                              var valey;
                                              setState(
                                                () {
                                                  _selValue = val.key1;

                                                  if (val.key1 == val.key1) {}
                                                  if (val.key1 ==
                                                      "SELECT PET") {
                                                    _dropDownValue = 0;
                                                    print(_dropDownValue);
                                                  }

                                                  if (val.key1 == "VET") {
                                                    _dropDownValue = 2;
                                                  }
                                                },
                                              );
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text(val.key1,
                                              style: MaaruStyle.text.small),
                                        )),
                                        // value: val.value,
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    _selValue = value;
                                    BlocProvider.of<BookAppointmentBloc>(
                                            context)
                                        .add(PetIdChanged(
                                      value.toString(),
                                    ));
                                    print('gdgdhgdhd${value.toString()}');

                                    var valey;
                                    setState(
                                      () {
                                        _selValue = value;

                                        if (value == value) {}
                                        if (value == "SELECT PET") {
                                          _dropDownValue = 0;
                                          print(_dropDownValue);
                                        }

                                        if (value == "VET") {
                                          _dropDownValue = 2;
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }))),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Pet',
                    style: MaaruStyle.text.tiniest,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: BlocProvider(
                      create: (context) =>
                          KiwiContainer().resolve<PetProfileBloc>(),
                      child: BlocBuilder<PetProfileBloc, PetProfileState>(
                          builder: (context, state) {
                        if (state is PetProfileInitial) {
                          BlocProvider.of<PetProfileBloc>(context)
                              .add(GetCovidList(''));
                          return CircularProgressIndicator();
                        } else if (state is CovidLoaded3) {
                          print(
                              '+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.covidModel.petProfiles}');
                          //
                          List<KeyValueModel> _dates = [];
                          print('dddwddqqdqdd$_dates');
                          var abc2 = [];
                          String _selectedValue =
                              //_prefHelper.getStringByKey(MaruConstant.first_name, '');
                              state.covidModel.petProfiles[0].id.toString();
                          for (int i = 0;
                              i <= state.covidModel.petProfiles.length - 1;
                              i++) {
                            _dates.add(
                              KeyValueModel(
                                  key: state.covidModel.petProfiles[i].petName
                                      .toString(),
                                  value: state.covidModel.petProfiles[i].id
                                      .toString()),
                            );
                            abc2.add(state.covidModel.petProfiles[i].id);
                            // print(abc2);
                            // abc2.add(state.covidModel.petProfiles[i]
                            //     .service_cost);
                          }

                          print(_dates.toString());
                          return Container(
                            width: 350,
                            color: Colors.grey[50],
                            alignment: Alignment.center,
                            child: Center(
                              child: DropdownButton(
                                hint: Text(
                                  _selValue1,
                                  style: MaaruStyle.text.tiniest,
                                ),

                                icon: Icon(
                                  Icons.expand_more,
                                  color: MaaruColors.textButtonColor,
                                  size: 40.09,
                                ),
                                // hint: Center(
                                //     child: Text(
                                //   _selectedValue,
                                //   style: MaaruStyle.text.small,
                                // )),
                                isExpanded: false,
                                iconSize: 30.0,
                                style: TextStyle(color: Colors.white),
                                items: _dates.map(
                                  (val) {
                                    var index;
                                    //    print('singham is on back ${val.value}');
                                    return DropdownMenuItem<String>(
                                      value: val.key,
                                      child: Center(
                                          child: InkWell(
                                        onTap: () {
                                          parmendra = val.value;
                                          print('singham is back ${val.value}');
                                          BlocProvider.of<BookAppointmentBloc>(
                                                  context)
                                              .add(PetIdChanged(
                                            val.value.toString(),
                                          ));
                                          setState(() {
                                            _selValue1 = val.key;

                                            print(
                                                'gdgdhgdhd${val.key.toString()}');

                                            var valey;
                                            setState(
                                              () {
                                                _selValue1 = val.key;

                                                if (val.key == val.key) {}
                                                if (val.key == "SELECT PET") {
                                                  _dropDownValue = 0;
                                                  print(_dropDownValue);
                                                }

                                                if (val.key == "VET") {
                                                  _dropDownValue = 2;
                                                }
                                              },
                                            );
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(val.key,
                                            style: MaaruStyle.text.small),
                                      )),
                                      // value: val.value,
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  _selValue1 = value;
                                  BlocProvider.of<BookAppointmentBloc>(context)
                                      .add(PetIdChanged(
                                    value.toString(),
                                  ));
                                  print('gdgdhgdhd${value.toString()}');

                                  var valey;
                                  setState(
                                    () {
                                      _selValue1 = value;

                                      if (value == value) {}
                                      if (value == "SELECT PET") {
                                        _dropDownValue = 0;
                                        print(_dropDownValue);
                                      }

                                      if (value == "VET") {
                                        _dropDownValue = 2;
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Morning',
                    style: MaaruStyle.text.tiniest,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Container(
                      height: 40,
                      width: 400,
                      child: Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child:
                          ListView(
                              scrollDirection: Axis.horizontal,
                              children:  [
                                ChoiceRow(
                                  lebal1: '10:00 AM',
                                  lebal2: '10:30 AM',
                                  lebal3: '11:00 AM',
                                  lebal4: '11:30 AM',
                                  lebal5: '12:00 AM',
                                ),
                              ]))),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Afternoon',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print('null    jkljkldfjk1');
                      setState(() {
                        // SelectedUSe = Use.good;
                        // if (SelectedUSe == Use.good) {
                        //   var use = 'good';
                        //   print('ass${Use}');
                        // } else {
                        //   print('null1');
                        // }
                      });
                    },

                      child: Container(
                          height: 40,
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children:   [

                                       ChoiceRow(
                                        lebal1: '12:00 PM',
                                        lebal2: '12:30 PM',
                                        lebal3: '01:00 PM',
                                        lebal4: '01:30 PM',
                                        lebal5: '02:00 PM',
                                      ),

                                  ]))),

                  )
                ]),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Booking Cost',
                          style: MaaruStyle.text.large,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking  Cost',
                          style: MaaruStyle.text.tiny,
                        ),
                        Text(
                          '',
                          //state.covidModel.petProfiles[_prefHelper.getIntByKey('id',abcd  )].service_cost,

                          style: MaaruStyle.text.tiny,
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '',
                          //  state.covidModel.petProfiles[_prefHelper.getIntByKey('id',abcd  )].am,
                          style: MaaruStyle.text.tiny,
                        ),
                        Text(
                          '\$ 5.0',
                          style: MaaruStyle.text.tiny,
                        )
                      ],
                    )),
                Divider(
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: MaaruStyle.text.tiny,
                        ),
                        Text(
                          '\$ 90.0',
                          style: MaaruStyle.text.tiny,
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                BlocProvider(
                    create: (context) => KiwiContainer().resolve<PaymentBloc>(),
                    child: BlocBuilder<PaymentBloc, PaymentState>(
                        builder: (context, state) {
                      if (state is PaymentInitial) {
                        BlocProvider.of<PaymentBloc>(context)
                            .add(GetUserPayment());

                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetUserPaymentModel) {
                        return Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Your Saved Card',
                                      style: MaaruStyle.text.tiniest,
                                    )),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.fetchCardDetailsModel
                                        .getCardDetails.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (state.fetchCardDetailsModel
                                          .getCardDetails.isNotEmpty) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Container(
                                              height: 180,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                  color: Colors.deepPurple[50],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 20, 10, 20),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Visa Card',
                                                          style: MaaruStyle
                                                              .text.tiniest,
                                                        ),
                                                        Text(
                                                          'Primary Payment',
                                                          style: MaaruStyle
                                                              .text.greyDisable,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: card([index]
                                                            .sublist(0))),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '**** **** **** ${state.fetchCardDetailsModel.getCardDetails[index].cardNumber.substring(state.fetchCardDetailsModel.getCardDetails[index].cardNumber.length - 4)}',
                                                            style: MaaruStyle
                                                                .text.tiny,
                                                          ),
                                                          Center(
                                                              child:
                                                                  GestureDetector(
                                                            onTap: () {
                                                              state
                                                                  .fetchCardDetailsModel
                                                                  .getCardDetails[
                                                                      index]
                                                                  .id
                                                                  .toString();
                                                            },
                                                            child:
                                                                _animatedButton(),
                                                            //   child:
                                                            //     Transform.scale(
                                                            //   scale: _scale,
                                                            //   child:
                                                            //       //_animatedButton(),
                                                            // ),
                                                          ))
                                                        ])
                                                  ]))),
                                        );
                                      } else {
                                        return Text('ddd');
                                      }
                                    }),
                                Form(
                                    key: _formKey,
                                    autovalidateMode: _autoValidateMode,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: TextButton.icon(
                                            onPressed: showPayment,
                                            icon: Image.asset(
                                              'assets/icons/icone-setting-64.png',
                                              height: 40,
                                            ),
                                            label: Text(
                                              'Payment With New Card',
                                              style: MaaruStyle.text.tiniest,
                                            ),
                                          ),
                                        ),
                                        AddPayment(),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        ThemedButton(

                                          onPressed: () {
                                            var daa = _dates1;
                                            print('ssss1${daa}');
                                            print('sss');
                                            print(date1);
                                            if (date1.isEmpty) {
                                              print('ssss${date1}');
                                              _showDialog(
                                                  context, 'Please Select Date');
                                            }
                                            else if(singh.isEmpty){
                                              print('ssss1${daa}');
                                              _showDialog(
                                                  context, 'Please Select Services');
                                            }
                                            else if(parmendra.isEmpty){
                                              print('ssss1${daa}');
                                              _showDialog(
                                                  context, 'Please Select Pet');
                                            }
                                            // else if((){
                                            //   print('ssss1${daa}');
                                            //   _showDialog(
                                            //       context, 'Please Select Date');
                                            // }
                                            else {}
                                            //   setState(() {
                                            //     BlocProvider.of<
                                            //                 BookAppointmentBloc>(
                                            //             context)
                                            //         .add(providerIdChanged(
                                            //       widget.id3.toString(),
                                            //     ));
                                            //   });
                                            //   final FormState form =
                                            //       _formKey.currentState;
                                            //   if (!form.validate()) {
                                            //     setState(() {
                                            //       _autoValidateMode =
                                            //           AutovalidateMode
                                            //               .always; // Start validating on every change.
                                            //     });
                                            //   } else {
                                            //     form.save();
                                            //     MyStatefulWidget();
                                            //     //    Dialogs.showLoadingDialog(context, _keyLoader, "Updating Payment..");
                                            //     //  MyStatefulWidget();
                                            //     BlocProvider.of<PaymentBloc>(
                                            //             context)
                                            //         .add(savePayment(
                                            //             _cvvController.text,
                                            //             _creditCardNumberController
                                            //                 .text,
                                            //             _cvvController.text,
                                            //             _expDateController
                                            //                 .text));
                                            //
                                            //     // Encrypt and send send payment details to payment gateway
                                            //
                                            //   }
                                            //   BlocProvider.of<
                                            //               BookAppointmentBloc>(
                                            //           context)
                                            //       .add(
                                            //           BookRegisterButtonTapped());
                                            // }
                                          },
                                          text: 'Book Appointment',
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 100,
                                ),
                              ],
                            ));
                      }
                      return Form(
                          key: _formKey,
                          autovalidateMode: _autoValidateMode,
                          child: Column(children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(
                                  Icons.person,
                                  size: 40.0,
                                ),
                                hintText: 'What name is written on card?',
                                labelText: 'Card Name',
                              ),
                              onSaved: (String value) {
                                _card.name = value;
                              },
                              keyboardType: TextInputType.text,
                              validator: (String value) =>
                                  value.isEmpty ? Strings.fieldReq : null,
                              controller: _nameOnCardController,
                            ),
                            new SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(19),
                                CardNumberInputFormatter()
                              ],
                              controller: _creditCardNumberController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: const UnderlineInputBorder(),
                                filled: true,
                                icon: CardUtils.getCardIcon(_paymentCard.type),
                                hintText: 'What number is written on card?',
                                labelText: 'Number',
                              ),
                              onSaved: (String value) {
                                print('onSaved = $value');
                                print(
                                    'Num controller has = ${numberController.text}');
                                _paymentCard.number =
                                    CardUtils.getCleanedNumber(value);
                              },
                              validator: CardUtils.validateCardNum,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        icon: Image.asset(
                                          'assets/images/card_cvv.png',
                                          width: 40.0,
                                          color: Colors.grey[600],
                                        ),
                                        border: UnderlineInputBorder(),
                                        filled: true,
                                        hintText: 'Number behind the card',
                                        labelText: 'CVV',
                                      ),
                                      validator: CardUtils.validateCVV,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        _paymentCard.cvv = int.parse(value);
                                      },
                                      controller: _cvvController,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        CardMonthInputFormatter()
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: const UnderlineInputBorder(),
                                        filled: true,
                                        icon: Image.asset(
                                          'assets/icons/icone-setting-21.png',
                                          width: 25,
                                          color: Colors.grey[600],
                                        ),
                                        hintText: 'MM/YY',
                                        labelText: 'Expiry Date',
                                      ),
                                      validator: CardUtils.validateDate,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        List<int> expiryDate =
                                            CardUtils.getExpiryDate(value);
                                        _paymentCard.month = expiryDate[0];
                                        _paymentCard.year = expiryDate[1];
                                      },
                                      controller: _expDateController,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: ThemedButton(
                                  text: 'Update Payment',
                                  enabled: true,
                                  onPressed: () {
                                    final FormState form =
                                        _formKey.currentState;
                                    if (!form.validate()) {
                                      setState(() {
                                        _autoValidateMode = AutovalidateMode
                                            .always; // Start validating on every change.
                                      });
                                    } else {
                                      form.save();
                                      MyStatefulWidget();
                                      //    Dialogs.showLoadingDialog(context, _keyLoader, "Updating Payment..");
                                      //  MyStatefulWidget();
                                      BlocProvider.of<PaymentBloc>(context).add(
                                          savePayment(
                                              _cvvController.text,
                                              _creditCardNumberController.text,
                                              _cvvController.text,
                                              _expDateController.text));

                                      // Encrypt and send send payment details to payment gateway

                                    }
                                  },
                                )),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ]));
                    }))
              ]))));
        }));
  }

  Widget _animatedButton() {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MaaruColors.primaryColorsuggesion,
              MaaruColors.primaryColorsuggesion,
            ],
          )),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              addpayment(context, '');
              // viewVisible1 = true;
            });
          },
          child: Text(
            'Payment',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(actions: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                        color: MaaruStyle.colors.textColorWhite,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(text),
                          ),
                          Divider(
                            color: Colors.grey[360],
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ok',
                                style:
                                    TextStyle(color: MaaruColors.buttonColor),
                              ))
                        ],
                      )))
            ]));
      },
    );
  }

  void addpayment(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(actions: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                        color: MaaruStyle.colors.textColorWhite,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                icon: Image.asset(
                                  'assets/images/card_cvv.png',
                                  width: 40.0,
                                  color: Colors.grey[600],
                                ),
                                border: UnderlineInputBorder(),
                                filled: true,
                                hintText: 'Number behind the card',
                                labelText: 'CVV',
                              ),
                              // validator: CardUtils.validateCVV,
                              // keyboardType: TextInputType.number,
                              // onSaved: (value) {
                              //   _paymentCard.cvv = int.parse(value);
                              // },
                              controller: _cvvController,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[360],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ThemedButton(
                              text: 'Book Appointment',
                              onPressed: () {},
                              enabled: true,
                            ),
                          )
                        ],
                      )))
            ]));
      },
    );
  }
}

class KeyValueModel {
  String key;
  String value;

  KeyValueModel({this.key, this.value});
}

class KeyValueModel1 {
  String key1;
  String value1;

  KeyValueModel1({this.key1, this.value1});
}

class ChoiceRow extends StatefulWidget {
  final String lebal1;
  final String lebal2;
  final String lebal3;
  final String lebal4;
  final String lebal5;

   ChoiceRow(
      {Key key,
      this.lebal1,
      this.lebal2,
      this.lebal3,
      this.lebal4,
      this.lebal5})
      : super(key: key);

  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {
  List<bool> isPressedList = [false, false, false, false, false, false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {
    print("Status L $isPressedList");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[0] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal1));
          },
          child: ChoiceButton(
            isPressed: isPressedList[0],
            label: widget.lebal1,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print(widget.lebal1);
            setState(() {
              if (isPressedList[1] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = true;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal2));
          },
          child: ChoiceButton(
            isPressed: isPressedList[1],
            label: widget.lebal2,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[2] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = true;
                isPressedList[3] = false;
                isPressedList[4] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal3));
          },
          child: ChoiceButton(
            isPressed: isPressedList[2],
            label: widget.lebal3,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[3] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = true;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal4));
          },
          child: ChoiceButton(
            isPressed: isPressedList[3],
            label: widget.lebal4,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[4] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = true;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal5));
          },
          child: ChoiceButton(
            isPressed: isPressedList[4],
            label: widget.lebal5,
          ),
        ),
      ],
    );
  }
}

class ChoiceButton extends StatefulWidget {
  final String label;
  final bool isPressed;

  ChoiceButton({this.label, this.isPressed});

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),

          color: widget.isPressed ? MaaruColors.button2Color : Colors.white,

          // border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: widget.isPressed
                ? GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.black))
                : MaaruStyle.text.greyDisable,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ChoiceRow2 extends StatefulWidget {
  final String lebal1;
  final String lebal2;
  final String lebal3;
  final String lebal4;
  final String lebal5;

  const ChoiceRow2(
      {Key key,
      this.lebal1,
      this.lebal2,
      this.lebal3,
      this.lebal4,
      this.lebal5})
      : super(key: key);

  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRow2State extends State<ChoiceRow> {
  List<bool> isPressedList = [false, false, false, false, false, false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {
    print("Status L $isPressedList");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[0] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal1));
          },
          child: ChoiceButton(
            isPressed: isPressedList[0],
            label: widget.lebal1,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[1] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = true;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal2));
          },
          child: ChoiceButton(
            isPressed: isPressedList[1],
            label: widget.lebal2,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[2] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = true;
                isPressedList[3] = false;
                isPressedList[4] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal3));
          },
          child: ChoiceButton(
            isPressed: isPressedList[2],
            label: widget.lebal3,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[3] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = true;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal4));
          },
          child: ChoiceButton(
            isPressed: isPressedList[3],
            label: widget.lebal4,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print(widget.lebal4);
            setState(() {
              if (isPressedList[4] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = true;
                isPressedList[5] = false;
              }
            });
            BlocProvider.of<BookAppointmentBloc>(context)
                .add(dateChanged('', widget.lebal5));
          },
          child: ChoiceButton(
            isPressed: isPressedList[4],
            label: widget.lebal5,
          ),
        ),
      ],
    );
  }
}

class ChoiceButton2 extends StatefulWidget {
  final String label2;
  final bool isPressed2;

  ChoiceButton2({this.label2, this.isPressed2});

  @override
  State<ChoiceButton2> createState() => _ChoiceButton2State();
}

class _ChoiceButton2State extends State<ChoiceButton2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),

          color: widget.isPressed2 ? MaaruColors.button2Color : Colors.white,

          // border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            widget.label2,
            style: widget.isPressed2
                ? GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.black))
                : MaaruStyle.text.greyDisable,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
