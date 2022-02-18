
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui show lerpDouble;
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/features/Book_Appointment/presentation/reviewe_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/main.dart';

import 'bloc/book_appointment_bloc.dart';
import 'book_appointment_screen1.dart';
import 'book_appointment_screen3.dart';

class BookedConfirm extends StatefulWidget {
  final int id4;

  const     BookedConfirm({Key key, this.id4}) : super(key: key);
  @override
  _BookedConfirmState createState() => _BookedConfirmState();
}

class _BookedConfirmState extends State<BookedConfirm> {
  BookProviderParams bookProviderParams = BookProviderParams();
  String taskheading = 'Booking Confirmed'.toUpperCase();
  String taskmessage = 'A CONFIRMATION EMAIL AND TEXT HAS BEEN SENT TO YOU';
  Color actioncolor = MaaruColors.blueColor;

  Widget bottombuttons(
      BuildContext context, Color color, String text, Function() onpress) {
    final size = MediaQuery.of(context).size;
    return FlatButton(
        color: color,
        height: size.height * 0.08,
        minWidth: size.width * 0.40,
        onPressed: onpress,
        child: Text(
          text,
          style: const TextStyle(
              color: MaaruColors.whiteColor,
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    return Scaffold(
        backgroundColor: MaaruColors.blueColor,
        bottomNavigationBar:
            (_prefHelper.getStringByKey('pet_name', '').isNotEmpty)
                ? const CreateHomeScreen(
                    // Color:MaaruColors.textButtonColor
                    )
                : const CreateProviderHome(),
        body: BlocProvider(
          create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
          child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
            builder: (context, state) {
              // if (state is BookRegisterSuccess) {
              //   //  SchedulerBinding.instance.addPostFrameCallback((_) {
              //   AlertManager.showErrorMessage(
              //       'Appointment Booked Successful', context);
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (BuildContext context) {
              //     return  ViewPetProfile(id1: widget.id4,);
              //   }));
              //   //  });
              // }
              if (state is BookAppointmentInitial) {
                BlocProvider.of<BookAppointmentBloc>(context)
                    .add(GetbookindataChanged(widget.id4.toString()));
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetBookingSuccesss) {
                //  a .add(state.bookingsss.data[0]);
//print(a);
                var a = state.bookingsss.data[0].petImage.toString();
                print('');
                return SafeArea(
                  bottom: false,
                  child: ListView(
                    children: [
                      Flex(direction: Axis.vertical, children: [
                        Container(
                          color: actioncolor,
                          height: size.height * 0.30,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
//SizedBox(height: size.height*0.06,),
                              const Icon(
                                Icons.check_circle,
                                size: 60,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Booking ${state.bookingsss.data[0].status}'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                '${state.bookingsss.data[0].status} email and SMS has been\n'
                                'sent to your registered details'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: state.bookingsss.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text('APPOINTMENT DETAILS',style: MaaruStyle.text.tiny,),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      // Text(
                                      //   state.bookingsss.data[0].companyName
                                      //       .toString().toUpperCase(),
                                      //   //   'Appointment Details',
                                      //   style:MaaruStyle.text.tiny
                                      // ),
                                      // SizedBox(
                                      //   height: size.height * 0.02,
                                      // ),
                                      Container(
                                          color: Colors.transparent,
                                          height: size.height * 0.08,
                                          width: size.width * 0.99,
                                          child: Row(children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white),
                                              height: size.height * 0.08,
                                              width: size.width * 0.16,
                                              child: Image.network(
                                                state.bookingsss.data[0].petImage
                                                    .toString(),
                                                height: size.height * 0.08,
                                                width: size.width * 0.16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.05,
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.bookingsss.data[index]
                                                        .companyName
                                                        .toString().toUpperCase(),
                                                    style: MaaruStyle.text.tiny,
                                                  ),
                                                  SizedBox(height: size.height*0.0,),
                                                  Text(
                                                    state.bookingsss.data[index]
                                                        .serviceName
                                                        .toString().toUpperCase(),
                                                    style:
                                                        MaaruStyle.text.medium,
                                                  ),
                                                ])
                                          ])),
                                      SizedBox(height: size.height*0.02,),
                                      Container(
                                        height: 135,
                                        padding:
                                            EdgeInsets.only(left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf9f9f9),

                                          border: Border.all(color: Colors.white),
                                        ),
                                        child: Container(
                                             margin: EdgeInsets.all(20),
                                            child:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/icone-setting-21.png',
                                                          height: 20,
                                                        ),
                                                        Image.asset(
                                                          'assets/icons/caticon.png',
                                                          height: 20,
                                                        ),

                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        const Text(
                                                          '  Date & Time',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          state
                                                              .bookingsss
                                                              .data[index]
                                                              .companyName
                                                              .toString().toUpperCase(),
                                                          textAlign:
                                                          TextAlign.right,
                                                          style: MaaruStyle.text.tiny,
                                                        ),
                                                        Text(
                                                          state
                                                              .bookingsss
                                                              .data[index]
                                                              .petName
                                                              .toString().toUpperCase(),
                                                          textAlign:
                                                          TextAlign.right,
                                                          style: MaaruStyle.text.tiny,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(width: size.width*0.20,),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          '${state.bookingsss.data[0].bookingDate.year.toString().padLeft(4, '0')}-${state.bookingsss.data[0].bookingDate.month.toString().padLeft(2, '0')}-${state.bookingsss.data[0].bookingDate.day.toString().padLeft(2, '0')}',
                                                          style: const TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 12),
                                                        ),
                                                        Text(
                                                          state.bookingsss.data[index]
                                                              .bookingTime
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(height: size.height*0.01 ,),
                                                        Text(
                                                          state.bookingsss.data[index]
                                                              .totalAmount
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),



                                   ),
                                      ),
                                       SizedBox(
                                        height: size.height*0.02,
                                      ),
                                      const Text(
                                        'Location',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: size.height*0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${state.bookingsss.data[index].companyCity.toString()}'
                                              '${state.bookingsss.data[index].companyZipCode.toString()}${state.bookingsss.data[0].companyState.toString()}',
                                              style: MaaruStyle.text.greyDisable),
                                          Image.asset(
                                            'assets/icons/icone-setting-24.png',
                                            height: size.height * 0.03,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height*0.01,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) => SimpleMAp()));
                                          },
                                          child: Image.asset(
                                            'assets/images/g.png',
                                            height: size.height * 0.20,
                                            width: size.width * 1,
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _prefHelper.getStringByKey('pet_name', '').isNotEmpty?
                                          bottombuttons(
                                              context,
                                              MaaruColors.button2Color,
                                              'DONE', () {
                                            if (_prefHelper
                                                .getStringByKey('pet_name', '')
                                                .isEmpty) {
                                              Navigator.pop(context);
                                            } else {
                                              if (state.bookingsss.data[0]
                                                      .status ==
                                                  'pending') {
                                                AlertManager.showErrorMessage(
                                                    'your booking was pending ',
                                                    context);
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReviewScreen(
                                                              id4: widget.id4,
                                                            )));
                                              }
                                            }
                                          }):Text(''),
                                          GestureDetector(
                                            onTap: () {
                                              print('fhfihfjfhfh${widget.id4}');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPetProfile(
                                                              id1: state
                                                                  .bookingsss
                                                                  .data[index]
                                                                  .userId)));
                                            },
                                            child: Container(
                                              height: size.height * 0.08,
                                              width: size.width * 0.40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color:
                                                        MaaruColors.button2Color),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'VIEW PROFILE',
                                                  style: TextStyle(
                                                      color:
                                                          MaaruColors.blueColor,
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          bottombuttons(
                                              context,
                                              MaaruColors.mehrooncolor,
                                              'CANCEL', () {
                                            if (_prefHelper
                                                .getStringByKey('pet_name', '')
                                                .isNotEmpty) {
                                              showAlertDialog(
                                                  context, 'Cancel', a);
                                            } else {}
                                          }),

                               _prefHelper.getStringByKey('pet_name','' ).isNotEmpty ?bottombuttons(
                                              context,
                                              MaaruColors.blueColor,
                                              'RESCHEDULE', () {
                                            if (_prefHelper
                                                .getStringByKey('pet_name', '')
                                                .isNotEmpty) {
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookAppointmentScreen3(
                                                            id3: widget.id4,
                                                            image: state
                                                                .bookingsss
                                                                .data[index]
                                                                .petImage
                                                                .toString(),
                                                          )),
                                                  (route) => false);
                                            } else {}
                                          }):Text('')
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  showAlertDialog(BuildContext context, String text, String img) {
    final size = MediaQuery.of(context).size;
    // set up the buttons
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
          backgroundColor: MaaruColors.button2Color,
          minimumSize: Size(130, 50)),
      child: Text(text,
          style: MaaruStyle.text.small.copyWith(
              fontWeight: FontWeight.w500,
              color: MaaruColors.primaryColorsuggesion)),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget continueButton = TextButton(
      style: TextButton.styleFrom(
          backgroundColor: MaaruColors.blueColor, minimumSize: Size(130, 50)),
      child: BlocProvider(
        create: (context) => KiwiContainer().resolve<BookAppointmentBloc>(),
        child: BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
          builder: (context, state) {
            if (state is CancelbookedProviderButtonTapped) {
              //  SchedulerBinding.instance.addPostFrameCallback((_) {
              AlertManager.showErrorMessage(
                  'Booking Cancel Successful', context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            }
            //  });

            return Text(
              "Continue",
              style: MaaruStyle.text.small.copyWith(
                  fontWeight: FontWeight.w500, color: MaaruColors.button2Color),
            );
          },
        ),
      ),
      onPressed: () {
        BlocProvider.of<BookAppointmentBloc>(context).add(
            CancelbookedProvider(_prefHelper.getStringByKey('Booking_id', '')));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: size.height * 0.08,
        width: size.width * 0.16,
        child: Image.network(
          img,
          height: size.height * 0.08,
          width: size.width * 0.16,
        ),
      ),
      content: Text(
        "If you want to  cancel Appointment? The amount deducted will refund you\nwithin 2-3 official days?",
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          cancelButton,
          continueButton,
        ]),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
