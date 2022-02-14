
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

import 'book_appointment_screen1.dart';
import 'booked_confirm.dart';

class BookAppointment2 extends StatefulWidget {
  final int id2;

  const BookAppointment2({ this.id2});
  @override
  _BookAppointment2State createState() => _BookAppointment2State();
}

class _BookAppointment2State extends State<BookAppointment2> {
  bool star1 = true;
  bool star2 = true;
  bool star3 = true;
  bool star4 = true;
  bool star5 = true;
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:(_prefHelper.getStringByKey('pet_name', '').isNotEmpty)?
        const CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ):const CreateProviderHome(),
        body: SafeArea(
            bottom: false,
            child: Center(
                child: BlocProvider(
                    create: (context) =>
                        KiwiContainer().resolve<PetProfileBloc>(),
                    child: BlocBuilder<PetProfileBloc, PetProfileState>(
                        builder: (context, state) {
                          if (state is PetProfileInitial) {
                            BlocProvider.of<PetProfileBloc>(context)
                                .add(GetSinglePRovider(widget.id2));
                            return const CircularProgressIndicator();
                          } else if (state is SingleProviderLoaded) {
                            int abc;
                            return ListView(
                              children: [
                                Flex(direction: Axis.vertical, children: [
                                  Container(
                                    height: 200,
                                    width: 500,
                                    child: Image.network(
                                      state.welcome4.providerDetails.provider.img,
                                      fit: BoxFit.fitWidth,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                            color: Colors.amber,
                                            alignment: Alignment.bottomCenter,
                                            child:
                                            Image.asset('assets/images/kutta.png'));
                                      },
                                    ),
                                  ),
                                  Container(
                                    // height: size.height * 1.1,
                                    decoration:
                                    const BoxDecoration(color: Colors.white),

                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                        color: Color(0xffFFFFFF),
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    BookAppointment1(id1: widget.id2,)));
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/Rectangle copy 3.png',
                                                        height: 40,
                                                        width: 40,
                                                      )),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    BookAppointment2(id2: widget.id2,)));
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/Rectangle copy 3.png',
                                                        height: 40,
                                                        width: 40,
                                                      )),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                       if(_prefHelper.getStringByKey('pet_name', '').isNotEmpty){
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    BookAppointmentScreen3(id3: widget.id2,image:  state.welcome4.providerDetails.provider.img,)));}
                                                       else{

                                                       }
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/icone-setting-68.png',
                                                        height: 40,
                                                        width: 40,
                                                        color: Colors.grey[100],
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                      state.welcome4.providerDetails
                                                          .provider.companyName
                                                          .toString(),
                                                      style:
                                                      MaaruStyle.text.tiniest),
