

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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
<<<<<<< HEAD
        bottomNavigationBar: CreateHomeScreen(
=======
        bottomNavigationBar: CreateProviderHome(
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
          // Color:MaaruColors.textButtonColor
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 2000,
                  child: Image.asset('assets/images/imgdd.jpg'),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.white,
                  //height: size.height*0.80,
                  width: size.width * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

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
                      Text(
                        'Austin Pet Groomer'.toUpperCase(),
                        style: MaaruStyle.text.xlarge,
                      ),

                      Text(
                        '1115 Emihi Grove Austin, Textas 00000',
                        style: MaaruStyle.text.medium,
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
                            'Grooming'.toUpperCase(),
                            style: MaaruStyle.text.greyDisable,
                          ),
                          Text(
                            'Walking'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey.shade400, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 35, 0),
                            child: Text(
                              'vet'.toUpperCase(),
                              style: MaaruStyle.text.greyDisable,
                            ),
                          ),
                          Text(
                            'Hotel'.toUpperCase(),
                            style: MaaruStyle.text.greyDisable,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'About'.toUpperCase(),
                        style: MaaruStyle.text.tiny,
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
                        'Hours Of Operation'.toUpperCase(),
                        style: MaaruStyle.text.tiny,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('monday-saturday'.toUpperCase(),
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
                          Text('sunday'.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: MaaruStyle.text.greyDisable),
                          Text('closed'.toUpperCase(), style: MaaruStyle.text.tiniest),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ],
            )));
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