
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';

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
  bool color;
  Color Groomingcolor = Color(0xff5e34d1);
  Color Vetcolor = Color(0xff5e34d1);
  Color Walkingcolor = Color(0xff5e34d1);
  Color hotelcolor = Color(0xff5e34d1);
  Color daycarecolor = Color(0xff5e34d1);
  Color filterone = MaaruColors.greyColorText;
  Color filtertwo = MaaruColors.greyColorText;
  String switchimage = 'assets/icons/icon-bl-19.png';

  double height = 40;
  double leftpad = 0.9;
  String text = '';
  TextEditingController _petNameController;

  @override
  void initState() {
    _petNameController = TextEditingController();

    super.initState();
  }

  final SharedPrefHelper _prefHelper =
      KiwiContainer().resolve<SharedPrefHelper>();

  Widget use(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: BlocProvider(
        create: (context) => KiwiContainer().resolve<LoginBloc>(),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginInitial) {
            BlocProvider.of<LoginBloc>(context).add(event.GetProvider(text));
            print('figffgfg${text}');
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProviderLoaded1) {
            return Container(
                margin: const EdgeInsets.only(
                    top: 70, bottom: 0, left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowLocation(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE8E8E8)),
                                  borderRadius: BorderRadius.circular(15)),
                              height: size.height * 0.06,
                              width: size.width * 0.62,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 2.0, left: 20.0),
                                  hintText: 'Search',
                                  hintStyle: MaaruStyle.text.tiny,
                                  suffixIcon: Image.asset(
                                    'assets/icons/icone-setting-19.png',
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              )),
                          Align(
                            alignment: Alignment(0.6, 0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MapView()));
                                });
                              },
                              child: Image.asset(
                                'assets/icons/icone-setting-61.png',
                                height: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Align(
                            alignment: Alignment(leftpad, 0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    switchimage == 'assets/icons/icon-bl-19.png'
                                        ? switchimage =
                                            'assets/icons/icone-setting-62.png'
                                        : switchimage =
                                            'assets/icons/icon-bl-19.png';
                                    height == 40 ? height = 165 : height = 40;
                                    leftpad == 0.9
                                        ? leftpad = 0
                                        : leftpad = 0.9;
                                    Switchcontainerheight == 0
                                        ? Switchcontainerheight = 80
                                        : Switchcontainerheight = 0;
                                  });
                                },
                                child: Image.asset(
                                  switchimage,
                                  height: height,
                                )),
                          ),
                          Positioned(
                              left: 20,
                              bottom: 20,
                              child: switchcontainer(context,
                                  height: Switchcontainerheight)),
                        ],
                      ),

                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          reverse: true,
                          itemCount:
                              state.getProviderModel.providersListing.length,
                          itemBuilder: (BuildContext context, int index) {
                            return   state.getProviderModel.providersListing.isNotEmpty?Column(
                              children: [
                                Column(children: [
                                  InkWell(
                                    onTap:()async{
                                      if (mounted) {
                                      setState(()  {

                                        print('dkjhjfhjkfhjfhjfjfhjfjfffffff ${state.getProviderModel.providersListing[index].id}');
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              BookAppointment1(id1:state.getProviderModel.providersListing[index].id),
                                        ));
                                      });
}
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[200], width: 2),
                                          ),
                                      height: 120,
                                      child: Container(
                                        color: Colors.white,
                                        margin: EdgeInsets.all(13.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Colors.white,
                                                      Colors.white
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                width: 120,
                                                child: Image.network(
                                                  state
                                                      .getProviderModel
                                                      .providersListing[index]
                                                      .img,
                                                  errorBuilder: (BuildContext,
                                                      Object, StackTrace) {
                                                    return Image.asset(
                                                      'assets/images/kutta.png',
                                                      fit: BoxFit.fitWidth,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    state
                                                        .getProviderModel
                                                        .providersListing[index]
                                                        .companyName
                                                        .toString(),

                                                    // _prefHelper.getStringByKey(MaruConstant.company_name, ''),
                                                    style: MaaruStyle.text.tiny,
                                                  ),
                                                ),
                                                // Expanded(
                                                //     child: Text(
                                                //   state
                                                //       .getProviderModel
                                                //       .providersListing[index]
                                                //       .serviceType
                                                //       .toString(),
                                                //   //   _prefHelper.getStringByKey(MaruConstant., ''),
                                                //   style: MaaruStyle.text.medium,
                                                // )),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/ffth.png',
                                                        height: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '${state.getProviderModel.providersListing[index].reviews} Reviews (${state.getProviderModel.providersListing[index].averageRating})',
                                                        style:MaaruStyle.text.medium,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ]),
                              ],
                            ):Center(child:const Text('No data found'));
                            // RepeatContainer('assets/images/kutta.png',),
                            // SizedBox(
                            //   height: size.height * 0.02,
                            // ),
                            // RepeatContainer('assets/images/kutta.png',),
                          })
                    ]));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
          ;
        }),
      ),
    );
  }

  // Widget switchcontainer(
  //   BuildContext context,
  // ) {
  //   final size = MediaQuery.of(context).size;
  //   return BlocProvider(
  //       create: (context) => KiwiContainer().resolve<LoginBloc>(),
  //       child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
  //         if (state is ProviderLoaded1) {
  //           SchedulerBinding.instance.addPostFrameCallback((_) {
  //             Navigator.pushReplacement(context,
  //                 MaterialPageRoute(builder: (BuildContext context) {
  //               return Scaffold(
  //                   body: SingleChildScrollView(child: use(context)));
  //             }));
  //           });
  //           return Container();
  //         }
  //         return Column(
  //           children: [
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(
  //                 top: 0.0,
  //               ),
  //               child: Row(
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           Groomingcolor == Color(0xff5e34d1)
  //                               ? Groomingcolor = Colors.red
  //                               : Groomingcolor = Color(0xff5e34d1);
  //                         });
  //                         text = 'grooming';
  //                         print(text);
  //
  //                         BlocProvider.of<LoginBloc>(context)
  //                             .add(event.GetProvider(text));
  //                       }
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           color: Groomingcolor),
  //                       height: size.height * 0.05,
  //                       width: size.width * 0.11,
  //                       child: Image.asset(
  //                         'assets/icons/icone-setting-55.png',
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: size.width * 0.10,
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           Vetcolor == Color(0xff5e34d1)
  //                               ? Vetcolor = Colors.red
  //                               : Vetcolor = Color(0xff5e34d1);
  //                         });
  //                       }
  //                       text = 'Walking';
  //                       print(text);
  //
  //                       BlocProvider.of<LoginBloc>(context)
  //                           .add(event.GetProvider(text));
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           color: Vetcolor),
  //                       height: size.height * 0.05,
  //                       width: size.width * 0.11,
  //                       child: Image.asset(
  //                         'assets/icons/icone-setting-56.png',
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: size.width * 0.05,
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           hotelcolor == Color(0xff5e34d1)
  //                               ? hotelcolor = Colors.red
  //                               : hotelcolor = Color(0xff5e34d1);
  //                         });
  //                       }
  //                       text = 'Vet';
  //                       print(text);
  //
  //                       BlocProvider.of<LoginBloc>(context)
  //                           .add(event.GetProvider(text));
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           color: hotelcolor),
  //                       height: size.height * 0.05,
  //                       width: size.width * 0.11,
  //                       child: Image.asset(
  //                         'assets/icons/icone-setting-57.png',
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: size.width * 0.05,
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           daycarecolor == Color(0xff5e34d1)
  //                               ? daycarecolor = Colors.red
  //                               : daycarecolor = Color(0xff5e34d1);
  //                         });
  //                       }
  //                       text = 'Hotel';
  //                       print(text);
  //
  //                       BlocProvider.of<LoginBloc>(context)
  //                           .add(event.GetProvider(text));
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           color: daycarecolor),
  //                       height: size.height * 0.05,
  //                       width: size.width * 0.11,
  //                       child: Image.asset(
  //                         'assets/icons/icone-setting-58.png',
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: size.width * 0.05,
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           Walkingcolor == Color(0xff5e34d1)
  //                               ? Walkingcolor = Colors.red
  //                               : Walkingcolor = Color(0xff5e34d1);
  //                         });
  //                       }
  //                       text = 'Hospital';
  //                       print(text);
  //
  //                       BlocProvider.of<LoginBloc>(context)
  //                           .add(event.GetProvider(text));
  //                     },
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           color: Walkingcolor),
  //                       height: size.height * 0.05,
  //                       width: size.width * 0.11,
  //                       child: Image.asset('assets/icons/icone-setting-59.png'),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: size.height * 0.05,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 GestureDetector(
  //                     onTap: () {
  //                       if (mounted) {
  //                         setState(() {
  //                           Walkingcolor == Color(0xff5e34d1)
  //                               ? Walkingcolor = Colors.red
  //                               : Walkingcolor = Color(0xff5e34d1);
  //                         });
  //                       }
  //                       text = '2-3 ratings ';
  //                       print(text);
  //
  //                       BlocProvider.of<LoginBloc>(context)
  //                           .add(event.GetProvider(text));
  //                     },
  //                     child: Container(
  //                       height: 20,
  //                       width: 100,
  //                       decoration: BoxDecoration(
  //                           border: Border.all(color: Colors.grey)),
  //                       child: Text('  2-3 ratings ',
  //                           style: MaaruStyle.text.greyDisable,
  //                           textAlign: TextAlign.center),
  //                     )),
  //                 SizedBox(
  //                   width: 40,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     if (mounted) {
  //                       setState(() {
  //                         Walkingcolor == Color(0xff5e34d1)
  //                             ? Walkingcolor = Colors.red
  //                             : Walkingcolor = Color(0xff5e34d1);
  //                       });
  //                     }
  //                     text = '3-4 ratings ';
  //                     print(text);
  //
  //                     BlocProvider.of<LoginBloc>(context)
  //                         .add(event.GetProvider(text));
  //                   },
  //                   child: Container(
  //                     height: 20,
  //                     width: 100,
  //                     decoration:
  //                         BoxDecoration(border: Border.all(color: Colors.grey)),
  //                     child: Text(
  //                       '  3-4 ratings ',
  //                       style: MaaruStyle.text.greyDisable,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             )
  //           ],
  //         );
  //       }));
  // }
  Color switchcolor = Color(0xff5e34d1);
  Color activecolor = Colors.red;
  double Switchcontainerheight = 0;

  Widget switchcontainer(BuildContext context, {double height}) {
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
          return Container(
            height: height,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(mounted) {
                          setState(() {
                          Groomingcolor == Color(0xff5e34d1)
                              ? Groomingcolor = Colors.red
                              : Groomingcolor = Color(0xff5e34d1);
                        });
                        }
                        text = 'grooming';
                        print(text);

                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(text));
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
                      width: size.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        if(mounted) {
                          setState(() {
                          Vetcolor == Color(0xff5e34d1)
                              ? Vetcolor = Colors.red
                              : Vetcolor = Color(0xff5e34d1);
                        });
                        }
                        text = 'vet';
                        print(text);

                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(text));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Vetcolor),
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
                        if(mounted) {
                          setState(() {
                          hotelcolor == Color(0xff5e34d1)
                              ? hotelcolor = Colors.red
                              : hotelcolor = Color(0xff5e34d1);
                        });
                        }
                        text = 'hotel';
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
                        if(mounted) {
                          setState(() {
                          daycarecolor == Color(0xff5e34d1)
                              ? daycarecolor = Colors.red
                              : daycarecolor = Color(0xff5e34d1);
                        });
                        }
                        text = 'daycare';
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
                        if(mounted) {
                          setState(() {
                          Walkingcolor == Color(0xff5e34d1)
                              ? Walkingcolor = Colors.red
                              : Walkingcolor = Color(0xff5e34d1);
                        });
                        }
                        text = 'walking';
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
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(mounted) {
                          setState(() {
                          filterone == MaaruColors.greyColorText
                              ? filterone = MaaruColors.whiteColor
                              : filterone = MaaruColors.greyColorText;
                        });
                        }
                        text = '3-4  rating';
                        print(text);

                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(text));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: filterone),
                            borderRadius: BorderRadius.circular(5.0)),
                        height: size.height * 0.03,
                        width: size.width * 0.30,
                        child: Center(
                            child: Text(
                          '3-4 rating',
                          style: TextStyle(fontSize: 10, color: filterone),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        if(mounted) {
                          setState(() {
                          filtertwo == MaaruColors.greyColorText
                              ? filtertwo = MaaruColors.whiteColor
                              : filtertwo = MaaruColors.greyColorText;
                        });
                        }
                        text = '4+ rating';
                        print(text);

                        BlocProvider.of<LoginBloc>(context)
                            .add(event.GetProvider(text));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: filtertwo),
                            borderRadius: BorderRadius.circular(5.0)),
                        height: size.height * 0.03,
                        width: size.width * 0.28,
                        child: Center(
                            child: Text(
                          '4+ rating',
                          style: TextStyle(fontSize: 10, color: filtertwo),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateHomeScreen(
          selectedIndex: 2,
        ),
        body: SingleChildScrollView(child: use(context)

            ));
  }

  void submitServices(String text) {
    BlocProvider.of<LoginBloc>(context)
        .add(event.GetProvider(_petNameController.text));
  }
}
