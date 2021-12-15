import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'create_home_screen.dart';

class PetProfile extends StatefulWidget {
  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.darkGrey2,
        bottomNavigationBar: CreateHomeScreen(
          selectedIndex: 2,
        ),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 5),
                  child: Column(children: [BackArrowButton(), ShowLocation()])),
              SizedBox(
                  height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, right: 10, left: 20),
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 10),
                    child: TextFormField(
                      // cursorColor: Colors.black,
                      decoration: InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.7),
                              borderSide: new BorderSide(
                                  color: Colors.grey[300], width: 1.0)),
                          focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.7),
                              borderSide: new BorderSide(
                                  color: Colors.grey[300], width: 1.0)),
                          hintText: 'Search',
                          hintStyle: MaaruStyle.text.greyDisable,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
                          fillColor: Colors.white,
                          suffixIcon: Image.asset(
                            'assets/icons/icone-setting-19.png',
                            height: 50,
                            // width: 30,
                          )),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 260,
                  width: 250,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return
                          // padding: index == _hotels.length - 1

                          Container(
                              alignment: FractionalOffset.topLeft,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[300], width: 1.0),
                              ),
                              width: 240.0,
                              child: Column(children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/kutta.png',
                                    height: size.height * 0.20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Sally',
                                            style: MaaruStyle.text.large,
                                          ),
                                          Image.asset(
                                            'assets/icons/icone-setting-31.png',
                                            width: 25,
                                          )
                                        ],
                                      ),
                                      Text(
                                        'Scotis Terrior',
                                        style: MaaruStyle.text.tiny,
                                      )
                                    ],
                                  ),
                                ),
                              ])
                              // alignment: Alignment.center,
                              );
                    },
                  )),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CreateregisterPetProfile1()));
                      },
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            radius: 30,
                            child: Icon(
                              Icons.add,
                              color: MaaruColors.buttonColor,
                              size: 35,
                            ),
                          )),
                    )),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CreateregisterPetProfile1()));
                    },
                    child: Text(
                      'Add New Pet',
                      style: MaaruStyle.text.mediumGreen,
                    ))
              ]),
            ]))));
  }
}
