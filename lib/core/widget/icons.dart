import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:flutter/scheduler.dart';

import 'alert_manager.dart';

class ScreenIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<RegisterBloc>(),
        child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          if (state is GoogleRegisterSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              AlertManager.showErrorMessage(
                "otp send your register email",
                context,
              );
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            });

            return Container();
          } else if (state is fbRegisterSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              AlertManager.showErrorMessage(
                "otp send your register email",
                context,
              );
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const HomeScreen();
              }));
            });

            return Container();
          } else if (state is GoogleRegisterFailure) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration(seconds: 1), () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black,
                    content: Text('authenticate field',
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
          return Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(FacebookSignupButtonTapped());
                    },
                    child: Image.asset(
                      'assets/icons/Rectangle copy.png',
                      height: size.height * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  InkWell(
                    onTap: () async {
                      BlocProvider.of<RegisterBloc>(context)
                          .add(GoogleSignupButtonTapped());
                    },
                    child: Image.asset(
                      'assets/icons/Rectangle (1).png',
                      height: size.height * 0.05,
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class ScreenIcon2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(left: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-facebook.png",
              width: 170,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(right: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-google.png",
              width: 170,
              //  fit: BoxFit.cover,

              // height: 70,
            ),
          ),
        ),
      ],
    );
  }
}
