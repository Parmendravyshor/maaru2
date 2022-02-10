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
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Account_setting/presentation/bloc/account_setting.dart';
import 'package:maru/features/Account_setting/presentation/bloc/setting_bloc.dart';
import 'package:flutter/scheduler.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with SingleTickerProviderStateMixin {
  void _showDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(actions: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                        color: MaaruStyle.colors.textColorWhite,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
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
                                style:
                                    TextStyle(color: MaaruColors.buttonColor),
                              ))
                        ],
                      )))
            ]));
      },
    );
  }

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
      create: (context) => KiwiContainer().resolve<SettingBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
          try {
            // Navigator.of(_keyLoader.currentContext, rootNavigator: true);
            // Navigator.of(context).pop();
          } catch (e) {}
          _currentController.text =
              _prefHelper.getStringByKey(MaruConstant.current_password, "");
          _newController.text =
              _prefHelper.getStringByKey(MaruConstant.change_password, "");

          if (state is UserChangePasswordButtonTapped) {
            _status = true;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              AlertManager.showErrorMessage(
                  'Password Changed SuccessFully', context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AccountSettingScreen();
              }));
            });
            return Container();
          } else if (state is UserChangePasswordButtonTappedFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(seconds: 3), () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text('Your Old Password is Wrong',
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
              BackArrowButton(),
              SizedBox(
                height: 20,
              ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 90.0,
                              child: Image.asset(
                                'assets/128/CrystalGaskell.png',
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                          'assets/128/CrystalGaskell.png'));
                                },
                              ))
                        ],
                      )),
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
                              'Change Password'.toUpperCase(),
                              style: MaaruStyle.text.tiniest,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ThemedTextField(
                          "Enter old Password",
                          TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textStyle: TextStyle(color: Colors.grey[300]),
                          onChanged: (text) {
                            //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                          },
                          editingController: _currentController,
                        ),
                        ThemedTextField(
                          "Enter New Password",
                          TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textStyle: TextStyle(color: Colors.grey[300]),
                          onChanged: (text) {
                            //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                          },
                          editingController: _newController,
                        ),
                        ThemedButton(
                          onPressed: () {
                            String currentpass = _currentController.text;
                            String newpass = _newController.text;
                            if (currentpass.isEmpty) {
                              _showDialog(
                                context,
                                "Please fill correct current pass",
                              );
                            } else if (currentpass.length < 8) {
                              _showDialog(
                                context,
                                "check the credential",
                              );
                            } else if (newpass.isEmpty) {
                              _showDialog(
                                context,
                                "Please enter new password",
                              );
                            } else if (newpass.length < 8) {
                              _showDialog(
                                context,
                                "password should be mor than 8 character long",
                              );
                            } else {
                              BlocProvider.of<SettingBloc>(context).add(
                                  ChangePassword(_currentController.text,
                                      _newController.text));
                            }

                            // Dialogs.showLoadingDialog(
                            //     context, _keyLoader, "Change Password..");
                          },
                          text: 'Update Password',
                        )
                      ]),
                ),
              ),
            ])),
          );
        }),
      ),
    );
  }
}
