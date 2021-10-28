import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/faketest.dart';
import '../../../main.dart';
import 'register_pet_profile_screen1.dart';
import 'register_pet_profile_screen3.dart';

class CreateRegisterPetProfile2 extends StatefulWidget {
  @override
  _CreateRegisterPetProfile2State createState() =>
      _CreateRegisterPetProfile2State();
}

class _CreateRegisterPetProfile2State extends State<CreateRegisterPetProfile2> {
  @override
  void dispose() {
  //  _nameEditingController.dispose();
  //  _controller.dispose();
    super.dispose();
  }
  List<int> userSearchItems = [];
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  var nameTECs = <TextEditingController>[];
  var ageTECs = <TextEditingController>[];
  var jobTECs = <TextEditingController>[];
  var containers = <Container>[];

  Container createContainer() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var jobController = TextEditingController();
    nameTECs.add(nameController);
    ageTECs.add(ageController);
    jobTECs.add(jobController);
    return Container(color: Color(0xFFffffff),

      child: Column(
        //  mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //Text('Person ${cards.length + 1}'),
        //  if (priceupdate_value)
            TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (text) {},
            //  controller: _nameEditingController,
              decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: MaaruStyle.text.greyDisable),
            ),
          SizedBox(
            height: 30,
          ),
         // if (priceupdate_value)
            TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: (text) {},
           //   controller: _nameEditingController,
              decoration: InputDecoration(
                  hintText: 'How many times a day?',
                  hintStyle: MaaruStyle.text.greyDisable),
            ),
          SizedBox(
            height: 30,
          ),
      //    if (priceupdate_value)
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'Note',
                  hintStyle: MaaruStyle.text.greyDisable,
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                      BorderSide(color: Colors.grey[50]))),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    containers.add(createContainer());
  //  _nameEditingController = TextEditingController();
   // _controller = TextEditingController();
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < containers.length; i++) {
      var name = nameTECs[i].text;
      var age = ageTECs[i].text;
      var job = jobTECs[i].text;
      entries.add(PersonEntry(name, age, job));
    }
    Navigator.pop(context, entries);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,

        body: SafeArea(
          bottom: false,
            child: SingleChildScrollView(
                child: Column(children: [
          SkipButtons(),
          SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.bottomRight,
              height: size.height * 0.25,
              width: size.width * 0.9,
              child: BackgroundImage(
                assetImage: 'assets/images/kutta.png',
              )),
          Container(
              width: 1000,
              height: 700,
              alignment: FractionalOffset.bottomCenter,
              decoration: BoxDecoration(
                  color: Color(0xFFffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Max',
                            style: MaaruStyle.text.large,
                            textAlign: TextAlign.left),
                        Text(
                          'Jack  Russell',
                          style: MaaruStyle.text.tiny,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 40,
                          height: 30,
                        ),
                        Text(
                          'Known allergies',
                          style: MaaruStyle.text.tiniest,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: 'Seprated by comma',
                              hintStyle: MaaruStyle.text.greyDisable,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Colors.grey[50]))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Pet Vaccines',
                          style: MaaruStyle.text.tiniest,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => CreateRegisterPetProfile2()));
                            },
                            child: RoundedButton(
                              buttonName: 'Upload Vaccine Record',
                              Color: MaaruColors.primaryColorsuggesion,
                              Color1: MaaruColors.primaryColorsuggesion1,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.amber,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[

                                          const Text('Modal BottomSheet'),
                                          InkWell(
                                              onTap: () {
                                                AlertManager.showSuccessMessage(
                                                    "Add Success", context);
                                                Navigator.pop(context);
                                              },
                                              child: RoundedButton(
                                                buttonName: 'Add',
                                                Color1: MaaruColors
                                                    .primaryColorsuggesion,
                                                Color: MaaruColors
                                                    .primaryColorsuggesion1,
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Image.asset(
                              'assets/images/addvaccine.png',
                            ),
                            label: Text(
                              'Add More Vaccines',
                              style: MaaruStyle.text.medium,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          CreateregisterPetProfile1()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    'Back',
                                    style: MaaruStyle.text.greyDisable,
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CreateRegisterPetProfile3()));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        'assets/images/next (2).png'),
                                  )),
                            ]),
                      ]))),
        ]))));
  }
}

class sanvn extends StatefulWidget {
  @override
  State<sanvn> createState() => _sanvnState();
}

class _sanvnState extends State<sanvn> {
  int cntwidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Stack(
              children: [
                // AnimatedContainer(
                //   color: Colors.green,
                //   height: 80,
                //   width: cntwidth.toDouble(),
                //   duration: Duration(seconds: 1),
                //   curve: Curves.ease,
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    title: Text('Tile n°3'),
                    subtitle: Text('SlidableDrawerDelegate'),
                  ),
                ),

                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,

                 // Listener(
                   //  onPointerMove: (moveEvent) {
                   //    if (moveEvent.delta.dx > 0) {
                   //      print("swipe right");
                   //      setState(() {
                   //        if (cntwidth == 0) {
                   //          cntwidth = 400;
                   //        }
                   //      });sanvn
                   //    }
                   //    if (moveEvent.delta.dx < 0) {
                   //      setState(() {
                   //        if (cntwidth == 400) {
                   //          cntwidth = 0;
                   //        }
                   //      });
                   //    }
                   //  },
                    child:
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: Colors.blue,
                      ),
                      child: Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    height: 80,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.blue,
    ),
    child: ListTile(
    leading: CircleAvatar(
    backgroundColor: Colors.indigoAccent,
    foregroundColor: Colors.green,
    ),
    title: Text('Tile n°3'),
    subtitle: Text('SlidableDrawerDelegate'),
    ),
    ),
    ),

    actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.green,
                      icon: Icons.archive,
                      //onTap: () => _showSnackBar('Archive'),
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.red,
                      icon: Icons.archive,
                      //onTap: () => _showSnackBar('Archive'),
                    ),
                  ]
                  ,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Container finction(){
    return Container();
}
}
