import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/features/verify/presentation/register_pet_profile4.dart';

import 'Register_pet_profile_screen2.dart';

class CreateRegisterPetProfile3 extends StatefulWidget {
  @override
  _CreateRegisterPetProfile3State createState() =>
      _CreateRegisterPetProfile3State();
}

class _CreateRegisterPetProfile3State extends State<CreateRegisterPetProfile3> {
  TextEditingController _nameEditingController;
  TextEditingController _controller;
  bool priceupdate_value = true;
  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          SkipButtons(),
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.centerRight,
              height: size.height * 0.25,
              width: size.width * 0.9,
              child: BackgroundImage(
                assetImage: 'assets/images/kutta.png',
              )),
          Container(
              width: 1000,
              height: 1250,
              alignment: FractionalOffset.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Max',
                            style: MaaruStyle.text.large,
                            textAlign: TextAlign.left),
                        Text('Jack  Russell',style: MaaruStyle.text.tiny,),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 40,
                          height: 20,
                        ),
                        Text(
                          'Walking Schedule',
                          style: MaaruStyle.text.small,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Feeding Schedule',
                          style: MaaruStyle.text.small,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Temperament',
                          style: MaaruStyle.text.small,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Medication',
                                style: MaaruStyle.text.small,
                              ),
                              SizedBox(
                                height: 20,
                                width: 60,
                              ),
                              Text('No', style: MaaruStyle.text.tiny),
                              Switch(
                                activeColor: MaaruColors.buttonTextColor,
                                inactiveThumbColor: MaaruColors.buttonTextColor,
                                // title: Text("Do you want to update your price?"),
                                // controlAffinity: ListTileControlAffinity.leading,
                                value: priceupdate_value,
                                onChanged: (bool priceupdateValue) {
                                  setState(() {
                                    priceupdate_value = priceupdateValue;
                                  });
                                },
                              ),
                              // ),
                              Text('Yes', style: MaaruStyle.text.tiny),
                            ]),
                        SizedBox(
                          height: 40,
                        ),
                        if (priceupdate_value)
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onChanged: (text) {},
                            controller: _nameEditingController,
                            decoration: InputDecoration(hintText: 'Name',hintStyle: MaaruStyle.text.greyDisable),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        if (priceupdate_value)
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onChanged: (text) {},
                            controller: _controller,
                            decoration: InputDecoration(
                                hintText: 'How many times a day?',hintStyle: MaaruStyle.text.greyDisable),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        if (priceupdate_value)
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                hintText: 'Note',hintStyle: MaaruStyle.text.greyDisable,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        if (priceupdate_value)
                          TextButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/addvaccine.png',
                            ),
                            label: Text(
                              'Add More Vaccines',
                              style: MaaruStyle.text.medium,
                            ),
                          ),
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
                                          CreateRegisterPetProfile3()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    'Back',style: MaaruStyle.text.greyDisable,
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CreateRegisterPetProfile4()));
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        'assets/images/next (2).png'),
                                  )),
                            ]),
                      ])))
        ]))));
  }
}
