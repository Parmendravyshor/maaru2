
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/network/network_info.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/appoinment_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/faketest.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile3.dart';
import 'package:http/http.dart' as http;
class ViewPetProfile extends StatefulWidget {
  @override
  _ViewPetProfileState createState() => _ViewPetProfileState();
}

class _ViewPetProfileState extends State<ViewPetProfile>
    with SingleTickerProviderStateMixin {
  bool enabled = false;
  bool _status = true;
  final SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  final FocusNode myFocusNode = FocusNode();
  Welcome petProfileParams = Welcome();
  GetPetProfile getPetProfile = GetPetProfile(userRepository);
  UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(sharedPrefHelper, authSource);
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  List<PetProfile> _cars = [];
  static UserRepository userRepository;

  static AuthSource  authSource ;

  static SharedPrefHelper  sharedPrefHelper ;
  // TextEditingController _fnameController;
  // TextEditingController _lnameController;
  // TextEditingController _cityController;
  // TextEditingController _stateController;
  // TextEditingController _emailController;
  // TextEditingController _zipCodeController;
  // TextEditingController _mobileController;
  //
  @override
  void initState() {
    // _fnameController = TextEditingController();
    // _lnameController = TextEditingController();
    // _emailController = TextEditingController();
    // _stateController = TextEditingController();
    // _zipCodeController = TextEditingController();
    // _cityController = TextEditingController();
    // _mobileController = TextEditingController();
    super.initState();
    fetchData();
  }
  Future fetchData() async {
    _cars = (await getPetProfile(petProfileParams)) as List<PetProfile>;
    setState(() {
      //_isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
      child: Scaffold(
        body:
        BlocBuilder<PetProfileBloc, PetProfileState>(
            builder: (context, state) {
              try {
                Navigator.of(_keyLoader.currentContext, rootNavigator: true);
                Navigator.of(context).pop();
              } catch (e) {}
              var text1 =
              _prefHelper.getStringByKey(MaruConstant.pet_name, "");
              var text2 =
              _prefHelper.getStringByKey(MaruConstant.sex, "");
              var text3 =
              _prefHelper.getStringByKey(MaruConstant.height, "");
              var text4 =
              _prefHelper.getStringByKey(MaruConstant.weight, "");
              var text5 =
              _prefHelper.getStringByKey(MaruConstant.age, "");
              return
                Scaffold(
                    backgroundColor: MaaruColors.DogsBackground,
                    bottomNavigationBar: CreateHomeScreen(
                      // Color:MaaruColors.textButtonColor
                    ),
                    body: SafeArea(
                        bottom: false,
                        child: ListView.builder(
                            itemCount: _cars.length,
    itemBuilder: (context, index) {
      Data car = _cars[index] as Data;

                         return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(car.email),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      alignment: Alignment.bottomRight,
                                      height: size.height * 0.25,
                                      width: size.width * 0.9,
                                      child: BackgroundImage(
                                          assetImage: _prefHelper.getStringByKey(MaruConstant.img, '')
                                        //'assets/images/kutta.png',
                                      )),
                                  Container(
                                    //height: size.,
                                      width: 1000,
                                      height: 800,
                                      alignment: FractionalOffset.bottomCenter,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              30, 10, 0, 10),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
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
                                                          Navigator.of(context)
                                                              .push(
                                                              MaterialPageRoute(
                                                                  builder: (
                                                                      _) =>
                                                                      ViewPetProfile2()));
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/icone-setting-68.png',
                                                          height: 40,
                                                          width: 40,
                                                          color: Colors
                                                              .grey[100],
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    ViewPetProfile3()));
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/icone-setting-68.png',
                                                        height: 40,
                                                        width: 40,
                                                        color: Colors.grey[100],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .end,
                                                    children: [
                                                      Text(
                                                        _prefHelper.getStringByKey(MaruConstant.first_name, ''),
                                                        style: MaaruStyle.text
                                                            .large,
                                                      ),
                                                      SizedBox(
                                                        width: size.width *
                                                            0.60,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                context).push(
                                                                MaterialPageRoute(
                                                                    builder: (
                                                                        _) =>
                                                                        CreateregisterPetProfile1()));
                                                          },
                                                          child: Image.asset(
                                                            'assets/icons/icone-setting-29.png',
                                                            height: 40,
                                                          ))
                                                    ]),
                                                Text( '',
                                                  //  _prefHelper.getStringByKey(MaruConstant.last_name, ''),
                                                  style: MaaruStyle.text.tiny,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                        EdgeInsets.only(
                                                            right: 30, top: 20),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                height: 80,
                                                                width: 70,
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey[50],
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15.0),
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets
                                                                              .only(
                                                                              top: 20),
                                                                          child: Text(
                                                                              'Age',
                                                                              style: MaaruStyle
                                                                                  .text
                                                                                  .red)),
                                                                      Text(
                                                                          _prefHelper.getStringByKey(MaruConstant.age, ''),

                                                                          style: MaaruStyle
                                                                              .text
                                                                              .tinyDisable),
                                                                    ]),
                                                              ),
                                                              Container(
                                                                height: 80,
                                                                width: 70,
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey[50],
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15.0),
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets
                                                                              .only(
                                                                              top: 20),
                                                                          child: Text(
                                                                              'Sex',
                                                                              style: MaaruStyle
                                                                                  .text
                                                                                  .red)),
                                                                      Text(
                                                                          _prefHelper.getStringByKey(MaruConstant.sex , ''),
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .tinyDisable),
                                                                    ]),
                                                              ),
                                                              Container(
                                                                height: 80,
                                                                width: 70,
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey[50],
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15.0),
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets
                                                                              .only(
                                                                              top: 20),
                                                                          child: Text(
                                                                              'Height',
                                                                              style: MaaruStyle
                                                                                  .text
                                                                                  .red)),
                                                                      Text(
                                                                          _prefHelper.getStringByKey(MaruConstant.height  , ''),
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .tinyDisable),
                                                                    ]),
                                                              ),

                                                              Container(
                                                                height: 80,
                                                                width: 70,
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey[50],
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15.0),
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets
                                                                              .only(
                                                                              top: 20),
                                                                          child:
                                                                          Text(
                                                                              'Weight',
                                                                              style: MaaruStyle
                                                                                  .text
                                                                                  .red)),
                                                                      Text(
                                                                          _prefHelper.getStringByKey(MaruConstant.weight, ''),
                                                                          style: MaaruStyle
                                                                              .text
                                                                              .tinyDisable),
                                                                    ]),
                                                              ),
                                                            ])),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                        height: size.height *
                                                            0.13,
                                                        width: size.width *
                                                            0.99,
                                                        decoration: BoxDecoration(
                                                          color: Colors
                                                              .green[50],
                                                          borderRadius: BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(30),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                  30)),
                                                        ),
                                                        child: Padding(
                                                            padding: EdgeInsets
                                                                .only(top: 20),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                      padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                          left: 43),
                                                                      child: Text(
                                                                        'Jimmmy Booker',
                                                                        style:
                                                                        MaaruStyle
                                                                            .text
                                                                            .tiniest,
                                                                      )),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                        'Owner',
                                                                        style: MaaruStyle
                                                                            .text
                                                                            .tiny,
                                                                        textAlign: TextAlign
                                                                            .center,
                                                                      ),
                                                                      SizedBox(
                                                                        width: size
                                                                            .width *
                                                                            0.22,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        'assets/icons/icone-setting-69.png',
                                                                        height: 20,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ]))),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      'Upcoming Appointments',
                                                      style: MaaruStyle.text
                                                          .tiniest,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets
                                                          .fromLTRB(
                                                          0, 20, 20, 20),
                                                      child: Container(
                                                        height: 150,
                                                        width: 400,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .circular(20),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey[300])),
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .all(10),
                                                          child: Row(
                                                            children: [
                                                              Expanded(child:
                                                              Container(
                                                                width: 100,

                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      20),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Image
                                                                    .asset(
                                                                  'assets/images/kutta.png',
                                                                  height: 200,),
                                                              )),

                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                        'Austin pet care',
                                                                        style: MaaruStyle
                                                                            .text
                                                                            .tiniestSmall
                                                                    ),
                                                                    Text(
                                                                        'Pet walking',
                                                                        style: MaaruStyle
                                                                            .text
                                                                            .tiny
                                                                    ),
                                                                    SizedBox(
                                                                      height: 20,
                                                                    ),
                                                                    Text(
                                                                        '1357 Muno Manor',
                                                                        style: MaaruStyle
                                                                            .text
                                                                            .greyDisable
                                                                    ),
                                                                    Text(
                                                                      'Austin,Tx 75923',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize: 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                //width: 40,
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment
                                                                      .end,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_today_outlined,
                                                                      size: 22,
                                                                      color: Colors
                                                                          .yellow,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 36,
                                                                    ),
                                                                    Text(
                                                                      'Aug 21,2021',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize: 12),
                                                                    ),
                                                                    Text(
                                                                      '11:00 am',
                                                                      style: TextStyle(
                                                                          fontSize: 13,
                                                                          fontWeight: FontWeight
                                                                              .bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .push(
                                                              MaterialPageRoute(
                                                                  builder: (
                                                                      _) =>
                                                                      AppointmentScreen()));
                                                        },
                                                        child:
                                                        RoundedButton(
                                                          buttonName: 'View all Appointments',
                                                          Color: MaaruColors
                                                              .primaryColorsuggesion,
                                                          Color1: MaaruColors
                                                              .button2Color,
                                                        )
                                                    )
                                                  ],
                                                )
                                              ])))
                                ]);})));
            }),
      ),
    );
  }
}