// SizedBox(width: size.width*0.34,),
                                                  Image.asset(
                                                      'assets/icons/New Project (2).png',
                                                      width: size.width * 0.08)
                                                ],
                                              ),
                                              Text(
                                                //'${state.welcome4.providerDetails[_prefHelper.getIntByKey('id', abc)].city.toString()} ${state.welcome4.providerDetails[_prefHelper.getIntByKey('id', abc)].state} ${state.welcome4.providerDetails[_prefHelper.getIntByKey('id', abc)].zipCode}',
                                                '${state.welcome4.providerDetails.provider.city.toString()} ${state.welcome4.providerDetails.provider.state} ${state.welcome4.providerDetails.provider.zipCode}',

                                                style: MaaruStyle.text.tiny,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Indicator(
                                                text: ' 5 ',
                                                text2: '(154)  ',
                                                assetImage:
                                                'assets/images/New Project (32).png',
                                              ),
                                              Indicator(
                                                text: ' 4 ',
                                                text2: '(21)    ',
                                                assetImage:
                                                'assets/images/New Project (33).png',
                                              ),
                                              Indicator(
                                                text: ' 3 ',
                                                text2: '(4)      ',
                                                assetImage:
                                                'assets/images/New Project (34).png',
                                              ),
                                              Indicator(
                                                text: ' 2 ',
                                                text2: '(0)      ',
                                                assetImage:
                                                'assets/images/New Project (35).png',
                                              ),
                                              Indicator(
                                                text: ' 1 ',
                                                text2: '(0)      ',
                                                assetImage:
                                                'assets/images/New Project (35).png',
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              ListView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount: state
                                                      .welcome4
                                                      .providerDetails
                                                      .provider.reviews
                                                      .length -1,
                                                  //state.welcome4.providerDetails.provider.reviews.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                      int index) {
                                                    return
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            mainAxisSize: MainAxisSize
                                                                .values.last,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              const CircleAvatar(
                                                                radius: 20,
                                                                backgroundColor:
                                                                Colors.black,
                                                                backgroundImage:
                                                                NetworkImage(
                                                                    'https://images.squarespace-cdn.com/content/v1/5ef8f04e964fab1126c5cf8b/1603736695413-4UCKNWV23VVSE63BQ9NR/Less+Professional+Profile.JPG'),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                size.width * 0.03,
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                    alignment: Alignment
                                                                        .centerLeft,
                                                                    child: Expanded(
                                                                        flex: 1,
                                                                        child: Text(
                                                                          state
                                                                              .welcome4
                                                                              .providerDetails
                                                                              .service[
                                                                          index]
                                                                              .providerName,
                                                                          style: const TextStyle(
                                                                              color: Colors
                                                                                  .black,
                                                                              fontSize:
                                                                              15,
                                                                              fontWeight:
                                                                              FontWeight.bold),
                                                                        ))),
                                                              ),
                                                              const SizedBox(
                                                                //  width: size.width * 0.40,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                size.width * 0.30,
                                                              ),
                                                              const Icon(
                                                                Icons.star,
                                                                size: 20,
                                                                color: Colors
                                                                    .yellowAccent,
                                                              ),
                                                              // Expanded(
                                                              //     child: Text(
                                                              //       state
                                                              //           .welcome4
                                                              //           .reviews[index]
                                                              //           .ratings
                                                              //           .toString(),
                                                              //       //state.
                                                              //       style: TextStyle(
                                                              //           fontSize: 15),
                                                              //     )),
                                                            ],
                                                          ),

                                                          Padding(
                                                              padding:EdgeInsets.only(left:50,),
                                                              child: Expanded(
                                                                  child: Text(
                                                                    state
                                                                        .welcome4
                                                                        .reviews[index]
                                                                        .reviewComment
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        color:
                                                                        Colors.black,
                                                                        fontSize: 15,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                  ))),
                                                        ],
                                                      );
                                                  }),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 55),
                                                child: Text(
                                                    _prefHelper.getStringByKey(
                                                        MaruConstant.companyName,
                                                        ''),
                                                    style: MaaruStyle.text.tiny),
                                              ),
                                              ThemedButton(
                                                text: 'Book Appointment',
                                                onPressed: () {
                                                  if(_prefHelper.getStringByKey('pet_name', '').isNotEmpty) {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>

                                                                BookAppointmentScreen3(
                                                                  id3: widget
                                                                      .id2,
                                                                  image: state
                                                                      .welcome4
                                                                      .providerDetails
                                                                      .provider
                                                                      .img,)));
                                                  }
                                                  else{

                                                  }
                                                },
                                                enabled: true,
                                              ),
                                              SizedBox(
                                                height: 50,
                                              )
                                            ])),
                                  ),
                                ]),
                              ],
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        })))));
//
//                   child: Column(
//                     children: [
//                       Container(
//                           margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
//                           color: Color(0xffFFFFFF),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.of(context).push(MaterialPageRoute(
//                                             builder: (_) => BookAppointment1()));
//                                       },
//                                       child:
//                                     Image.asset(
//                                       'assets/icons/Rectangle copy 3.png',
//                                       height: 40,
//                                       width: 40,
//                                     )),
//                                    const SizedBox(
//                                       width: 10,
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.of(context).push(MaterialPageRoute(
//                                               builder: (_) => BookAppointment2()));
//                                         },
//                                         child: Image.asset(
//                                           'assets/icons/Rectangle copy 3.png',
//                                           height: 40,
//                                           width: 40,
//
//                                         )),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.of(context).push(MaterialPageRoute(
//                                               builder: (_) => BookAppointmentScreen3()));
//                                         },
//                                         child:
//                                         Image.asset(
//                                           'assets/icons/icone-setting-68.png',
//                                           height: 40,
//                                           width: 40,
//                                           color: Colors.grey[100],
//                                         )),
//                                   ],
//                                 ),
//                                 Text(
//                                   'Austin Pet Groomer'.toUpperCase(),
//                                   style: MaaruStyle.text.xlarge
//                                 ),
// // SizedBox(width: size.width*0.34,),
//
//                                 Text(
//                                   '1115 Emihi Grove Austin, Textas 00000',
//                                   style:
//                                     MaaruStyle.text
//                                   .medium,),
//                                 SizedBox(
//                                   height: size.height * 0.02,
//                                 ),
//                                 Indicator(
//                                   text: ' 5 ',
//                                   text2: '(154)  ',
//                                   assetImage: 'assets/images/New Project (32).png',
//                                 ),
//                                 Indicator(
//                                   text: ' 4 ',
//                                   text2: '(21)    ',
//                                   assetImage: 'assets/images/New Project (33).png',
//                                 ),
//                                 Indicator(
//                                   text: ' 3 ',
//                                   text2: '(4)      ',
//                                   assetImage: 'assets/images/New Project (34).png',
//                                 ),
//                                 Indicator(
//                                   text: ' 2 ',
//                                   text2: '(0)      ',
//                                   assetImage: 'assets/images/New Project (35).png',
//                                 ),
//                                 Indicator(
//                                   text: ' 1 ',
//                                   text2: '(0)      ',
//                                   assetImage: 'assets/images/New Project (35).png',
//                                 ),
//                                 SizedBox(
//                                   height: size.height * 0.02,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 20,
//                                       backgroundColor: Colors.black,
//                                       backgroundImage: NetworkImage(
//                                           'https://images.squarespace-cdn.com/content/v1/5ef8f04e964fab1126c5cf8b/1603736695413-4UCKNWV23VVSE63BQ9NR/Less+Professional+Profile.JPG'),
//                                     ),
//                                     SizedBox(
//                                       width: size.width * 0.03,
//                                     ),
//                                     Text(
//                                       'Jimmy Hanks'.toUpperCase(),
//                                       style: MaaruStyle.text.tiny
//                                     ),
//                                     SizedBox(
//                                       width: size.width * 0.40,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 20,
//                                       color: Colors.yellowAccent,
//                                     ),
//                                     Text(
//                                       '5',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 55),
//                                   child: Text(
//                                     'Lorem ipsum dolor sit amet,consectur adipiscing elit,sed do ejusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                     style: MaaruStyle.text.greyDisable
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 20,
//                                       backgroundColor: Colors.black,
//                                       backgroundImage: NetworkImage(
//                                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU'),
//                                     ),
//                                     SizedBox(
//                                       width: size.width * 0.03,
//                                     ),
//                                     Text(
//                                       'Elen Brock'.toUpperCase(),
//                                       style:MaaruStyle.text.tiny
//                                     ),
//                                     SizedBox(
//                                       width: size.width * 0.40,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       size: 20,
//                                       color: Colors.yellowAccent,
//                                     ),
//                                     Text(
//                                       '5',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                     padding: const EdgeInsets.only(left: 55),
//                                     child: Text(
//                                       'Lorem ipsum dolor sit amet,consectur adipiscing elit,sed do ejusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                       style: MaaruStyle.text.greyDisable
//                                     )),
//                                 SizedBox(height: 10,),
//
//                                 SizedBox(
//                                   height: 50,
//                                 )
//                               ])),
//                       ThemedButton(
//                         text: 'Book Appointment',
//                         onPressed: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (_) => BookAppointmentScreen3()));
//                         },
//                         enabled: true,
//                       ),
//                     ],
//                   ),
//                 ),
//
//
//             ]),
//           ],
//         )));
// >>>>>>> f38077fb070e945e12e76eb4c96ccef8ae6ff65f
  }
}

class Indicator extends StatefulWidget {
  Indicator(
      {@required this.text, @required this.text2, @required this.assetImage});

  final String text;
  final String text2;
  final String assetImage;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            widget.text2,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Image.asset(
            widget.assetImage,
            width: 200,
          )
        ]));
  }
}
