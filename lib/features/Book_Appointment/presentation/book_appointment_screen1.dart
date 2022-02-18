import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';

import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'book_appointment_screen2.dart';
import 'booked_confirm.dart';

class BookAppointment1 extends StatefulWidget {
  final int id1;

  BookAppointment1({this.id1});
  @override
  _BookAppointment1State createState() => _BookAppointment1State();
}

class _BookAppointment1State extends State<BookAppointment1> {
  int abc;
  Color circlecolor1 = MaaruColors.walkingcolor;
  Color circlecolor2 = MaaruColors.vetcolor;
  Color circlecolor3 = MaaruColors.hotelcolor;
  Color circlecolor4 = MaaruColors.hospitalcolor;
  Color circlecolor5 = MaaruColors.daycarecolor;
  Color circlecolor6 = MaaruColors.groomingcolor;
  var select = '';
  Widget choosecontainer(
      BuildContext context, Image image, String text, Color color) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MaaruColors.textfeildline,
          ),
          color: color,
        ),
        //  height: size.height * 0.10,
        // width: size.width * 0.43,
        child: Container(
          width: 150,
          margin: EdgeInsets.only(left: 5, top: 9, bottom: 9, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              image,
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                text,
                style: MaaruStyle.text.tiny,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar:
            (_prefHelper.getStringByKey('pet_name', '').isNotEmpty)
                ? const CreateHomeScreen(
                    // Color:MaaruColors.textButtonColor
                    )
                : const CreateProviderHome(),
        body: Center(
            //padding: const EdgeInsets.only(top: 100),
            child: BlocProvider(
                create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
                child: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  if (state is PetProfileInitial) {
                    BlocProvider.of<PetProfileBloc>(context)
                        .add(GetSinglePRovider(widget.id1));
                    return CircularProgressIndicator();
                  } else if (state is SingleProviderLoaded) {
                    //   print('+-+****rhedhhhhhhhhhhhhhhhhhhhhhhhhh ${state.welcome4.providerName}');
                    // AlertManager.showErrorMessage(
                    //     "ProfileUpdateSuccessful", context);
                    var index = 0;
                    return SafeArea(
                      bottom: false,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                            height: size.height*0.25,
                            width: size.width*1,
                            child: Image.network(
                              state.welcome4.providerDetails.provider.img,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    color: Colors.amber,
                                    alignment: Alignment.bottomCenter,
                                    child:
                                        Image.asset('assets/images/kutta.png'));
                              },
                            ),
                          ),
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            //  height: size.height * 1.1,
                            width: size.width * 1,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              color: Colors.white,
                              //height: size.height*0.80,
                              //  width: size.width * 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/Rectangle copy 3.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            // _prefHelper.saveString(
                                            //     'img',
                                            //     state
                                            //         .welcome4
                                            //         .providerDetails
                                            //           .provider.img)
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BookAppointment2(
                                                          id2: widget.id1,
                                                        )));
                                          },
                                          child: Image.asset(
                                            'assets/icons/icone-setting-68.png',
                                            height: 40,
                                            width: 40,
                                            color: Colors.grey[100],
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
                                                          id3: widget.id1,
                                                          image: state
                                                              .welcome4
                                                              .providerDetails
                                                              .provider
                                                              .img,
                                                        )));
                                          },
                                          child: Image.asset(
                                            'assets/icons/icone-setting-68.png',
                                            height: 40,
                                            width: 40,
                                            color: Colors.grey[100],
                                          )),
                                    ],
                                  ),

                                  // ListView.builder(
                                  //     scrollDirection: Axis.vertical,
                                  //     shrinkWrap: true,
                                  //     itemCount: state.welcome4.providerDetails.length,
                                  //
                                  //     itemBuilder:
                                  //         (BuildContext context, int index) {
                                  //    return
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.welcome4.providerDetails.provider
                                            .companyName
                                            .toString(),
                                        // state.welcome4.providerDetails.
                                        style: MaaruStyle.text.xlarge,
                                      ),
                                    ],
                                  ),
                                  //   }
                                  // ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),

                                  Text(
                                    '${state.welcome4.providerDetails.provider.city.toString()} ${state.welcome4.providerDetails.provider.state} ${state.welcome4.providerDetails.provider.zipCode}'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  GridView.builder(
                                    itemCount: state.welcome4.providerDetails
                                        .service.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 55,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(
                                          state.welcome4.masterServices.length);
                                      print('xxx$index');
                                      //    final int itemIndex = index + 1;
                                      //   print('ffff$itemIndex');
                                      assert(state.welcome4.providerDetails
                                              .service.length !=
                                          null);
                                      return Column(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              choosecontainer(
                                                  context,
                                                  Image.network(
                                                    state
                                                        .welcome4
                                                        .providerDetails
                                                        .service[index]
                                                        .service
                                                        .serviceIcon
                                                        .toString(),
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                          color: circlecolor3,
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Image.asset(
                                                            'assets/images/kutta.png',
                                                            height: 30,
                                                          ));
                                                    },
                                                    height: 35,
                                                  ),
                                                  state
                                                      .welcome4
                                                      .providerDetails
                                                      .service[index]
                                                      .service
                                                      .serviceType
                                                      .toString(),
                                                  circlecolor3),
                                            ],
                                          ),
                                        ],
                                      );
                                      print('ddd');
                                    },
                                  ),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  //
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    'About'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),

                                  Text(
                                      state.welcome4.providerDetails.provider
                                              .description
                                              .toString()
                                              .isEmpty
                                          ? ''
                                          : state.welcome4.providerDetails
                                              .provider.description
                                              .toString(),
                                      style: MaaruStyle.text.greyDisable),

                                  Text(
                                    'Hours Of Operation'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: state.welcome4.providerDetails
                                          .provider.operationHours.week.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            state.welcome4.providerDetails.provider.operationHours.week[index].day.status ==true?
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [

                                                Text(
                                                  state
                                                      .welcome4
                                                      .providerDetails
                                                      .provider
                                                      .operationHours
                                                      .week[index]
                                                      .day
                                                      .name
                                                      .toString(),  
                                                  style: MaaruStyle
                                                      .text.greyDisable,
                                                ),
                                              Text(

                                                  '${state.welcome4.providerDetails.provider.operationHours.week[index].day.startTime.toString()} - ${state.welcome4.providerDetails.provider.operationHours.week[index].day.endTime.toString()}',
                                                  style:
                                                      MaaruStyle.text.tiny,
                                                ),
                                              ],
                                            ):Text(''),
                                          ],
                                        );
                                      }),

                                  const SizedBox(
                                    height: 5,
                                  ),

                                  ThemedButton(
                                    onPressed: () {
                                      if (_prefHelper
                                          .getStringByKey('pet_name', '')
                                          .isNotEmpty) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    BookAppointmentScreen3(
                                                      id3: widget.id1,
                                                      image: state
                                                          .welcome4
                                                          .providerDetails
                                                          .provider
                                                          .img,
                                                    )));
                                      } else {}
                                    },
                                    text: ' Book Appointments'.toUpperCase(),
                                    enabled: true,
                                  ),
                                  // InkWell(
                                  //     onTap: () {
                                  //       Navigator.of(context).push(MaterialPageRoute(
                                  //           builder: (_) => BookAppointmentScreen3()));
                                  //     },

                                  // RoundedButton(
                                  //   buttonName: 'Book Appointments',
                                  //   Color1: MaaruColors.blueColor,
                                  //   Color: MaaruColors.primaryColorsuggesion,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }))));
  }
}
// icon:SizedBox(
//
//   child:
//   new IconButton(
//       icon: new Image.asset("assets/icons/icone-setting-9.png"),
//       onPressed: () {
//         AppStatecurrentTab == index ? Colors.red : Colors.blue;
//       }),
//   width: 38,
//   height: 38,
// ),
