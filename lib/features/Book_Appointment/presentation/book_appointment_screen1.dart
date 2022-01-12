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

import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'book_appointment_screen2.dart';
import 'booked_confirm.dart';

class BookAppointment1 extends StatefulWidget {
  @override
  _BookAppointment1State createState() => _BookAppointment1State();
}

class _BookAppointment1State extends State<BookAppointment1> {
  int abc;
  Color circlecolor1 = MaaruColors.whiteColor;
  Color circlecolor2 = MaaruColors.hotelcolor;
  Color circlecolor3 = MaaruColors.hotelcolor;
  Color circlecolor4 = MaaruColors.hotelcolor;
  Color circlecolor5 = MaaruColors.hotelcolor;
  Color circlecolor6 = MaaruColors.hotelcolor;
  var select = '';
  Widget choosecontainer(
      BuildContext context, Image image, String text, Color color) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom:15.0),
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

          margin: EdgeInsets.only(left: 12, top: 9, bottom: 9,right: 10),
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
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),

        body: Center(
            //padding: const EdgeInsets.only(top: 100),
            child: BlocProvider(
                create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
                child: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  if (state is PetProfileInitial) {
                    BlocProvider.of<PetProfileBloc>(context)
                        .add(GetSinglePRovider());

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
                            width: 2000,
                            child: Image.network(
                              state.welcome4.providerDetails.provider.img,
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
                              width: size.width * 1,
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
                                                        BookAppointment2()));
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
                                                        BookAppointmentScreen3()));
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
                                      // SizedBox(
                                      //   width: size.width * 0.16,
                                      // ),
                                      // GestureDetector(
                                      //     onTap: () {
                                      //       setState(() {
                                      //         circlecolor3 ==
                                      //             MaaruColors
                                      //                 .whiteColor
                                      //             ? circlecolor3 =
                                      //             MaaruColors
                                      //                 .hotelcolor
                                      //             : circlecolor3 =
                                      //             MaaruColors
                                      //                 .whiteColor;
                                      //         if (circlecolor3 ==
                                      //             MaaruColors
                                      //                 .hotelcolor) {
                                      //           select = 'hotel';
                                      //           print(select);
                                      //         }
                                      //       });
                                      //     },
                                      //     child: choosecontainer(
                                      //         context,
                                      //         Image.network(
                                      //          state.welcome4.providerDetails[index].serviceIcon,
                                      //           height: 35,
                                      //         ),
                                      //        state.welcome4.providerDetails[index].serviceType.toString(),
                                      //         circlecolor3)),
                                    ],
                                  ),
                                  //   }
                                  // ),


                                  Text(
                                    '${state.welcome4.providerDetails.provider.city.toString()} ${state.welcome4.providerDetails.provider.state} ${state.welcome4.providerDetails.provider.zipCode}',
                                    style: MaaruStyle.text.tiny,
                                  ),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                    //  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      semanticChildCount  : 2 ,

                                     //   crossAxisSpacing: 1.0,),

                                      shrinkWrap: true,
                                      itemCount:
                                          state.welcome4.masterServices.length - 3,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                         mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [

                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    circlecolor3 ==
                                                            MaaruColors
                                                                .hotelcolor
                                                        ? circlecolor3 =
                                                            MaaruColors
                                                                .hotelcolor
                                                        : circlecolor3 =
                                                            MaaruColors
                                                                .whiteColor;
                                                    if (circlecolor3 ==
                                                        MaaruColors
                                                            .hotelcolor) {
                                                      select = 'hotel';
                                                      print(select);
                                                    }
                                                  });
                                                },
                                                child: choosecontainer(

                                                    context,
                                                    Image.network(
                                                      state
                                                          .welcome4
                                                          .masterServices[index]
                                                          .serviceIcon,
                                                      height: 35,
                                                    ),
                                                    state
                                                        .welcome4
                                                        .masterServices[index]
                                                        .serviceType,
                                                    circlecolor3)),

                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    circlecolor3 ==
                                                            MaaruColors
                                                                .hotelcolor
                                                        ? circlecolor3 =
                                                            MaaruColors
                                                                .hotelcolor
                                                        : circlecolor3 =
                                                            MaaruColors
                                                                .hotelcolor;
                                                    if (circlecolor3 ==
                                                        MaaruColors
                                                            .hotelcolor) {
                                                      select = 'hotel';
                                                      print(select);
                                                    }
                                                  });
                                                },
                                                child: choosecontainer(
                                                    context,
                                                    Image.network(
                                                      state
                                                          .welcome4
                                                          .masterServices[index]
                                                          .serviceIcon,
                                                      height: 35,
                                                    ),
                                                    state
                                                        .welcome4
                                                        .masterServices[index]
                                                        .serviceType
                                                        .toString(),
                                                    circlecolor3)),
                                          ],
                                        );
                                      }),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  //
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  // SizedBox(
                                  //   height: size.height * 0.01,
                                  // ),
                                  Text(
                                    'About'.toUpperCase(),
                                    style: MaaruStyle.text.tiniest,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                      state.welcome4.providerDetails.provider
                                          .description,
                                      style: MaaruStyle.text.greyDisable),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Hours Of Operation'.toUpperCase(),
                                    style: MaaruStyle.text.tiniest,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('monday-saturday'.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: MaaruStyle.text.greyDisable),
                                      Text('',
                                          //state.welcome4.providerDetails[_prefHelper.getIntByKey('id',abc)].operationHours,
                                          style: MaaruStyle.text.tiniest),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('sunday'.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: MaaruStyle.text.greyDisable),
                                      Text('closed'.toUpperCase(),
                                          style: MaaruStyle.text.tiniest),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ThemedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  BookAppointmentScreen3()));
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
