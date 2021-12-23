
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
import 'package:maru/features/faketest.dart';
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
  Color circlecolor2 = MaaruColors.whiteColor;
  Color circlecolor3 = MaaruColors.whiteColor;
  Color circlecolor4 = MaaruColors.whiteColor;
  Color circlecolor5 = MaaruColors.whiteColor;
  Color circlecolor6 = MaaruColors.whiteColor;
  var select = '';
  Widget choosecontainer(
      BuildContext context, Image image, String text, Color color) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: MaaruColors.textfeildline,
        ),
        color: color,
      ),
    //  height: size.height * 0.10,
     // width: size.width * 0.43,
      child: Container(
        margin: EdgeInsets.only(left: 12, top: 9, bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image,
            SizedBox(
            //  width: size.width * 0.02,
            ),
            Text(
              text,
              style: MaaruStyle.text.tiny,
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body:Center(
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
                return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        width: 2000,
                        child: Image.asset('assets/images/imgdd.jpg'),
                      ),
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        height: size.height * 1.1,
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
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
                                  SizedBox(
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

                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.welcome4.providerDetails.length,

                                  itemBuilder:
                                      (BuildContext context, int index) {
                                 return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(state.welcome4.providerDetails[_prefHelper.getIntByKey('id',abc)].companyName.toString(),
                                      // state.welcome4.providerDetails.
                                        style: MaaruStyle.text.xlarge,
                                      ),
                                      // SizedBox(
                                      //   width: size.width * 0.16,
                                      // ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              circlecolor3 ==
                                                  MaaruColors
                                                      .whiteColor
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
                                               state.welcome4.providerDetails[index].serviceIcon,
                                                height: 35,
                                              ),
                                             state.welcome4.providerDetails[index].serviceType.toString(),
                                              circlecolor3)),
                                    ],
                                  );
                               }
                             ),

                              Text(
                              state.welcome4.providerDetails[_prefHelper.getIntByKey('id',abc)].city.toString(),
                                style: MaaruStyle.text.tiny,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/icons/container1.png',
                                    //width: 180,
                                    height: size.height * 0.09,
                                  ),
                                  Image.asset(
                                    'assets/icons/container2.png',
                                    //  width: 180,
                                    height: size.height * 0.09,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/icons/container3.png',
                                    // width: 150,
                                    height: size.height * 0.09,
                                  ),
                                  // Image.asset(
                                  //   'assets/icons/container4.png',
                                  //   // width: 150,
                                  //   height: size.height * 0.09,
                                  // ),
                                ],
                              ),

                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'About',
                                style: MaaruStyle.text.tiniest,
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                  "Lorem ipsum is placeholder text commonly used in\n"
                                  "the graphic, print, and publishing industries \n"
                                  "for previewing layouts and visual mackups.",
                                  style: MaaruStyle.text.greyDisable),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Hours Of Operation',
                                style: MaaruStyle.text.tiniest,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('monday-saturday',
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
                                  Text('sunday',
                                      textAlign: TextAlign.start,
                                      style: MaaruStyle.text.greyDisable),
                                  Text('closed',
                                      style: MaaruStyle.text.tiniest),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ThemedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          BookAppointmentScreen3()));
                                },
                                text: ' Book Appointments',
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
                return  const CircularProgressIndicator(

                );
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
