import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';
import '../../../main.dart';
import 'register_pet_profile_screen1.dart';
import 'register_pet_profile_screen3.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

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

import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/bloc/verify_event.dart';
import 'package:maru/features/verify/presentation/bloc/verify_state.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_pet_profile_screen2.dart';
import 'package:http/http.dart' as http;

class CreateRegisterPetProfile2 extends StatefulWidget {
  final String allergies;
final String image;
final String petname;
final String breedtype;
  const CreateRegisterPetProfile2({Key key, this.allergies, this.image, this.petname, this.breedtype}) : super(key: key);
  @override
  _CreateRegisterPetProfile2State createState() =>
      _CreateRegisterPetProfile2State();
}

class _CreateRegisterPetProfile2State extends State<CreateRegisterPetProfile2> {
  TextEditingController _knowallergiesController;
  TextEditingController _vaccineController;

  @override
  void initState() {
    _knowallergiesController = TextEditingController();
    _vaccineController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _knowallergiesController = TextEditingController();
    super.dispose();
  }

  final FocusNode myFocusNode = FocusNode();
  String _image = "";
  final picker = ImagePicker();
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  Future getImage() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _prefHelper.getStringByKey('pet_name', '').isNotEmpty?const CreateHomeScreen():'',
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: BlocBuilder<PetProfileBloc, PetProfileState>(
                builder: (context, state) {
                  if(_knowallergiesController.text.isNotEmpty){
                  }
                  else{
                    _knowallergiesController.text = widget.allergies.toString() ==null?"":'';
                  }
              if (state is PetProfile2Saves) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CreateRegisterPetProfile3();
                  }));
                });

                return Container();
              } else if (state is RegisterFailure) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(Duration(seconds: 3), () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text('Register Failure ',
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
                  bottom: false,
                  child: SingleChildScrollView(
                      child: Column(children: [
                          Stack(fit: StackFit.loose, children: <Widget>[
                    Container(
                        alignment: Alignment.bottomRight,
                        // height: size.height * 0.20,
                        // width: size.width * 0.9,
                        child:
                        widget.image==null?Center(
                          child: Image.network(
                              _prefHelper.getStringByKey('img', ''),
                              width:450,
                              height: 250,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) {
                            return Container(
                                color: MaaruColors.DogsBackground,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/kutta.png'));
                          }),
                        ):Center(
                      child: Image.network(
                          widget.image,
                          width:450,
                          height: 250,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                                color: MaaruColors.DogsBackground,
                                alignment: Alignment.center,
                                child: Image.asset('assets/images/kutta.png'));
                          }),
                    )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 30.0,bottom: 10
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SkipButtons(),
                                  ],
                                )),
                          ]),

                    Container(
                        alignment: FractionalOffset.bottomCenter,
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                        ),
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 widget.petname==null? Text(
                                      _prefHelper.getStringByKey(
                                          MaruConstant.petName, ''),
                                      style: MaaruStyle.text.large,
                                      textAlign: TextAlign.left):Text(
                                    widget.petname,
                                     style: MaaruStyle.text.large,
                                     textAlign: TextAlign.left),
                                 widget.breedtype==null? Text(
                                    _prefHelper.getStringByKey(
                                        MaruConstant.breedType, ''),
                                    style: MaaruStyle.text.tiny,
                                  ):Text(
                                  widget.breedtype,
                                   style: MaaruStyle.text.tiny),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 40,
                                    height: 30,
                                  ),
                                  Text(
                                    'Known allergies'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      style: MaaruStyle.text.tiny,
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                          hintText:
                                              'Seprated by comma'.toUpperCase(),
                                          hintStyle: MaaruStyle.text.tiny,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[50]))),
                                      onChanged: (text) {
                                        BlocProvider.of<PetProfileBloc>(context)
                                            .add(KnowAllergies(
                                                _knowallergiesController.text));
                                      },
                                      controller: _knowallergiesController),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Stack(fit: StackFit.loose, children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pet Vaccines'.toUpperCase(),
                                              style: MaaruStyle.text.tiny,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: getImage,
                                            //   var picked =
                                            //       await FilePicker.platform.pickFiles();
                                            //
                                            //   if (picked != null) {
                                            //     print(picked.files.first.name);
                                            //   }

                                            child: RoundedButton(
                                              buttonName:
                                                  'Upload Vaccine Record'
                                                      .toUpperCase(),
                                              Color: MaaruColors
                                                  .primaryColorsuggesion,
                                              Color1: MaaruColors.whiteColor,
                                            )),
                                        GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.only(top: 100),
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: FileImage(File(_image)),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          onTap: getImage,
                                        ),
                                      ],
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 10,
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
                                                        CreateRegisterPetProfile3()));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                                color: Colors.white12,
                                                shape: BoxShape.circle),
                                            child: Text(
                                              'BACK',
                                              style:
                                                  MaaruStyle.text.greyDisable,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {

                                              //
 if(_prefHelper.getStringByKey('pet_name', '').isEmpty) {
   BlocProvider.of<PetProfileBloc>(
       context)
       .add(Profile2(
       _knowallergiesController
           .text,
       // getImage()
       _vaccineController.text));
 }
 else{
   BlocProvider.of<PetProfileBloc>(
       context)
       .add(Profile2(
       _knowallergiesController
           .text,
       // getImage()
       _vaccineController.text));
   int a;
   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ViewPetProfile2(id2: _prefHelper.getIntByKey('id', a),)));
 }


                                            },
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                'assets/images/next (2).png',
                                                height: 60,
                                              ),
                                            )),
                                      ]),
                                ]))),
                  ])));
            })));
  }
}
