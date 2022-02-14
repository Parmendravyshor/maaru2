import 'package:flutter/material.dart';
import 'package:maru/features/Account_setting/presentation/bloc/change_password_screen.dart';
class ChangePaswordProviderSideScreen extends StatefulWidget {
  const ChangePaswordProviderSideScreen({Key key}) : super(key: key);

  @override
  _ChangePaswordProviderSideScreenState createState() => _ChangePaswordProviderSideScreenState();
}

class _ChangePaswordProviderSideScreenState extends State<ChangePaswordProviderSideScreen> {
  @override
  Widget build(BuildContext context) {
    print('ddd');
    return const ChangePasswordScreen();

  }
}
