
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/grooming_search.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/main.dart';
import 'package:flutter/scheduler.dart';
import 'create_home_screen.dart';
import 'dart:async';
import 'dart:ui';

import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
as event;

class ProviderSearchScreen extends StatefulWidget {
  @override
  _ProviderSearchScreenState createState() => _ProviderSearchScreenState();
}

class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
  Color Groomingcolor = Color(0xff5e34d1);
  Color Vetcolor = Color(0xff5e34d1);
  Color Walkingcolor = Color(0xff5e34d1);
  Color hotelcolor = Color(0xff5e34d1);
  Color daycarecolor = Color(0xff5e34d1);

  String switchimage = 'assets/icons/icon-bl-19.png';

  double height = 45;
  double leftpad = 310;
  String text = '';
  TextEditingController _petNameController;

  @override
  void initState() {
    _petNameController = TextEditingController();

    super.initState();
  }


  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  Column RepeatContainer(String image) {
    int index = 100;
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200], width: 2),
            borderRadius: BorderRadius.circular(25)),
        height: 120,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => BookAppointment1()));
          },
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(13.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.grey.shade500]),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(_prefHelper.getStringByKey(
                              MaruConstant.img, '')))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'shandan',
                      // _prefHelper.getStringByKey(MaruConstant.company_name, ''),
                      style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'null',
                      //   _prefHelper.getStringByKey(MaruConstant., ''),
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ffth.png',
                          height: 25,
                        ),
                        Text(
                          _prefHelper.getStringByKey(
                              MaruConstant.rating_reviews, ''),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w900),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      )
    ]);
  }

  Color switchcolor = Color(0xff5e34d1);
  Color activecolor = Colors.red;
  Widget searchUse(BuildContext context) {
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is ProviderLoaded1) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                        body:
                        SingleChildScrollView(
                          child:
                              
                          Container(

                              margin: const EdgeInsets.only(
                                  top: 70, bottom: 0, left: 10, right: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShowLocation(),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Stack(
                                      children: [
                                        searchUse(context),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 260),
                                          child: GestureDetector(
                                            onTap: () {

                                              setState(() {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MapView()));
                                              });

                                            },
                                            child: Image.asset(
                                              'assets/icons/icone-setting-61.png',
                                              height: 45,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: leftpad),
                                          child: GestureDetector(
                                              onTap: () {
                                                if  (mounted ){

                                                }
                                                if(mounted) {
                                                  setState(() {
                                                    switchimage ==
                                                        'assets/icons/icon-bl-19.png'
                                                        ? switchimage =
                                                    'assets/icons/icone-setting-62.png'
                                                        : switchimage =
                                                    'assets/icons/icon-bl-19.png';
                                                    height == 45
                                                        ? height = 180
                                                        : height = 45;
                                                    leftpad == 310
                                                        ? leftpad = 0
                                                        : leftpad = 310;
                                                  });
                                                }

                                              },
                                              child: Image.asset(
                                                switchimage,
                                                height: height,
                                              )),
                                        ),
                                        Positioned(

                                            child: switchcontainer(context))
                                      ],
                                    ),
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: state
                                            .getProviderModel.providersListing.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return
                                            Column(children: [
                                            Container(

                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey[200],
                                                      width: 2),
                                                  borderRadius:
                                                  BorderRadius.circular(25)),
                                              height: 120,
                                              child: InkWell(
                                                onTap: () async {
                                                  if(mounted) {
                                                    setState(() {

                                                      Navigator.of(context)
                                                          .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            BookAppointment1(),
                                                      ));
                                                    });
                                                  }
                                                  var id3 = state.getProviderModel
                                                      .providersListing[index].id;
                                                  //  _prefHelper.saveString(, value)

                                                  print('gfuiygdhyugdyhugdyuedginlfoi$id3');
                                                  var serviceid1 = state
                                                      .getProviderModel
                                                      .providersListing[index]
                                                      .serviceId;
                                                  await _prefHelper.saveInt(
                                                      'id', id3);
                                                  await _prefHelper.saveInt(
                                                      'service_id', serviceid1);
                                                  // final id4 =  _prefHelper.getIntByKey('id',id3);

                                                  print(
                                                      'jhkhffhfkjhfjkhfjkbhejdhfjdbffbfbggggg${state.getProviderModel.providersListing[index].serviceId}');
                                                },
                                                child: Container(

                                                  color: Colors.white,
                                                  margin: EdgeInsets.all(13.0),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 90,
                                                        // decoration: BoxDecoration(
                                                        //     gradient: LinearGradient(
                                                        //         colors: [
                                                        //           Colors.black,
                                                        //           Colors.grey.shade500
                                                        //         ]),
                                                        //     borderRadius:
                                                        //         BorderRadius.circular(
                                                        //             15),
                                                        //     image: DecorationImage(
                                                        //         image: state
                                                        //                 .getProviderModel
                                                        //                 .providersListing[
                                                        //                     index]
                                                        //                 .img
                                                        //                 .isNotEmpty
                                                        //             ? const ExactAssetImage(
                                                        //                 'assets/images/image_2021_08_31T05_29_55_856Z (1).png')
                                                        //             : Image.network(state
                                                        //                 .getProviderModel
                                                        //                 .providersListing[index]
                                                        //                 .img))
                                                        // ),
                                                        child: Image.network(state
                                                            .getProviderModel
                                                            .providersListing[
                                                        index]
                                                            .img),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            state
                                                                .getProviderModel
                                                                .providersListing[
                                                            index]
                                                                .companyName
                                                                .toString(),

                                                            // _prefHelper.getStringByKey(MaruConstant.company_name, ''),
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.w900),
                                                          ),
                                                          Text(
                                                            state
                                                                .getProviderModel
                                                                .providersListing[
                                                            index]
                                                                .serviceType
                                                                .toString(),
                                                            //   _prefHelper.getStringByKey(MaruConstant., ''),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                FontWeight.w900),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/icons/ffth.png',
                                                                height: 20,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                '${state.getProviderModel.providersListing[index].reviews} Reviews (${state.getProviderModel.providersListing[index].averageRating})',
                                                                style: const TextStyle(
                                                                    fontSize: 10,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ]);
                                          // RepeatContainer('assets/images/kutta.png',),
                                          // SizedBox(
                                          //   height: size.height * 0.02,
                                          // ),
                                          // RepeatContainer('assets/images/kutta.png',),
                                        })
                                  ])),
                        ));

                  }));
            });
            return Container();
          }
          return

            Container(
              decoration: BoxDecoration(
                //
                //  color: Colors.red,
                  border: Border.all(color: Color(0xffE8E8E8)),
                  borderRadius: BorderRadius.circular(20)),
              height: 50,
              width: 250,
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 2.0, left: 20.0),
                  hintText: 'Search',
                  hintStyle: MaaruStyle.text.tiny,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        if  (mounted ){

                        }
                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(_petNameController.text));
                      },


                      child: Image.asset(
                        'assets/icons/icone-setting-19.png',
                        height: 100,
                      )),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),

                onSubmitted: (text){
                  if (mounted) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(event.GetProvider(_petNameController.text));
                  }
                },
                controller: _petNameController,
              ),
            );
        }));
  }

  Widget use(BuildContext context) {
    return

      Container(
        margin: EdgeInsets.only(top: 70, bottom: 0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowLocation(),

            SizedBox(
              height: 15.0,
            ),
            Stack(
              children: [
                searchUse(context),
                Padding(
                  padding: const EdgeInsets.only(left: 260),
                  child: GestureDetector(
                    onTap: () {
                      if  (mounted ){

                      }
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MapView()));
                      });
                    },
                    child: Image.asset(
                      'assets/icons/icone-setting-61.png',
                      height: 45,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: leftpad),
                  child: GestureDetector(
                      onTap: () {
                        if  (mounted ){

                        }
                        setState(() {
                          switchimage == 'assets/icons/icon-bl-19.png'
                              ? switchimage =
                          'assets/icons/icone-setting-62.png'
                              : switchimage = 'assets/icons/icon-bl-19.png';
                          height == 45 ? height = 180 : height = 45;
                          leftpad == 310 ? leftpad = 0 : leftpad = 310;
                        });
                      },
                      child: Image.asset(
                        switchimage,
                        height: height,
                      )),
                ),
                Positioned(
                    left: 30, bottom: 60, child: switchcontainer(context))
              ],
            ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // //RepeatContainer('assets/images/kutta.png',),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            BlocProvider(
                create: (context) => KiwiContainer().resolve<LoginBloc>(),
                child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginInitial) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(text));
                        print('figffgfg${text}');
                        return CircularProgressIndicator();
                      } else if (state is ProviderLoaded1) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:
                            state.getProviderModel.providersListing.length,
                            itemBuilder: (BuildContext context, int index) {
                              return
                                Column(

                                  children: [
                                    Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[200], width: 2),
                                          borderRadius: BorderRadius.circular(25)),
                                      height: 120,
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            if  (mounted ){

                                            }
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => BookAppointment1(),
                                            ));
                                          });
                                          var id3 = state.getProviderModel
                                              .providersListing[index].id;

                                          print(id3);
                                          var serviceid1 = state.getProviderModel
                                              .providersListing[index].serviceId;
                                          await _prefHelper.saveInt('id', id3);
                                          await _prefHelper.saveInt(
                                              'service_id', serviceid1);
                                          // final id4 =  _prefHelper.getIntByKey('id',id3);

                                          print(
                                              'jhkhffhfkjhfjkhfjkbhejdhfjdbffbfbggggg${state.getProviderModel.providersListing[index].id}');
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          margin: EdgeInsets.all(13.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(colors: [
                                                      Colors.black,
                                                      Colors.grey.shade500
                                                    ]),
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    image: DecorationImage(
                                                        image: state
                                                            .getProviderModel
                                                            .providersListing[index]
                                                            .img
                                                            .isNotEmpty
                                                            ? const ExactAssetImage(
                                                            'assets/images/image_2021_08_31T05_29_55_856Z (1).png')
                                                            : Image.network(state
                                                            .getProviderModel
                                                            .providersListing[index]
                                                            .img))),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state
                                                        .getProviderModel
                                                        .providersListing[index]
                                                        .companyName
                                                        .toString(),

                                                    // _prefHelper.getStringByKey(MaruConstant.company_name, ''),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w900),
                                                  ),
                                                  Text(
                                                    state
                                                        .getProviderModel
                                                        .providersListing[index]
                                                        .serviceType
                                                        .toString(),
                                                    //   _prefHelper.getStringByKey(MaruConstant., ''),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w900),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/ffth.png',
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '${state.getProviderModel.providersListing[index].reviews} Reviews (${state.getProviderModel.providersListing[index].averageRating})',
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w900),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                              ]),
                                  ],
                                );
                              // RepeatContainer('assets/images/kutta.png',),
                              // SizedBox(
                              //   height: size.height * 0.02,
                              // ),
                              // RepeatContainer('assets/images/kutta.png',),
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                      ;
                    })),
          ],
        ));
  }

  Widget switchcontainer(
      BuildContext context,
      ) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is ProviderLoaded1) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                        body: SingleChildScrollView(child: use(context)));
                  }));
            });
            return Container();
          }
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      Groomingcolor == Color(0xff5e34d1)
                          ? Groomingcolor = Colors.red
                          : Groomingcolor = Color(0xff5e34d1);
                    });
                    text = 'grooming';
                    print(text);

                    BlocProvider.of<LoginBloc>(context)
                        .add(event.GetProvider(text));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Groomingcolor),
                  height: size.height * 0.05,
                  width: size.width * 0.11,
                  child: Image.asset(
                    'assets/icons/icone-setting-55.png',
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.10,
              ),
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      Vetcolor == Color(0xff5e34d1)
                          ? Vetcolor = Colors.red
                          : Vetcolor = Color(0xff5e34d1);
                    });
                  }
                  text = 'Walking';
                  print(text);

                  BlocProvider.of<LoginBloc>(context)
                      .add(event.GetProvider(text));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Vetcolor),
                  height: size.height * 0.05,
                  width: size.width * 0.11,
                  child: Image.asset(
                    'assets/icons/icone-setting-56.png',
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      hotelcolor == Color(0xff5e34d1)
                          ? hotelcolor = Colors.red
                          : hotelcolor = Color(0xff5e34d1);
                    });
                  }
                  text = 'Vet';
                  print(text);

                  BlocProvider.of<LoginBloc>(context)
                      .add(event.GetProvider(text));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: hotelcolor),
                  height: size.height * 0.05,
                  width: size.width * 0.11,
                  child: Image.asset(
                    'assets/icons/icone-setting-57.png',
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      daycarecolor == Color(0xff5e34d1)
                          ? daycarecolor = Colors.red
                          : daycarecolor = Color(0xff5e34d1);
                    });
                  }
                  text = 'Hotel';
                  print(text);

                  BlocProvider.of<LoginBloc>(context)
                      .add(event.GetProvider(text));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: daycarecolor),
                  height: size.height * 0.05,
                  width: size.width * 0.11,
                  child: Image.asset(
                    'assets/icons/icone-setting-58.png',
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      Walkingcolor == Color(0xff5e34d1)
                          ? Walkingcolor = Colors.red
                          : Walkingcolor = Color(0xff5e34d1);
                    });
                  }
                  text = 'Hospital';
                  print(text);

                  BlocProvider.of<LoginBloc>(context)
                      .add(event.GetProvider(text));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Walkingcolor),
                  height: size.height * 0.05,
                  width: size.width * 0.11,
                  child: Image.asset('assets/icons/icone-setting-59.png'),
                ),
              ),
              // SizedBox(
              //   width: size.width * 0.05,
              // ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(child: use(context)

          // ListView.builder(
          // scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          // itemCount: 10,
          // itemBuilder: (BuildContext context,int index){

        ));
  }

  void submitServices(String text) {
    BlocProvider.of<LoginBloc>(context).add(event.GetProvider(_petNameController.text));
  }
}
