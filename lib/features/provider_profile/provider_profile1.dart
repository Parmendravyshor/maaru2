

import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_profile/provider_profile2.dart';


class ProviderProfile1 extends StatefulWidget {
  @override
  _ProviderProfile1State createState() => _ProviderProfile1State();
}

class _ProviderProfile1State extends State<ProviderProfile1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 2000,
                      child: Image.asset('assets/images/imgdd.jpg'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: Colors.white),
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
                              height: size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/icone-setting-67.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) => ProviderProfile2()));
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


                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Austin Pet Groomer',
                                  style: MaaruStyle.text.tiniest,
                                ),
                                SizedBox(
                                  width: size.width * 0.16,
                                ),
                                Image.asset(
                                  'assets/icons/New Project (2).png',
                                  width: size.width * 0.10,
                                )
                              ],
                            ),
                            Text(
                              '1115 Emihi Grove Austin, Textas 00000',
                              style: MaaruStyle.text.tiny,
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/icons/icone-setting-78.png',
                                  width: size.width * 0.18,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-79.png',
                                  width: size.width * 0.18,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-80.png',
                                  width: size.width * 0.18,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-81.png',
                                  width: size.width * 0.18,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Grooming',
                                  style: MaaruStyle.text.greyDisable,
                                ),
                                Text(
                                  'Walking',
                                  style: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 0, 35, 0),
                                  child: Text(
                                    'vet',
                                    style: MaaruStyle.text.greyDisable,
                                  ),
                                ),
                                Text(
                                  'Hotel   ',
                                  style: MaaruStyle.text.greyDisable,
                                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('monday-saturday',
                                    textAlign: TextAlign.start,
                                    style: MaaruStyle.text.greyDisable),
                                Text('9:00 am-6:00 pm', style: MaaruStyle.text.tiniest),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('sunday',
                                    textAlign: TextAlign.start,
                                    style: MaaruStyle.text.greyDisable),
                                Text('closed', style: MaaruStyle.text.tiniest),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
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