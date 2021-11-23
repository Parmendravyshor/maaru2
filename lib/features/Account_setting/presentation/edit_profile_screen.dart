import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:flutter/painting.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
class CreateUserProfile extends StatefulWidget {
  @override
  _CreateUserProfileState createState() => _CreateUserProfileState();
}

class _CreateUserProfileState extends State<CreateUserProfile> {
  bool enabled = false;

  TextEditingController _fnameController;
  TextEditingController _lnameController;
  TextEditingController _cityController;
  TextEditingController _phoneController;
  TextEditingController _emailController;
  TextEditingController _zipCodeController;

  @override
  void initState() {
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _zipCodeController = TextEditingController();
    _cityController = TextEditingController();
   super.initState();
  }

  @override
  void dispose() {

    _emailController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[360],
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
                  BackArrowButton(),
          SizedBox(
            height: 20,
          ),
          // Container(
          //  //   color: Colors.grey[360],
          //     height: size.height * 0.2,
          //     width: size.width * 0.9,
          //     child: const
                  Container(
                   //   color: Colors.grey[360],
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child:
                      ProfileForm(assetImage: 'assets/images/4970774.png',)),
                      // ProfileAvatar(
                      //     imageUrl: 'assets/images/4970774.png',
                      //  //   Color: Colors.grey[360],
                      //     width: 20,
                      //     avatarRadius: 100)),
                  // BackgroundImage(
                  //   assetImage: 'assets/images/dogicon.png',

                  // BackgroundImage(
          //   assetImage: 'assets/images/dogicon.png',


          Container(
            width: 1000,
            height: 800,
            alignment: FractionalOffset.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Edit Profile',
                          style: MaaruStyle.text.tiniest,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ThemedTextField(
                      "First Name",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                      },
                      editingController: _fnameController,
                    ),
                    ThemedTextField(
                      "Last Name",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                      },
                      editingController: _lnameController,
                    ),
                    ThemedTextField(
                      "Email",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //  BlocProvider.of<RegisterBloc>(context)
                        //  .add(PasswordChanged(text));
                      },
                      editingController: _emailController,
                    ),
                    ThemedTextField(
                      "Phone Number",
                      TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        // BlocProvider.of<RegisterBloc>(context)
                        // .add(PasswordChanged(text));
                      },
                      editingController: _phoneController,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        new Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: ThemedTextField(
                              "City", TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textStyle: TextStyle(color: Colors.grey[300]),
                              onChanged: (text) {
                                //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                              },
                              //   editingController: _lnameController
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        new Flexible(
                          child: Container(

                              padding: EdgeInsets.only(left: 15,bottom: 30),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'State',hintStyle: MaaruStyle.text.greyDisable,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[300]),
                                    ),
                                    suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,size: 40,color: MaaruColors.buttonColor,)
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                    ThemedTextField(
                      "Zip Code",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        // BlocProvider.of<RegisterBloc>(context)
                        //  .add(PasswordChanged(text));
                      },
                      editingController: _zipCodeController,
                    ),
                    ThemedButton(
                      onPressed: () {},
                      text: 'Update Profile',
                    )
                  ]),
            ),
          ),
        ]))));
  }
}
