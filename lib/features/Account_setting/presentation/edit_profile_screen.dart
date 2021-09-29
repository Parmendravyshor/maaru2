import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';

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
          SizedBox(
            height: 20,
          ),
          Container(
              height: size.height * 0.2,
              width: size.width * 0.9,
              child: ProfileAvatar(
                  imageUrl: 'assets/images/4970774.png',
                  width: 20,
                  avatarRadius: 100)),
          // BackgroundImage(
          //   assetImage: 'assets/images/dogicon.png',
          // )),

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
                          'Payment Information',
                          style: MaaruStyle.text.medium,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ThemedTextField(
                      "FirstName",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                      },
                      editingController: _fnameController,
                    ),
                    ThemedTextField(
                      "lastName",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                      },
                      editingController: _lnameController,
                    ),
                    ThemedTextField(
                      "email",
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
                      "PhoneNumber",
                      TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        // BlocProvider.of<RegisterBloc>(context)
                        // .add(PasswordChanged(text));
                      },
                      editingController: _phoneController,
                    ),
                    ThemedTextField(
                      "City",
                      TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textStyle: TextStyle(color: Colors.grey[300]),
                      onChanged: (text) {
                        //  BlocProvider.of<RegisterBloc>(context)
                        // .add(PasswordChanged(text));
                      },
                      editingController: _cityController,
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
                        SizedBox(
                          width: 10,
                        ),
                        new Flexible(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    Text('State',
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 22)),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      size: 40,
                                      color: MaaruColors.buttonTextColor,
                                    ),
                                  ],
                                )))
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
