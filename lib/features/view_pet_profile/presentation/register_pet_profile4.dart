// import 'package:flutter/material.dart';
// import 'package:maru/core/theme/maaru_style.dart';
// import 'package:maru/core/widget/background_image.dart';
// import 'package:maru/features/Home/presentation/home_sceen.dart';

// class CreateRegisterPetProfile4 extends StatefulWidget {
//   @override
//   _CreateRegisterPetProfile4State createState() =>
//       _CreateRegisterPetProfile4State();
// }

// class _CreateRegisterPetProfile4State extends State<CreateRegisterPetProfile4> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//         backgroundColor: MaaruColors.DogsBackground,
//         body: SafeArea(
//             child: SingleChildScrollView(
//                 child: Column(children: [
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//               alignment: Alignment.centerRight,
//               height: size.height * 0.25,
//               width: size.width * 0.9,
//               child: BackgroundImage(
//                 assetImage: 'assets/images/kutta.png',
//               )),
//           Container(
//               width: 1000,
//               height: 700,
//               alignment: FractionalOffset.bottomCenter,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(20)),
//               child: Container(
//                   padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Max',
//                             style: MaaruStyle.text.large,
//                             textAlign: TextAlign.left),
//                         Text('Jack  Russell'),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         SizedBox(
//                           width: 40,
//                           height: 20,
//                         ),
//                         Text(
//                           'Pet Needs',
//                           style: MaaruStyle.text.small,
//                         ),
//                         Stack(children: [
//                           Row(
//                             children: [
//                               // Padding(
//                               //   padding: EdgeInsets.fromLTRB(10, 70, 10, 0),
//                               //     child:
//                               ReuseGole(
//                                 assets: 'assets/icons/icone-setting-77.png',
//                                 text: 'Grooming',
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               //    ),
//                               Padding(
//                                 padding: EdgeInsets.only(top: 110),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   width: 100,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       //  border: Border.all(color: MaaruColors.textColor),
//                                       color: MaaruColors.buttonTextColor),
//                                   child: Text(
//                                     'Neutered',
//                                     style: TextStyle(
//                                         color: MaaruColors.whiteColor),
//                                   ),
//                                 ),
//                               ),
//                               //  ),
//                               Padding(
//                                 padding: EdgeInsets.fromLTRB(0, 0, 20, 60),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   width: 100,
//                                   height: 100,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       //  border: Border.all(color: MaaruColors.textColor),
//                                       color: MaaruColors.buttonTextColor),
//                                   child: Text(
//                                     'Neutered',
//                                     style: TextStyle(
//                                         color: MaaruColors.whiteColor),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(20, 150, 0, 0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 100,
//                               height: 170,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   //  border: Border.all(color: MaaruColors.textColor),
//                                   color: MaaruColors.buttonTextColor),
//                               child: Text(
//                                 'Neutered',
//                                 style: TextStyle(color: MaaruColors.whiteColor),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(250, 150, 0, 0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   //  border: Border.all(color: MaaruColors.textColor),
//                                   color: MaaruColors.buttonTextColor),
//                               child: Text(
//                                 'Neutered',
//                                 style: TextStyle(color: MaaruColors.whiteColor),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(150, 240, 0, 0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   //  border: Border.all(color: MaaruColors.textColor),
//                                   color: MaaruColors.buttonTextColor),
//                               child: Text(
//                                 'Neutered',
//                                 style: TextStyle(color: MaaruColors.whiteColor),
//                               ),
//                             ),
//                           ),
//                         ]),
//                         SizedBox(
//                           height: 40,
//                         ),
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (_) => HomeScreen()));
//                             },
//                             child: Container(
//                               alignment: Alignment.centerRight,
//                               child: Image.asset('assets/images/next (2).png'),
//                             )),
//                       ])))
//         ]))));
//   }
// }

// class ReuseGole extends StatefulWidget {
//   final String text;
//   final String assets;

//   const ReuseGole({Key key, this.text, this.assets}) : super(key: key);
//   @override
//   State<ReuseGole> createState() => _ReuseGoleState();
// }

// class _ReuseGoleState extends State<ReuseGole> {
//   bool pressAttention = true;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           setState(() => pressAttention = !pressAttention);
//         },
//         child: Container(
//             alignment: Alignment.center,
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: pressAttention
//                   ? Colors.white
//                   : MaaruColors.primaryColorsuggesion1,
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Column(children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Image.asset(
//                   'assets',
//                   height: 20,
//                 ),
//               ),
//               Text(
//                 'text',
//                 style: TextStyle(color: MaaruColors.whiteColor),
//               ),
//             ])));
//   }
// }
