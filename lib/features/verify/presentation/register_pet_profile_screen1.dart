import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/screen_icon2.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';

import 'register_pet_profile_screen2.dart';

class CreateregisterPetProfile1 extends StatefulWidget {
  final String text;

  const CreateregisterPetProfile1({Key key, this.text}) : super(key: key);
  @override
  _CreateregisterPetProfile1State createState() =>
      _CreateregisterPetProfile1State();
}

class _CreateregisterPetProfile1State extends State<CreateregisterPetProfile1> {
  double initial = 0.0;
  int lineLength = 40;
  bool pressGeoON = true;
  final BackgroundColor = Color(0xFF367355);
  TextEditingController _petName;
  TextEditingController _breadType;
  TextEditingController _ageType;
//  TextEditingController _height;
  // TextEditingController _weight;
  // TextEditingController _emailController;
  // TextEditingController _sex;
  // TextEditingController _birthDate;
  @override
  void initState() {
    _petName = TextEditingController();
    _breadType = TextEditingController();
   _ageType =   TextEditingController();
    // _height = TextEditingController();
    // _emailController = TextEditingController();
    // _weight = TextEditingController();
    // _birthDate = TextEditingController();
    // _sex = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _petName.dispose();
    _breadType.dispose();
    _ageType.dispose();
    // _height.dispose();
    // _emailController.dispose();
    //  _weight.dispose();
    //  _sex.dispose();
    // _birthDate.dispose();
    super.dispose();
  }

  @override
  Widget _stepIndicator() {
    return Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 320, 0),
        child: LinearProgressIndicator(
          value: initial,
          backgroundColor: Color(0xFFd8d8d8),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],


        body:

             SingleChildScrollView(
                child: Column(children: [
          ProfileForm(
            assetImage: 'assets/images/dogicon.png',
          ),
          Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/icone-setting-67.png',
                    height: 40,
                    width: 40,
                  ),
                  Image.asset(
                    'assets/icons/icone-setting-68.png',
                    height: 40,
                    width: 40,
                    color: Colors.white,
                  ),
                  Image.asset(
                    'assets/icons/icone-setting-68.png',
                    height: 40,
                    width: 40,
                    color: Colors.white,
                  ),
                  Image.asset(
                    'assets/icons/icone-setting-68.png',
                    height: 40,
                    width: 40,
                    color: Colors.white,
                  ),
                  Image.asset(
                    'assets/icons/icone-setting-68.png',
                    color: Colors.white,
                    height: 40,
                    width: 40,
                  ),
                ],
              )),
          SizedBox(
            width: 20,
          ),
   Align(alignment: Alignment.bottomCenter,
       child:
          Container(

          //  width: 1000,
           // height: 880,
            alignment: FractionalOffset.bottomCenter,
            decoration: BoxDecoration(
                color: Color(0xFFffffff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Gender",
                      style: MaaruStyle.text.tiniest,
                    ),
                    SizedBox(height: 20),
                    ToggleButton(),
                    new SizedBox(
                      height: 20.0,
                    ),
                    ThemedTextField(
                      "Pet Name   ",
                      TextInputType.text,
                      textStyle: TextStyle(color: Colors.black),

                      textinputaction2: TextInputAction.next,
                      onChanged: (text) {
                        //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                      },
                      editingController: _petName,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ThemedTextField("Bread Type", TextInputType.text,
                        textStyle: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,
                        onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    }, editingController: _breadType),
                    new SizedBox(
                      height: 10.0,
                    ),
                    ThemedTextField("Age", TextInputType.text,
                        textStyle: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,

                        onChanged: (text) {
                          //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                        }, editingController: _ageType),
                    ThemeChanges2(),
                    new SizedBox(
                      height: 20.0,
                    ),
                    ThemeChanges(),
                    new SizedBox(
                      height: 10.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Center(
                            //  padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "Birth Date",
                                style: MaaruStyle.text.tiniest,
                              ),
                            )),
                      ],
                    ),
                    new SizedBox(
                      height: 10.0,
                    ),
                    DatePicker(),
                    new SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: Text(
                        'Sex',
                        style: TextStyle(
                            color: Colors.black,
                            //  color: MyTheme.secondryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                            // color: MyTheme.secondryColor
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                        Expanded(
                        child: FlatButton(
                            onPressed: () {
                    setState(() => pressGeoON = !pressGeoON);
                    },
                      child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey[100]),
                              color: pressGeoON
                                  ? MaaruColors.primaryColorsuggesion1
                                  : Color(0xFFffffff)),
                          child: Text('Neutered',
                              style: pressGeoON
                                  ? GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Color(0xFFffffff)))
                              //MaaruStyle.text.greyDisable
                              // TextStyle(
                              //     color: MaaruColors.textColor,
                              //     fontFamily: 'Poppins',
                              //     fontSize: 12,
                              //     fontWeight: FontWeight.w300
                                  :   MaaruStyle.text.greyDisable)),
                    ),
            ),
                              SizedBox(
                                width: 10,
                              ),
                              ReuseCircle1(
                                text: 'Spade',
                              ),
                              ReuseCircle1(
                                text: 'Neighter',
                              ),
                            ])),
                    new SizedBox(
                      height: 40.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RegisterScreen()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  shape: BoxShape.circle),
                              child: Text(
                                '',
                                style: MaaruStyle.text.greyDisable,
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                String petName = _petName.text;
                                String breadType = _breadType.text;
                                // String height = _height.text;
                                // String width = _weight.text;

                                if (petName.isEmpty) {
                                  AlertManager.showErrorMessage(
                                      "Please enter Pet name", context);
                                } else if (breadType.isEmpty) {
                                  AlertManager.showErrorMessage(
                                      "Please enter Bread Type", context);
                                  // } else if (height.isEmpty) {
                                  // AlertManager.showErrorMessage(
                                  // "Please enter Height", context);
                                  // } else if (width.isEmpty) {
                                  //   AlertManager.showErrorMessage(
                                  //       "Please enter weight",

                                  // context);
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          CreateRegisterPetProfile2()));
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 20),
                               // alignment: Alignment.centerRight,
                                child:
                                    Image.asset('assets/images/next (2).png'),
                              ),

                          ),
                        ]),
                    SizedBox(height: 70,)
                 ],
                )),

          ),
         // SizedBox(
        //    height: 20,
        //  ),
   ),

                ]))
    );
  }
}

