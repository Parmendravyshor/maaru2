import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';
class ViewPetProfile3 extends StatefulWidget {
  @override
  _ViewPetProfile3State createState() => _ViewPetProfile3State();
}

class _ViewPetProfile3State extends State<ViewPetProfile3> {
  final SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,
        bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          height: size.height * 0.25,
                          width: size.width * 0.9,
                          child: BackgroundImage(
                            assetImage: 'assets/images/kutta.png',
                          )),
                      Container(
                        //height: size.,
                          width: 1000,
                          height: 700,
                          alignment: FractionalOffset.bottomCenter,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ViewPetProfile()));
                                          },
                                          child:
                                        Image.asset(
                                          'assets/icons/Rectangle copy 3.png',
                                          height: 40,
                                          width: 40,
                                        )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ViewPetProfile2()));
                                            },
                                            child: Image.asset(
                                              'assets/icons/Rectangle copy 3.png',
                                              height: 40,
                                              width: 40,
                                              //color: Colors.grey[100],
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) => ViewPetProfile3()));
                                          },
                                          child: Image.asset(
                                            'assets/icons/Rectangle copy 3.png',
                                            height: 40,
                                            width: 40,
                                            //color: Colors.grey[100],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            _prefHelper.getStringByKey(MaruConstant.first_name, ''),
                                            style: MaaruStyle.text.large,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.60,
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            CreateregisterPetProfile1()));
                                              },
                                              child: Image.asset(
                                                'assets/icons/icone-setting-29.png',
                                                height: 40,
                                              ))
                                        ]),
                                    Text(
                                      _prefHelper.getStringByKey(MaruConstant.last_name, ''),
                                      style: MaaruStyle.text.tiny,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                            EdgeInsets.only(right: 30, top: 20),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 80,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[50],
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                      BorderRadius.circular(15.0),
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: 20),
                                                              child: Text('Age',
                                                                  style: MaaruStyle
                                                                      .text.red)),
                                                          Text(_prefHelper.getStringByKey(MaruConstant.age, ''),
                                                              style: MaaruStyle
                                                                  .text.tinyDisable),
                                                        ]),
                                                  ),
                                                  Container(
                                                    height: 80,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[50],
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                      BorderRadius.circular(15.0),
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: 20),
                                                              child: Text('Sex',
                                                                  style: MaaruStyle
                                                                      .text.red)),
                                                          Text(_prefHelper.getStringByKey(MaruConstant.sex, ''),
                                                              style: MaaruStyle
                                                                  .text.tinyDisable),
                                                        ]),
                                                  ),
                                                  Container(
                                                    height: 80,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[50],
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                      BorderRadius.circular(15.0),
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: 20),
                                                              child: Text('Height',
                                                                  style: MaaruStyle
                                                                      .text.red)),
                                                          Text(_prefHelper.getStringByKey(MaruConstant.height, ''),
                                                              style: MaaruStyle
                                                                  .text.tinyDisable),
                                                        ]),
                                                  ),

                                                  Container(
                                                    height: 80,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[50],
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                      BorderRadius.circular(15.0),
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: 20),
                                                              child:
                                                              Text('Weight',
                                                                  style: MaaruStyle
                                                                      .text.red)),
                                                          Text(_prefHelper.getStringByKey(MaruConstant.weight, ''),
                                                              style: MaaruStyle
                                                                  .text.tinyDisable),
                                                        ]),
                                                  ),
                                                ])),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Notes',
                                          style: MaaruStyle.text.tiniest,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Container(
                                           height: size.height * 0.30,
                                          width: size.width * 0.85,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18.0))),
                                            child: Padding(
                                                padding: EdgeInsets.only(top: 20),
                                                child: Padding(
                                                    padding: EdgeInsets.only(left: 20),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            _prefHelper.getStringByKey(MaruConstant.name, ''),
                                                            style:
                                                            MaaruStyle.text.tiniest,
                                                          ),
                                                          Text(
                                                            _prefHelper.getStringByKey(MaruConstant.times_a_day, ''),
                                                            style:
                                                            MaaruStyle.text.medium,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                           _prefHelper.getStringByKey(MaruConstant.note, ''),
                                                            style: MaaruStyle
                                                                .text.greyDisable,
                                                          )
                                                        ])))),
                                      ],
                                    )
                                  ])))
                    ]))));
  }
}
