import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'Register_pet_profile_screen1.dart';
import 'Register_pet_profile_screen3.dart';

class CreateRegisterPetProfile2 extends StatefulWidget {
  @override
  _CreateRegisterPetProfile2State createState() =>
      _CreateRegisterPetProfile2State();
}

class _CreateRegisterPetProfile2State extends State<CreateRegisterPetProfile2> {
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
                              Color1:MaaruColors.primaryColorsuggesion1,
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton.icon(
                            onPressed: () {},
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
                                    'Back',style: MaaruStyle.text.greyDisable,
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
