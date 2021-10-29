import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/Home/presentation/chat_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'message.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;
    return Stack(children: [
      Scaffold(
          backgroundColor: Color(0xFFffffff),
          bottomNavigationBar: CreateHomeScreen(
            selectedIndex: 0,
            Color: selectedIndex == 0
                ? MaaruColors.textButtonColor
                : Colors.grey[350],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            ShowLocation(),
                            SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   padding: EdgeInsets.only(right: 20,),
                            //   color: Colors.white,
                            //   height: 50,
                            //   //   width: 200,
                            //
                            //   child:
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, right: 10, left: 5),
                                child: TextFormField(
                                  // cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      enabledBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.7),
                                          borderSide: new BorderSide(
                                              color: Colors.grey[50],
                                              width: 1.0)),
                                      focusedBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.7),
                                          borderSide: new BorderSide(
                                              color: Colors.grey[50],
                                              width: 1.0)),
                                      hintText: 'Search',
                                      hintStyle: MaaruStyle.text.greyDisable,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 25.0, 10.0),
                                      fillColor: Colors.white,
                                      suffixIcon: Image.asset(
                                        'assets/icons/icone-setting-19.png',
                                        height: 50,
                                        // width: 30,
                                      )),
                                )),
                            //  ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ViewPetProfile()));
                                },
                                child: HorizList()),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Upcoming Appoinments',
                                  style: MaaruStyle.text.tiniest,
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child:  Container(
                                height: 150,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey[300])),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(child:
                                      Container(
                                        width: 100,

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Image.asset('assets/images/kutta.png',height: 200,),
                                      )),
                                      
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Austin pet care',
                                              style: MaaruStyle.text.tiniestSmall
                                            ),
                                            Text(
                                              'Pet walking',
                                              style: MaaruStyle.text.tiny
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '1357 Muno Manor',
                                              style: MaaruStyle.text.greyDisable
                                            ),
                                            Text(
                                              'Austin,Tx 75923',
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        //width: 40,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.calendar_today_outlined,
                                              size: 22,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: 36,
                                            ),
                                            Text(
                                              'Aug 21,2021',
                                              style: TextStyle(color: Colors.grey, fontSize: 12),
                                            ),
                                            Text(
                                              '11:00 am',
                                              style: TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ThemedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AppointmentScreen()));
                              },
                              text: 'View All Appoinments',
                              enabled: true,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Recent Messages',
                                  style: MaaruStyle.text.tiniest,
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child:    Container(
                                height: 170,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(15.0),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Austin Pet Groomings',
                                            style:MaaruStyle.text. tiniestSmall
                                          ),

                                          Text(
                                            'Aug 8,2021 11:00am',
                                            style: MaaruStyle.text.greyDisable
                                          ),
                                        ],



                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Pet Grooming',
                                        style: MaaruStyle.text.tiny
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Roscoe needs a trim and was wanting to know if we  could move up our appointmenr?',
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                      SizedBox(height: 10,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChatScreen()));
                                            },
                                            child:
                                          Text(

                                            'Show Message',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 12,color: MaaruColors.primaryColorsuggesion1),
                                          ),
                                          )],
                                      ),
                                    ],
                                  ),
                                ),

                              )

                            ),
                            ThemedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Messages()));
                              },
                              text: ' All messages',
                              enabled: true,
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ])))))
    ]);
  }
}

class HorizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    final List _hotels = [10];

    return Container(
        height: 240,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: index == _hotels.length - 1
                    ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                    : const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                    alignment: FractionalOffset.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300], width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200.0,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/kutta.png',
                          height: 140,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sally',
                                  style: GoogleFonts.poppins(
                                    textStyle: MaaruStyle.text.large,
                                  )),
                              Image.asset(
                                'assets/icons/icone-setting-31.png',
                                width: 25,
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 70),
                          child: Text(
                            'Scotis Terrior',
                            style: MaaruStyle.text.tiny,
                          ))
                    ])
                    // alignment: Alignment.center,
                    ));
          },
        ));
  }
}
