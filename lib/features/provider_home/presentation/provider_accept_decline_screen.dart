import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_screen.dart';
import 'bloc/provider_home_bloc.dart';
import 'create_provider_home.dart';

class ProviderAcceptOrDeclineScreen extends StatefulWidget {
  const ProviderAcceptOrDeclineScreen({Key key}) : super(key: key);

  @override
  _ProviderAcceptOrDeclineScreenState createState() =>
      _ProviderAcceptOrDeclineScreenState();
}

class _ProviderAcceptOrDeclineScreenState
    extends State<ProviderAcceptOrDeclineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ShowLocation(),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: Flexible(
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.7),
                                  borderSide: BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.7),
                                  borderSide: BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              hintText: 'Search',
                              hintStyle: MaaruStyle.text.greyDisable,
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 25.0, 10.0),
                              fillColor: Colors.white,
                              suffixIcon: Image.asset(
                                'assets/icons/icone-setting-19.png',
                                height: 50,
                                // width: 30,
                              )),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/icone-setting-40.png',
                        height: 40,
                      ),
                    ])),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Booking Request',
                  style: MaaruStyle.text.large,
                )),
            Slidable(
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  Stack(children: [
                    IconSlideAction(
                      caption: 'Accept',
                      color: Colors.blue,
                      icon: Icons.done,
                      onTap: () {},
                    ),
                    Icon(Icons.arrow_forward)
                  ])
                ],
                secondaryActions: const <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
                child: Column(children: [
                  Container(
                      height: 200,
                      width: 420,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(20.7),
                          border: Border.all(color: Colors.grey[200])),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Max',
                                style: MaaruStyle.text.large,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text('Aug. 21, 2021')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Dog Grooming',
                                style: MaaruStyle.text.large,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('10:00')
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: Text(
                                '1357 Muno Manor Austin, Tx 75923',
                              )),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 120),
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                color: MaaruColors.blueColor,
                                borderRadius: new BorderRadius.circular(10.7),
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                      //Text('Item Data$index'),
                      ),
                ])),

            //  )
          ]),
        )));
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
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
          return Expanded(
              child: Theme(
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
          ));
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
      BlocProvider.of<ProviderHomeBloc>(context)
          .add(getProviderRequest(
        page,
        date,
        date,
        date,
        limit,
        _ageType.text,
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
    return Scaffold(
        backgroundColor: MaaruColors.whiteColor,
        bottomNavigationBar: CreateProviderHome(
          selectedIndex: 0,
          Color: selectedIndex == 0
              ? Colors.grey[300]
              : MaaruColors.textButtonColor,
        ),
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<ProviderHomeBloc>(),
            child: BlocBuilder<ProviderHomeBloc, ProviderHomeState>(
                builder: (context, state) {
              if (state is ProviderHomeInitial) {
                BlocProvider.of<ProviderHomeBloc>(context)
                    .add(getProviderRequest(
                  page,
                  date,
                  date,
                  date,
                  limit,
                  _ageType.text,
                ));
                // print('figffgfg${text}');
                return const Center(child: CircularProgressIndicator());
              } else if (state is RequestLoaded) {
                //  print(
                // 'datarequestfprcheckeinguseingstaat${state.getProviderRequestModel.appointmentRequests.length}');
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Column(
                      children: [
                        SafeArea(
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ShowLocation(),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
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
                                                      BorderRadius.circular(0.0),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[300],
                                                      width: 1.0)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0.0),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[300],
                                                      width: 1.0)),
                                              hintText: 'Search',
                                              hintStyle:
                                                  MaaruStyle.text.greyDisable,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 25.0, 10.0),
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
                                                              '',
                                                              service,
                                                              '',
                                                              '',
                                                              '',
                                                              ''));
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/icone-setting-19.png',
                                                    height: 50,
                                                    // width: 30,
                                                  ))),
                                          onSubmitted: (text) {
                                            setState(() {
                                              BlocProvider.of<ProviderHomeBloc>(
                                                      context)
                                                  .add(getProviderRequest(
                                                name,
                                                service,
                                                provider,
                                                date,
                                                page,
                                                limit,
                                              ));
                                              print(_ageType);
                                            });
                                          },
                                          controller: _ageType,
                                        ),
                                      )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                            BlocProvider.of<ProviderHomeBloc>(context)
                                                .add(getProviderRequest(
                                              page,
                                              date,
                                              date,
                                              date,
                                              limit,
                                              _ageType.text,
                                            ));
                                          },
                                          child: Image.asset(
                                            'assets/icons/New Project (36).png',
                                            height: 40,
                                          )),
                                    ])),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 20),
                                child: Container(
                                  padding: EdgeInsets.only(left: 15, right: 20),
                                  height: size.height * 0.20,
                                  width: 420,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      MaaruColors.blueColor,
                                      MaaruColors.blueColor,
                                      MaaruColors.blueColor,
                                      Colors.red,
                                      Colors.red,
                                      Colors.red
                                    ]),
                                  ),
                                ),
                              ),
                              BlocProvider(
                                  create: (context) =>
                                      KiwiContainer().resolve<ProviderHomeBloc>(),
                                  child: BlocBuilder<ProviderHomeBloc,
                                          ProviderHomeState>(
                                      builder: (context, state) {
                                    if (state is ProviderHomeInitial) {
                                      BlocProvider.of<ProviderHomeBloc>(context)
                                          .add(getProviderRequest(
                                        page,
                                        date,
                                        date,
                                        date,
                                        limit,
                                        _ageType.text,
                                      ));
                                      // print('figffgfg${text}');
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (state is RequestLoaded) {
                                      print(
                                          'datarequestfprcheckeinguseingstaat${state.getProviderRequestModel.appointmentRequests.length}');
                                      return ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: state.getProviderRequestModel
                                              .appointmentRequests.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Slidable(
                                              actionPane:
                                                  const SlidableDrawerActionPane(),
                                              actionExtentRatio: 0.25,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    right: 20,
                                                    bottom: 20),
                                                child: Container(
                                                  height: size.height * 0.20,
                                                  width: 420,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                  child: Container(
                                                      height: size.height * 0.20,
                                                      width: size.width * 0.90,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .grey[200])),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                state
                                                                    .getProviderRequestModel
                                                                    .appointmentRequests[
                                                                        index]
                                                                    .companyName
                                                                    .toString(),
                                                                style: MaaruStyle
                                                                    .text.large,
                                                              ),
                                                              SizedBox(
                                                                width: 60,
                                                              ),
                                                              Text(
                                                                state
                                                                    .getProviderRequestModel
                                                                    .appointmentRequests[
                                                                        index]
                                                                    .bookingDate
                                                                    .year
                                                                    .toString(),
                                                                style: MaaruStyle
                                                                    .text.tiniest,
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                state
                                                                    .getProviderRequestModel
                                                                    .appointmentRequests[
                                                                        index]
                                                                    .service
                                                                    .toString(),
                                                                style: MaaruStyle
                                                                    .text.tiniest,
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                '10:00',
                                                                style: MaaruStyle
                                                                    .text
                                                                    .greyDisable,
                                                              )
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      right: 40,
                                                                      left: 18),
                                                              child: Text(
                                                                  '1357 Muno Manor Austin, Tx 75923',
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .greyDisable)),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (_) =>
                                                                                ProviderBookedConfirm()));
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            120),
                                                                height: 35,
                                                                width: 150,
                                                                decoration: BoxDecoration(
                                                                    color: MaaruColors
                                                                        .blueColor,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white)),
                                                                child: const Text(
                                                                  'View Details',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              )),
                                                        ],
                                                      )
//Text('Item Data$index'),
                                                      ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Row(children: [
                                                  IconSlideAction(
                                                      caption: 'Accept',
                                                      color:
                                                          MaaruColors.blueColor,
                                                      icon: Icons.done,
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    UpcomingAppointmentCalender1()));
                                                      }),
                                                  const SizedBox(
                                                    width: 25,
                                                  ),
                                                  const IconSlideAction(
                                                    color: MaaruColors.blueColor,
                                                    icon: Icons.arrow_forward,
                                                    //onTap: () => _showSnackBar('Archive'),
                                                  ),
                                                ])
                                              ],
                                              secondaryActions: <Widget>[
                                                Row(
                                                  children: const [
                                                    IconSlideAction(
                                                      color: Colors.red,
                                                      icon: Icons.arrow_back,
                                                      //onTap: () => _showSnackBar('Archive'),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    IconSlideAction(
                                                      caption: 'Delete',
                                                      color: Colors.red,
                                                      icon: Icons.delete,
                                                      //onTap: () => _showSnackBar('Archive'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  }))
                            ]),
                          ]),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            })));
  }
}
