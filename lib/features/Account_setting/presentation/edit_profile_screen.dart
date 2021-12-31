import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/dialog.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:flutter/painting.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';

class CreateUserProfile extends StatefulWidget {
  @override
  _CreateUserProfileState createState() => _CreateUserProfileState();
}

class _CreateUserProfileState extends State<CreateUserProfile>
    with SingleTickerProviderStateMixin {
  bool enabled = false;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader =  GlobalKey<State>();
  TextEditingController _fnameController;
  TextEditingController _lnameController;
  TextEditingController _cityController;
  TextEditingController _stateController;
  TextEditingController _emailController;
  TextEditingController _zipCodeController;
  TextEditingController _mobileController;

  @override
  void initState() {
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _emailController = TextEditingController();
    _stateController =TextEditingController();
    _zipCodeController = TextEditingController();
    _cityController = TextEditingController();
    _mobileController = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _mobileController.dispose();
  //   _emailController.dispose();
  //   _fnameController.dispose();
  //   _lnameController.dispose();
  //   _emailController.dispose();
  //   _zipCodeController.dispose();
  //   _cityController.dispose();
  //   super.dispose();
  // }

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
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    _image = _prefHelper.getStringByKey(MaruConstant.img, "");

    return BlocProvider(
      create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
      child: Scaffold(

        body: BlocBuilder<PetProfileBloc, PetProfileState>(builder: (context, state) {
          try {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true);
            Navigator.of(context).pop();
          } catch (e) {}
          _fnameController.text =
              _prefHelper.getStringByKey(MaruConstant.first_name, "");
          _lnameController.text =
              _prefHelper.getStringByKey(MaruConstant.last_name, "");
          _emailController.text =
              _prefHelper.getStringByKey(MaruConstant.email, "");
          _mobileController.text =
              _prefHelper.getStringByKey(MaruConstant.phone_number, "");
          if (state is UserPetProfileButtonTapped) {
            _status = true;
          }
          return Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 1,
                      child: Divider(
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: size.height*0.30,
                      color: MaaruColors.lightbackground,
                      child: Column(
                        children: <Widget>[
                          BackArrowButton(),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child:
                            Stack(fit: StackFit.loose, children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: _image.isEmpty
                                              ? ExactAssetImage(
                                              'assets/icons/icone-setting-28.png')
                                              : FileImage(File(_image)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    onTap: getImage,
                                  ),
                                ],
                              ),
                              Padding(
                                  padding:
                                  EdgeInsets.only(top: 70.0, right: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        radius: 15.0,
                                        child:Image.asset('assets/icons/icone-setting-29.png')
                                      )
                                    ],
                                  )),
                            ]),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.1 /
                                      2,
                                  right: MediaQuery.of(context).size.width *
                                      0.1 /
                                      2,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Edit Profile'.toUpperCase(),
                                          style: MaaruStyle.text.tiniest  ,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[

                     _status ? _getEditIcon() : Container(),
                                      ],
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 20.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[

                                      ],
                                    ),
                                  ],
                                )),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: ThemedTextField(
                                    "First Name",
                                    TextInputType.text,
                                    enabled: !_status,
                                    editingController: _fnameController,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[

                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 0.0,),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: ThemedTextField(
                                        "last name",
                                        TextInputType.text,
                                        enabled: !_status,
                                        editingController: _lnameController,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Email ID'.toUpperCase(),
                                          style:  MaaruStyle.text.tiny,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 0.0,  ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: ThemedTextField(
                                        "",
                                        TextInputType.emailAddress,
                                        enabled: false,
                                        editingController: _emailController,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[

                                      ],
                                    ),
                                  ],
                                )),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: ThemedTextField(
                                        "",
                                        TextInputType.number,
                                        enabled: !_status,
                                        editingController: _mobileController,
                                      ),
                                    ),
                                  ],
                                ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                            child:
                            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                           Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'City',
                                    style: MaaruStyle.text.greyDisable,
                                  ),
                                ],
                          ),
                          // SizedBox(
                          //   width: 10,

                          Flexible(
                            child: Container(
                                padding: EdgeInsets.only(right: 15, ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Row(children: [
                                    Text('State', style: MaaruStyle.text.greyDisable,),
                              IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                ),
                                iconSize: 40,
                                color: MaaruColors.buttonColor,
                                splashColor: Colors.purple,
                                onPressed: () {},
                              ),

                            ],)
                                  ],)
                                ),
                           ),

                        ]),),

                            Padding(
                                padding: EdgeInsets.only(top: 0.0,),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: ThemedTextField(
                                        "",
                                        TextInputType.text,
                                        enabled: !_status,
                                        editingController: _cityController,
                                      ),
                                    ),
                                    Flexible(
                                      child: ThemedTextField(
                                        "",
                                        TextInputType.text,
                                        enabled: !_status,
                                        editingController: _stateController,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    left: MediaQuery.of(context).size.width *
                                        0.1 /
                                        2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'ZipCode',
                                          style:  MaaruStyle.text.greyDisable,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 0.0,),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: ThemedTextField(
                                        "",
                                        TextInputType.number,
                                        enabled: !_status,
                                        editingController: _zipCodeController,
                                      ),
                                    ),
                                  ],
                                )),
                            !_status
                                ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(right: 10.0),
                                      child: Container(
                                          child: RaisedButton(
                                            child: Text("Update"),
                                            textColor: Colors.white,
                                            color: MaaruColors.buttonColor,
                                            onPressed: () {
                                              Dialogs.showLoadingDialog(
                                                  context,
                                                  _keyLoader,
                                                  "Updating profile..");
                                              BlocProvider.of<PetProfileBloc>(
                                                  context)
                                                  .add(RegisterUser(
                                                  _fnameController.text,
                                                  _lnameController.text,
                                                  _mobileController.text,
                                                _cityController.text,
                                                _stateController.text,
                                                _zipCodeController.text,
                                                  ));
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    2.0)),
                                          )),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 10.0),
                                      child: Container(
                                          child: RaisedButton(
                                            child: Text("Cancel"),
                                            textColor: Colors.white,
                                            color: MaaruColors.textColor,
                                            onPressed: () {
                                              setState(() {
                                                _status = true;
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    FocusNode());
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    2.0)),
                                          )),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return BlocProvider(
//       create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.grey[360],
//         body: BlocBuilder<PetProfileBloc, PetProfileState>(
//             builder: (context, state) {
//           try {
//             Navigator.of(_keyLoader.currentContext, rootNavigator: true);
//             Navigator.of(context).pop();
//           } catch (e) {}
//           _fnameController.text =
//               _prefHelper.getStringByKey(MaruConstant.first_name, "");
//           _lnameController.text =
//               _prefHelper.getStringByKey(MaruConstant.last_name, "");
//           _emailController.text =
//               _prefHelper.getStringByKey(MaruConstant.email, "");
//           _mobileController.text =
//               _prefHelper.getStringByKey(MaruConstant.phone_number, "");
//           if (state is UserPetProfileButtonTapped) {
//             _status = true;
//           }
//           return SafeArea(
//               child: SingleChildScrollView(
//                   child: Column(children: [
//             BackArrowButton(),
//             SizedBox(
//               height: 20,
//             ),
//             Stack(fit: StackFit.loose, children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   GestureDetector(
//                     child: Container(
//                       width: 200.0,
//                       height: 200.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: _image.isEmpty
//                               ? ExactAssetImage(
//                                   'assets/icons/icone-setting-28.png')
//                               : FileImage(File(_image)),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     onTap: getImage,
//                   ),
//                 ],
//               ),
//               Padding(
//                   padding: EdgeInsets.only(
//                     top: 160.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CircleAvatar(
//                           backgroundColor: Colors.red,
//                           radius: 15.0,
//                           child:
//                               Image.asset('assets/icons/icone-setting-29.png'))
//                     ],
//                   )),
//             ]),
//             Container(
//               width: 1000,
//               height: 800,
//               alignment: FractionalOffset.bottomCenter,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(30)),
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                   Row(
//                   mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.max,
//                   children: <Widget>[
//                     Column(
//                       mainAxisAlignment:
//                       MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text(
//                           '',
//                           style: MaaruStyle.text.medium,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         _status ? _getEditIcon() : Container(),
//                       ],
//                     )
//                   ],
//                 ),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               top: 10.0,
//                               left: MediaQuery.of(context).size.width *
//                                   0.1 /
//                                   2),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'First Name',
//                                     style: MaaruStyle.text.small,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: ThemedTextField(
//                                   "",
//                                   TextInputType.text,
//                                   enabled: !_status,
//                                   editingController: _fnameController,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(
//                               top: 10.0,
//                               left: MediaQuery.of(context).size.width *
//                                   0.1 /
//                                   2),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Text(
//                                     'Last Name',
//                                     style: MaaruStyle.text.small,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )),
//                       Padding(
//                           padding: EdgeInsets.only(top: 2.0),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Flexible(
//                                 child: ThemedTextField(
//                                   "",
//                                   TextInputType.text,
//                                   enabled: !_status,
//                                   editingController: _lnameController,
//                                 ),
//                               ),
//                             ],
//                           )),
//                       Container(
//                           padding: EdgeInsets.only(left: 30.0),
//                           child: Text(
//                             'Edit Profile',
//                             style: MaaruStyle.text.tiniest,
//                           )),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ThemedTextField(
//                         "First Name",
//                         TextInputType.text,
//                         textInputAction: TextInputAction.next,
//                         textStyle: TextStyle(color: Colors.grey[300]),
//                         onChanged: (text) {
//                           //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
//                         },
//                         editingController: _fnameController,
//                       ),
//                       ThemedTextField(
//                         "Last Name",
//                         TextInputType.text,
//                         textInputAction: TextInputAction.next,
//                         textStyle: TextStyle(color: Colors.grey[300]),
//                         onChanged: (text) {
//                           //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
//                         },
//                         editingController: _lnameController,
//                       ),
//                       ThemedTextField(
//                         "Email",
//                         TextInputType.text,
//                         textInputAction: TextInputAction.next,
//                         textStyle: TextStyle(color: Colors.grey[300]),
//                         onChanged: (text) {
//                           //  BlocProvider.of<RegisterBloc>(context)
//                           //  .add(PasswordChanged(text));
//                         },
//                         editingController: _emailController,
//                       ),
//                       ThemedTextField(
//                         "Phone Number",
//                         TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         textStyle: TextStyle(color: Colors.grey[300]),
//                         onChanged: (text) {
//                           // BlocProvider.of<RegisterBloc>(context)
//                           // .add(PasswordChanged(text));
//                         },
//                         editingController: _phoneController,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: Container(
//                               padding: EdgeInsets.only(left: 15),
                            //ThemedTextField(
//                                 "City", TextInputType.text,
//                                 textInputAction: TextInputAction.next,
//                                 textStyle: TextStyle(color: Colors.grey[300]),
//                                 onChanged: (text) {
//                                   //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
//                                 },
//                                 //   editingController: _lnameController
//                               ),
//                             ),
//                           ),
//                           // SizedBox(
//                           //   width: 10,
//                           // ),
//                           Flexible(
//                             child: Container(
//                                 padding: EdgeInsets.only(left: 15, bottom: 30),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                       // contentPadding: EdgeInsets.only(left: 20),
//                                       hintText: 'State',
//                                       hintStyle: MaaruStyle.text.greyDisable,
//                                       enabledBorder: UnderlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.grey[300]),
//                                       ),
//                                       suffixIcon: Icon(
//                                         Icons.keyboard_arrow_down_outlined,
//                                         size: 40,
//                                         color: MaaruColors.buttonColor,
//                                       )),
//                                 )),
//                           ),
//                         ],
//                       ),
//                       ThemedTextField(
//                         "Zip Code",
//                         TextInputType.text,
//                         textInputAction: TextInputAction.next,
//                         textStyle: TextStyle(color: Colors.grey[300]),
//                         onChanged: (text) {
//                           // BlocProvider.of<RegisterBloc>(context)
//                           //  .add(PasswordChanged(text));
//                         },
//                         editingController: _zipCodeController,
//                       ),
//                       ThemedButton(
//                         onPressed: () {},
//                         text: 'Update Profile',
//                       )
//                     ]),
//               ),
//             ),
//           ])));
//         }),
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     myFocusNode.dispose();
//     super.dispose();
//   }
//   Widget _getEditIcon() {
//     return GestureDetector(
//       child: CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
// }
