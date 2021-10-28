import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool star1 = true;
  bool star2 = true;
  bool star3 = true;
  bool star4 = true;
  bool star5 = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CreateHomeScreen(
        // Color:MaaruColors.textButtonColor
      ),
      body: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              height: size.height * 1,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Leave Review',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              star1 = !star1;
                            });
                          },
                          child: Icon(
                            star1 ? Icons.star_border : Icons.star,
                            color: star1 ? Colors.grey : Colors.orange,
                            size: 35,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              star2 = !star2;
                            });
                          },
                          child: Icon(
                            star2 ? Icons.star_border : Icons.star,
                            color: star2 ? Colors.grey : Colors.orange,
                            size: 35,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              star3 = !star3;
                            });
                          },
                          child: Icon(
                            star3 ? Icons.star_border : Icons.star,
                            color: star3 ? Colors.grey : Colors.orange,
                            size: 35,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              star4 = !star4;
                            });
                          },
                          child: Icon(
                            star4 ? Icons.star_border : Icons.star,
                            color: star4 ? Colors.grey : Colors.orange,
                            size: 35,
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              star5 = !star5;
                            });
                          },
                          child: Icon(
                            star5 ? Icons.star_border : Icons.star,
                            color: star5 ? Colors.grey : Colors.orange,
                            size: 35,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                      child: TextField(
                    autofocus: true,
                    maxLines: 8,
                    decoration: InputDecoration(
                        hintText: 'Leave  your review',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        )),
                  )),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  InkWell(
                      onTap: () {
                        AlertManager.showSuccessMessage('Thank you for Review', context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ViewPetProfile()));
                      },
                      child: RoundedButton(
                        buttonName: 'Submit Review',
                        Color1: MaaruColors.primaryColorsuggesion1,
                        Color: MaaruColors.primaryColorsuggesion,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
