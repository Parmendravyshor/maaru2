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
import 'package:maru/features/Account_setting/presentation/bloc/setting_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
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
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
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
    _stateController = TextEditingController();
    _zipCodeController = TextEditingController();
    _cityController = TextEditingController();
    _mobileController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _emailController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _emailController.dispose();
    _zipCodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

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
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
      child: Scaffold(
        backgroundColor: Colors.grey[360],
        body: BlocBuilder<PetProfileBloc, PetProfileState>(
            builder: (context, state) {
          try {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true);
            //    Navigator.of(context).pop();
          } catch (e) {}
          _fnameController.text =
              _prefHelper.getStringByKey(MaruConstant.firstName, "");
          _lnameController.text =
              _prefHelper.getStringByKey(MaruConstant.lastName, "");
          _emailController.text =
              _prefHelper.getStringByKey(MaruConstant.email, "");
          _mobileController.text =
              _prefHelper.getStringByKey(MaruConstant.phoneNO, "");
          // if (state is UserPetProfileButtonTapped) {
          //   _status = true;
          // }
          return SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            BackArrowButton(),
            const SizedBox(
              height: 20,
            ),
            Stack(fit: StackFit.loose, children: <Widget>[
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
                  padding: EdgeInsets.only(
                    top: 160.0,bottom: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15.0,
                          child:
                              Image.asset('assets/icons/icone-setting-29.png'))
                    ],
                  )),
            ]),
            Container(
              width: 1000,
              height: 800,
              alignment: FractionalOffset.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.white, ),
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
                        enabled: !enabled,
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
                        editingController: _mobileController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
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
                          Flexible(
                            child: Container(
                                padding: EdgeInsets.only(left: 15, bottom: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.only(left: 20),
                                    hintText: 'State',
                                    hintStyle: MaaruStyle.text.greyDisable,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300]),
                                    ),
                                  ),
                                )),
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
                        onPressed: () {
                          Dialogs.showLoadingDialog(
                              context, _keyLoader, "Updating profile..");
                          BlocProvider.of<SettingBloc>(context)
                              .add(RegisterUser(
                            _fnameController.text,
                            _lnameController.text,
                            _mobileController.text,
                            _cityController.text,
                            _stateController.text,
                            _zipCodeController.text,
                          ));
                        },
                        text: 'Update Profile',
                      )
                    ]),
              ),
            ),
          ])));
        }),
      ),
    );
  }
}
