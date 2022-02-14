import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:maru/features/login/presentation/login_screen.dart';

import 'pet_profile_bloc.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/screen_icon2.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';

import 'package:maru/features/chat/presentation/chatt_screen.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/bloc/verify_event.dart';
import 'package:maru/features/verify/presentation/bloc/verify_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_pet_profile_screen2.dart';
import 'package:http/http.dart' as http;

enum Gender { male, female, none }

class CreateregisterPetProfile1 extends StatefulWidget {
  final String gender1;

  const CreateregisterPetProfile1({Key key, this.gender1}) : super(key: key);
  //
  // const CreateregisterPetProfile1({Key key, this.text}) : super(key: key);
  @override
  _CreateregisterPetProfile1State createState() =>
      _CreateregisterPetProfile1State();
}

class _CreateregisterPetProfile1State extends State<CreateregisterPetProfile1> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  String _image = "";

  final picker = ImagePicker();
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    if (pickedFile != null) {
      _image = pickedFile.path;
      await _prefHelper.saveString(MaruConstant.img, _image);
      setState(() {});
    } else {
      AlertManager.showErrorMessage("Failed to load image", context);
    }
  }

  double initial = 0.0;
  int lineLength = 40;
  bool pressGeoON = true;
  DateTime _selectedDate;
  TextEditingController _ageType;
  TextEditingController textEditingController = TextEditingController();
  final BackgroundColor = Color(0xFF367355);
  TextEditingController _petNameController;
  TextEditingController _breadTypeController;
  TextEditingController _ageTypeController;
  TextEditingController _heightController;
  TextEditingController _weightController;
  TextEditingController _sexController;
  TextEditingController _birthDateContoller;
  TextEditingController _noteContoller;
  var abac;
  var abc2;
  String SelectGender = '';
  String Selectdate = '';
  @override
  void initState() {
    _petNameController = TextEditingController();
    _breadTypeController = TextEditingController();
    _ageTypeController = TextEditingController();
    _heightController = TextEditingController();
    _noteContoller = TextEditingController();
    _weightController = TextEditingController();
    _birthDateContoller = TextEditingController();
    _sexController = TextEditingController();
    print(_prefHelper.getStringByKey('pet-name', ''));
    super.initState();
  }

  Color NeuteredContainerColor = Colors.white;
  Color activenutered = MaaruColors.button2Color;
  Color SpadeContainerColor = Colors.white;
  Color activespade = MaaruColors.button2Color;
  Color NeitherContainerColor = Colors.white;
  Color activeneither = MaaruColors.button2Color;

  String sex1 = '';

  Container ToggleContainer(
      double height, double width, String text, Color togglecolor) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE8E8E8)),
        color: togglecolor,
      ),
      child: Center(
          child: Text(
        text,
        style: MaaruStyle.text.toggel,
      )),
    );
  }

  _selectDate(
    BuildContext context,
  ) async {
    final _PetProfileBloc = BlocProvider.of<PetProfileBloc>(context);
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      textEditingController
        ..text =
            "${_selectedDate.month.toString()}-${_selectedDate.day.toString().padLeft(2, '0')}-${_selectedDate.year.toString().padLeft(2, '0')}"
        //   .format(_selectedDate).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: textEditingController.text.length,
            affinity: TextAffinity.upstream));
      BlocProvider.of<PetProfileBloc>(context)
          .add(BirthChanged(textEditingController.text));
    }
  }

  @override
  void dispose() {
    _petNameController.dispose();
    _breadTypeController.dispose();
    _ageTypeController.dispose();
    _heightController.dispose();
    _noteContoller.dispose();
    _weightController.dispose();
    _sexController.dispose();
    _birthDateContoller.dispose();

    super.dispose();
  }

  Gender SelectedGender = Gender.none;
  Color malecontainercolor = Colors.white;
  Color femalecontainercolor = Colors.white;
  String gender = '';
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
    final size = MediaQuery.of(context).size;
    // _image = _prefHelper.getStringByKey(MaruConstant.img, "");

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: BlocBuilder<PetProfileBloc, PetProfileState>(
                builder: (context, state) {
              if (state is UserCreatePetProfileButtonTapped) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CreateRegisterPetProfile2();
                  }));
                });
                return Container();
              } else if (state is RegisterFailure) {
                Future.delayed(const Duration(microseconds: 1), () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      content: Text('Make sure you have internet connection ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins',
                              fontSize: 20,
                              color: MaaruStyle.colors.textColorWhite)),
                    ),
                  );
                });
              }

              return SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                width: size.width * 0.50,
                                height: size.height * 0.25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: _image.isEmpty
                                        ? ExactAssetImage(
                                            'assets/icons/Oval.png')
                                        : FileImage(File(_image)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: getImage,
                            ),
                          ],
                        ),
                      ])),
                  Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icons/Rectangle copy 3.png',
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
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          //  width: 1000,
                          // height: 880,
                          alignment: FractionalOffset.bottomCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "GENDER",
                                      style: MaaruStyle.text.tiny,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 18, right: 10),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                var sex=_prefHelper.getStringByKey('sex', '');
                                                if(sex=='male')
                                                  {
                                                    SelectedGender=Gender.male;
                                                    malecontainercolor=MaaruColors.button2Color;
                                                  }
                                                SelectedGender = Gender.male;
                                                if (SelectedGender ==
                                                    Gender.male) {
                                                  gender = 'male';
                                                  print(gender);
                                                } else {
                                                  print('null');
                                                }
                                              });
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(genderChanged(gender));
                                            },
                                            child: ToggleContainer(
                                                size.height * 0.060,
                                                size.width * 0.40,
                                                'male',
                                                SelectedGender == Gender.male
                                                    ? MaaruColors.button2Color
                                                    : malecontainercolor)),
                                        GestureDetector(
                                            onTap: () {
                                              if (gender == 'male') {
                                                AlertManager.showErrorMessage(
                                                    "Please enter first name",
                                                    context);
                                              }
                                              setState(() {

                                                var sex=_prefHelper.getStringByKey('sex', '');
                                                if(sex=='male')
                                                {
                                                  SelectedGender=Gender.male;
                                                  malecontainercolor=MaaruColors.button2Color;
                                                }
                                                SelectedGender = Gender.female;
                                                if (SelectedGender ==
                                                    Gender.female) {
                                                  gender = 'female';
                                                  print(gender);
                                                } else {
                                                  print('null');
                                                }
                                              });

                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(genderChanged(gender));
                                            },
                                            child: ToggleContainer(
                                                size.height * 0.060,
                                                size.width * 0.44,
                                                'female',
                                                SelectedGender == Gender.female
                                                    ? MaaruColors.button2Color
                                                    : Colors.white)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  ThemedTextField(
                                      "PET NAME   ", TextInputType.text,
                                      textStyle: TextStyle(color: Colors.black),
                                      textinputaction2: TextInputAction.next,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(petNameChanged(text));
                                  },
                                      editingController:_petNameController),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  ThemedTextField(
                                      "BREED TYPE", TextInputType.text,
                                      textStyle: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(BreadChanged(text));
                                  },
                                      editingController:
                                          _breadTypeController),
                                  new SizedBox(
                                    height: 10.0,
                                  ),
                                  ThemedTextField("AGE", TextInputType.number,
                                      textStyle: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(AgeChanged(text));
                                  },
                                      editingController:_ageTypeController),
                                  ThemedTextField(
                                      "WEIGHT", TextInputType.number,
                                      textStyle: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(WidthChanged(text));
                                  },
                                      editingController:
                                         _weightController),
                                  new SizedBox(
                                    height: 20.0,
                                  ),
                                  //  ThemeChanges(),
                                  ThemedTextField(
                                      "HEIGHT", TextInputType.number,
                                      textStyle: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(HeightChanged(text));
                                  },
                                      editingController:
                                          _heightController),

                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(children: [
                                        GestureDetector(
                                          child: TextFormField(
                                            style: MaaruStyle.text.tiny,
                                            focusNode:
                                                AlwaysDisabledFocusNode(),
                                            controller: textEditingController,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: MaaruColors
                                                        .textfeildline),
                                              ),
                                              // labelText: "Date of birth",
                                              hintText: 'BIRTH DATE',
                                              hintStyle: MaaruStyle.text.tiny,
                                            ),
                                            onSaved: (text) {
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(BirthChanged(
                                                      textEditingController
                                                          .text));
                                            },
                                            onTap: () {
                                              _selectDate(context);
                                            },
                                            onChanged: (text) {
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(BirthChanged(
                                                      textEditingController
                                                          .text));
                                            },
                                            onFieldSubmitted: (text) {
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(BirthChanged(
                                                      textEditingController
                                                          .text));
                                            },
                                            onEditingComplete: () {
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(BirthChanged(
                                                      textEditingController
                                                          .text));
                                              print(
                                                  'datepicker on editing complete');
                                            },
                                          ),
                                        )
                                      ])),

                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 10),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Sex",
                                      style: MaaruStyle.text.tiny,
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  var sex = _prefHelper
                                                      .getStringByKey(
                                                          'sex', '');
                                                  if (sex == 'neutered') {
                                                    NeuteredContainerColor =
                                                        activenutered;
                                                  } else {
                                                    NeuteredContainerColor =
                                                        Colors.white;
                                                  }

                                                  if (NeuteredContainerColor ==
                                                      Colors.white) {
                                                    NeuteredContainerColor =
                                                        activenutered;
                                                    SpadeContainerColor =
                                                        Colors.white;
                                                    NeitherContainerColor =
                                                        Colors.white;
                                                  } else {
                                                    NeuteredContainerColor =
                                                        Colors.white;
                                                  }

                                                  if (NeuteredContainerColor ==
                                                      activenutered) {
                                                    sex1 = 'neutered';
                                                    print(sex1);
                                                  } else {
                                                    print('FAILURE');
                                                  }
                                                  BlocProvider.of<
                                                              PetProfileBloc>(
                                                          context)
                                                      .add(SexChanged(sex1));
                                                });
                                              },
                                              child: ToggleContainer(
                                                  size.height * 0.060,
                                                  size.width * 0.29,
                                                  'neutered',
                                                  NeuteredContainerColor)),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (SpadeContainerColor ==
                                                      Colors.white) {
                                                    SpadeContainerColor =
                                                        activespade;
                                                    NeuteredContainerColor =
                                                        Colors.white;
                                                    NeitherContainerColor =
                                                        Colors.white;
                                                  } else {
                                                    SpadeContainerColor =
                                                        Colors.white;
                                                  }
                                                  if (SpadeContainerColor ==
                                                      activespade) {
                                                    sex1 = 'spade';
                                                    print(sex1);
                                                  } else {
                                                    print('FAILURE');
                                                  }
                                                });

                                                BlocProvider.of<PetProfileBloc>(
                                                        context)
                                                    .add(SexChanged(sex1));
                                              },
                                              child: ToggleContainer(
                                                  size.height * 0.060,
                                                  size.width * 0.30,
                                                  'spade',
                                                  SpadeContainerColor)),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (NeitherContainerColor ==
                                                      Colors.white) {
                                                    NeitherContainerColor =
                                                        activeneither;
                                                    SpadeContainerColor =
                                                        Colors.white;
                                                    NeuteredContainerColor =
                                                        Colors.white;
                                                  } else {
                                                    NeitherContainerColor =
                                                        Colors.white;
                                                  }
                                                  if (NeitherContainerColor ==
                                                      activeneither) {
                                                    sex1 = 'neither';
                                                    BlocProvider.of<
                                                                PetProfileBloc>(
                                                            context)
                                                        .add(SexChanged(sex1));
                                                  } else {
                                                    print('FAILURE');
                                                  }
                                                });
                                              },
                                              child: ToggleContainer(
                                                  size.height * 0.060,
                                                  size.width * 0.30,
                                                  'neither',
                                                  NeitherContainerColor)),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  ThemedTextField("NOTES", TextInputType.text,
                                      textStyle: TextStyle(color: Colors.black),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (text) {
                                    BlocProvider.of<PetProfileBloc>(context)
                                        .add(NoteChanged(text));
                                  }, editingController: _noteContoller),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        RegisterScreen()));
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
                                              style:
                                                  MaaruStyle.text.greyDisable,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              print('dd1${SelectGender}');
                                            });
                                            //  await authSource.emailSignup(params);
                                            String petName =
                                                _petNameController.text;
                                            String breadType =
                                                _breadTypeController.text;
                                            String height =
                                                _heightController.text;
                                            String width =
                                                _weightController.text;
                                            String age =
                                                _ageTypeController.text;

                                            String date =
                                                textEditingController.text;
                                            if (_image.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please Select Image",
                                              );
                                            } else if (gender.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please Select Gender",
                                              );
                                            } else if (petName.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please enter pet name",
                                              );
                                            } else if (breadType.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please enter Bread Type",
                                              );
                                            } else if (age.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please enter age Type",
                                              );
                                            } else if (height.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please enter Height",
                                              );
                                            } else if (width.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please enter weight",
                                              );
                                            } else if (date.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please Select Date",
                                              );
                                            } else if (sex1.isEmpty) {
                                              _showDialog(
                                                context,
                                                "Please Select Sex",
                                              );
                                            } else {
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(
                                                      CreateRegisterPetProfile());
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(right: 20),
                                            // alignment: Alignment.centerRight,
                                            child: Image.asset(
                                              'assets/images/next (2).png',
                                              height: 60,
                                            ),
                                          ),
                                        ),
                                        state is RegisterInProgress
                                            ? Center(
                                                child: Container(
                                                width: 5,
                                                height: 5,
                                                child:
                                                    const CircularProgressIndicator(),
                                              ))
                                            : Container(),
                                      ]),
                                ],
                              ))))
                ]),
              );
            })));
  }

  void _showDialog(BuildContext context, String text) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(actions: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop;
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: MaaruStyle.colors.textColorWhite,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Text(text),
                              ),
                              Divider(
                                color: Colors.grey[360],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'ok',
                                    style: TextStyle(
                                        color: MaaruColors.buttonColor),
                                  ))
                            ],
                          )),
                    ),
                  ))
            ]));
      },
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
    return Container(
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
                                : Image.asset(
                                    widget.assetImage,
                                    fit: BoxFit.cover,
                                  ),
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
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey[100]),
                color: pressGeoON ? Colors.white : MaaruColors.blueColor),
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
