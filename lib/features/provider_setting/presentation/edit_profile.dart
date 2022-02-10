import 'package:flutter/material.dart';
import 'package:maru/features/Account_setting/presentation/bloc/edit_profile_screen.dart';
class ProviderEditProfile extends StatefulWidget {
  const ProviderEditProfile({Key key}) : super(key: key);

  @override
  _ProviderEditProfileState createState() => _ProviderEditProfileState();
}

class _ProviderEditProfileState extends State<ProviderEditProfile> {
  @override
  Widget build(BuildContext context) {
    return CreateUserProfile();
  }
}
