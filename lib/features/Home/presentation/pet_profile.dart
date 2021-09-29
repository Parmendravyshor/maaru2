import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/verify/presentation/Register_pet_profile_screen1.dart';

class PetProfile extends StatefulWidget {
  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          SizedBox(
            height: 40,
          ),
          ShowLocation(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            color: Colors.white,
            height: 45,
            //   width: 200,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.7),
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
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              height: 260,
              width: 200,
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return
                      // padding: index == _hotels.length - 1

                      Container(
                          alignment: FractionalOffset.topLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey[300], width: 1.0),
                              borderRadius: BorderRadius.circular(20)),
                          width: 240.0,
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
                                )),
                            Padding(
                                padding: EdgeInsets.only(right: 70),
                                child: Text(
                                  'Scotis Terrior',
                                  style: MaaruStyle.text.tiny,
                                ))
                          ])
                          // alignment: Alignment.center,
                          );
                },
              )),
          Row(children: [
            Padding(
                padding: EdgeInsets.only(left: 80),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CreateregisterPetProfile1()));
                  },
                  child: Image.asset(
                    'assets/icons/icone-setting-64.png',
                    height: 40,
                  ),
                )),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap:() {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => CreateregisterPetProfile1()));
              },
            child:
            Text(
              'Add New Pet',
              style: MaaruStyle.text.mediumGreen,
            ))
          ]),
        ])));
  }
}
