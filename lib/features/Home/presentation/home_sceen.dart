import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            color: Colors.white,
                            height: 45,
                            //   width: 200,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.7),
                                      borderSide: new BorderSide()),
                                  hintText: 'Search',
                                  fillColor: Colors.white,
                                  suffixIcon: Image.asset(
                                    'assets/icons/icone-setting-19.png',
                                    height: 50,
                                    // width: 30,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(onTap: (){

                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ViewPetProfile()));
                          },
                            child:
                          HorizList()),
                          SizedBox(
                            height: 30,
                          ),
                          Text('Upcoming Appoinments',
                              style:
                                 MaaruStyle.text.large,
                              ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                            child: Image.asset(
                              'assets/images/austintext-1.png',
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
                          Text(
                            'Recent Messages',
                            style: MaaruStyle.text.large,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                            child: Image.asset(
                              'assets/images/austintext-2.png',
                            ),
                          ),
                          ThemedButton(
                            onPressed: () {},
                            text: ' All messages',
                            enabled: true,
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ])))));
  }
}

class HorizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    final List _hotels = [10];

    return Container(
        height: 230,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: index == _hotels.length - 1
                    ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                    : const EdgeInsets.only(left: 8),
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
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
