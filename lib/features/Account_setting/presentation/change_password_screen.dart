import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/dialog.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with SingleTickerProviderStateMixin {
  bool enabled = false;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  TextEditingController _currentController;
  TextEditingController _newController;

  @override
  void initState() {
    _currentController = TextEditingController();
    _newController = TextEditingController();

    super.initState();
  }

  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  String _image = "";
  final picker = ImagePicker();


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
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<PetProfileBloc, PetProfileState>(
            builder: (context, state) {
          try {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true);
            Navigator.of(context).pop();
          } catch (e) {}
          _currentController.text =
              _prefHelper.getStringByKey(MaruConstant.current_password, "");
          _newController.text =
              _prefHelper.getStringByKey(MaruConstant.change_password, "");

          if (state is UserChangePasswordButtonTapped) {
            _status = true;
          }
          return SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
                    BackArrowButton(),
                    SizedBox(
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
                            top: 160.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 15.0,
                                  child:
                                  Image.asset(
                                      'assets/icons/icone-setting-29.png'))
                            ],
                          )),
                    ]),
                    Container(
                      width: 1000,
                      height: 800,
                      alignment: FractionalOffset.bottomCenter,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'Change Password',
                                    style: MaaruStyle.text.tiniest,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              ThemedTextField(
                                "First Name",
                                TextInputType.text,
                                textInputAction: TextInputAction.next,
                                textStyle: TextStyle(
                                    color: Colors.grey[300]),
                                onChanged: (text) {
                                  //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                                },
                                editingController: _currentController,
                              ),
                              ThemedTextField(
                                "Last Name",
                                TextInputType.text,
                                textInputAction: TextInputAction.next,
                                textStyle: TextStyle(
                                    color: Colors.grey[300]),
                                onChanged: (text) {
                                  //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                                },
                                editingController: _newController,
                              ),

                              ThemedButton(
                                onPressed: () {
                                  Dialogs.showLoadingDialog(
                                      context, _keyLoader,
                                      "Change Password..");
                                  BlocProvider.of<PetProfileBloc>(context)
                                      .add(ChangePassword(
                                 _currentController.text,
              _newController.text
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