class ProfileForm extends StatefulWidget {
  final String assetImage;

  const ProfileForm({Key key, this.assetImage}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double avatarRadius = size.height * 0.30;
    return
      Container(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: size.width,
            alignment: Alignment.center,
            child: Container(
                height: size.height * 0.20,
                width: size.width * 0.4,
                //   color: Colors.red,
                child: InkWell(
                    onTap: () => getImage(),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: MaaruColors.whiteColor,
                        radius: 70.0,
                        child: CircleAvatar(
                          radius: 65.0,
                          child: ClipOval(
                            child: (_image != null)
                                ? Image.file(_image)
                                : Image.asset(widget.assetImage,fit: BoxFit.cover,),
                          ),
                          backgroundColor: MaaruColors.whiteColor,

                          // indicator()
                        ),
                      ),
                    ))),
          ),
          SizedBox(height: size.height * 0.01),
        ]));
  }
}

class ReuseCircle1 extends StatefulWidget {
  final String text;

  const ReuseCircle1({Key key, this.text}) : super(key: key);

  @override
  _ReuseCircle1State createState() => _ReuseCircle1State();
}

class _ReuseCircle1State extends State<ReuseCircle1> {
  bool pressGeoON = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() => pressGeoON = !pressGeoON);
        },
        child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[100]),
                color: pressGeoON
                    ? Colors.white
                    : MaaruColors.primaryColorsuggesion1),
            child: Text(widget.text,
                style: pressGeoON
                    ? MaaruStyle.text.greyDisable
                    // TextStyle(
                    //     color: MaaruColors.textColor,
                    //     fontFamily: 'Poppins',
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w300
                    : GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xFFffffff))))),
      ),
    );
  }
}
