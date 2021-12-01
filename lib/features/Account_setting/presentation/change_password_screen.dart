import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

                  //   Padding(
                  padding: EdgeInsets.only(left: 0, top: 0),
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackArrowButton(),
                        Container(
                          //  padding: EdgeInsets.only(right: 40),
                          alignment: Alignment.centerRight,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/128/CrystalGaskell.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Container(
                            color: Color(0xffFFFFFF),
                            child: Padding(
                                padding: EdgeInsets.only(top: 70.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1 /
                                                2,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                                                    'Change Password',
                                                    style:
                                                        MaaruStyle.text.tiniest,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  _status
                                                      ? _getEditIcon()
                                                      : Container(),
                                                ],
                                              )
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    'Enter Current Password',
                                                    style: MaaruStyle
                                                        .text.greyDisable,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Flexible(
                                                child: ThemedTextField(
                                                  "",
                                                  TextInputType.text,
                                                  enabled: !_status,
                                                  editingController:
                                                      _newController,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    'Enter New Password',
                                                    style: MaaruStyle
                                                        .text.greyDisable,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              Flexible(
                                                child: ThemedTextField(
                                                  "",
                                                  TextInputType.text,
                                                  enabled: !_status,
                                                  editingController:
                                                      _currentController,
                                                ),
                                              ),
                                            ],
                                          )),
                                      !_status
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25,
                                                  right: 25,
                                                  top: 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10.0),
                                                      child: Container(
                                                          child: RaisedButton(
                                                        child: const Text(
                                                            "Change"),
                                                        textColor: Colors.white,
                                                        color: MaaruColors
                                                            .buttonColor,
                                                        onPressed: () {
                                                          String paword =
                                                              _newController
                                                                  .text;

                                                          if (paword.length <
                                                              8) {
                                                            AlertManager
                                                                .showErrorMessage(
                                                                    "Password must be 8 characters long",
                                                                    context);
                                                          }
                                                          else {
                                                            Dialogs
                                                                .showLoadingDialog(
                                                                context,
                                                                _keyLoader,
                                                                "Updating Password..");
                                                            BlocProvider.of<
                                                                PetProfileBloc>(
                                                                context)
                                                                .add(
                                                                ChangePassword(
                                                                    _currentController
                                                                        .text,
                                                                    _newController
                                                                        .text));
                                                          }
                                                        },
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0)),
                                                      )),
                                                    ),
                                                    flex: 2,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Container(
                                                          child: RaisedButton(
                                                        child: Text("Cancel"),
                                                        textColor: Colors.white,
                                                        color: MaaruColors
                                                            .textColor,
                                                        onPressed: () {
                                                          setState(() {
                                                            _status = true;
                                                            FocusScope.of(
                                                                    context)
                                                                .requestFocus(
                                                                    FocusNode());
                                                          });
                                                        },
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0)),
                                                      )),
                                                    ),
                                                    flex: 2,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                    ])))
                      ])));
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
