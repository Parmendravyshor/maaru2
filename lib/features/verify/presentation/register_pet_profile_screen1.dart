import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
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
import 'package:maru/features/Home/presentation/home_sceen.dart';
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

class CreateregisterPetProfile1 extends StatefulWidget {
  // final String text;
  //
  // const CreateregisterPetProfile1({Key key, this.text}) : super(key: key);
  @override
  _CreateregisterPetProfile1State createState() =>
      _CreateregisterPetProfile1State();
}


class _CreateregisterPetProfile1State extends State<CreateregisterPetProfile1>  {

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

  // Future<File> getImageFile() async {
  //   String path;
  // //  var rootBundle;
  //   var rootBundle      ;
  //   final byteData = await rootBundle.load('gallery/$path');
  //
  //   final file = File('${(await getImageFile()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //
  //   return file;
  // }
  // Future<File> dd() async {
  //   FilePickerResult result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     Uint8List fileBytes = result.files.first.bytes;
  //     String fileName = result.files.first.name;
  //
  //     // Upload file
  //     return File(fileName);
  //   }
  // }
  double initial = 0.0;
  int lineLength = 40;
  bool pressGeoON = true;

  final BackgroundColor = Color(0xFF367355);
  TextEditingController _petNameController;
  TextEditingController _breadTypeController;
  TextEditingController _ageTypeController;
  TextEditingController _heightController;
  TextEditingController _weightController;
  TextEditingController _sexController;
  TextEditingController _birthDateContoller;
  TextEditingController _noteContoller;
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
    fetchData();
    super.initState();
  }
  void fetchData() async{
    setState(() {

    });
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
    // _image = _prefHelper.getStringByKey(MaruConstant.img, "");

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),

            child:
            BlocBuilder<PetProfileBloc, PetProfileState>(builder: (context, state) {
              if (state is UserCreatePetProfileButtonTapped) {
print(state.toString());


                AlertManager.showErrorMessage(
                    "otp send your register email", context);
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CreateRegisterPetProfile2();
                  }));
                });

                return Container();
              } else if (state is RegisterFailure) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(Duration(seconds: 3), () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Register Failure 🤣',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'poppins',
                                fontSize: 20,
                                color: MaaruStyle.colors.textColorWhite)),
                      ),
                    );
                  });
                });
              }

              return SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: _image.isEmpty
                                      ? ExactAssetImage('assets/icons/Oval.png')
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
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 270),
                              child: Text(
                                "GENDER",
                                style: MaaruStyle.text.tiny,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(left: 18),
                                child: ToggleButton2()),
                            new SizedBox(
                              height: 20.0,
                            ),
                            ThemedTextField(
                              "PET NAME   ",
                              TextInputType.text,
                              textStyle: TextStyle(color: Colors.black),
                              textinputaction2: TextInputAction.next,
                              onChanged: (text) {
                                BlocProvider.of<PetProfileBloc>(context)
                                    .add(petNameChanged(text));
                              },
                              editingController: _petNameController,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ThemedTextField("BREED TYPE", TextInputType.text,
                                textStyle: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.done,
                                onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context)
                                  .add(BreadChanged(text));
                            }, editingController: _breadTypeController),
                            new SizedBox(
                              height: 10.0,
                            ),
                            ThemedTextField("AGE", TextInputType.text,
                                textStyle: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.done,
                                onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context)
                                  .add(AgeChanged(text));
                            }, editingController: _ageTypeController),
                            ThemedTextField("WEIGHT", TextInputType.text,
                                textStyle: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.done,
                                onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context)
                                  .add(WidthChanged(text));
                            }, editingController: _weightController),
                            new SizedBox(
                              height: 20.0,
                            ),
                            //  ThemeChanges(),
                            ThemedTextField("HEIGHT", TextInputType.text,
                                textStyle: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.done,
                                onChanged: (text) {
                              BlocProvider.of<PetProfileBloc>(context)
                                  .add(HeightChanged(text));
                            }, editingController: _heightController),

                            DatePicker(),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 18),
                                child: ToggleButton3()),
                            SizedBox(
                              height: 20.0,
                            ),
                            ThemedTextField("NOTES", TextInputType.text, textStyle: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                BlocProvider.of<PetProfileBloc>(context)
                                    .add(NoteChanged(text));
                              },editingController: _noteContoller
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                        style: MaaruStyle.text.greyDisable,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //  await authSource.emailSignup(params);

                                      String petName = _petNameController.text;
                                      String breadType =
                                          _breadTypeController.text;
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
                                        BlocProvider.of<PetProfileBloc>(context)
                                            .add(CreateRegisterPetProfile());
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CreateRegisterPetProfile2()));
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(right: 20),
                                      // alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        'assets/images/next (2).png',height:60,),
                                    ),
                                  ),
                                ]),
                                  ],
                                ))))]),
                          ),
                          // SizedBox(
                          //    height: 20,
                          //  ),
                        );


            })));
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

class LocalDataHelper {
  SharedPreferences prefs;

  saveValue({String key, bool value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  saveStringValue({@required String key, @required String value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringValue({@required String key}) async {
    prefs = await SharedPreferences.getInstance();
    var getStringVal = prefs.getString(key);
    return getStringVal;
  }

  Future<bool> getValue({String key}) async {
    prefs = await SharedPreferences.getInstance();
    bool getVal = prefs.getBool(key);
    return getVal;
  }

  clearAll() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
