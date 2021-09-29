import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/main.dart';

class ProviderSearchScreen extends StatefulWidget {
  @override
  _ProviderSearchScreenState createState() => _ProviderSearchScreenState();
}

class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
  Color _iconColor = Colors.yellowAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(children: [
          ShowLocation(),
          MyClass(),
          SizedBox(
            height: 20,
          ),
          //  Padding(
          //    padding: EdgeInsets.only(left: 20),
          //
          // child:PadExp
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      color: Colors.white,
                      height: 45,
                      //  width: 200,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.7),
                                borderSide: new BorderSide()),
                            hintText: 'Search',
                            fillColor: Colors.white,
                            suffixIcon: Image.asset(
                              'assets/icons/icone-setting-19.png',
                              height: 50,
                              // width: 30,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => SimpleMAp()));
                          },
                          child: Image.asset(
                            'assets/icons/icone-setting-61.png',
                            height: 40,
                          ))),
                ]),
          )),
          SizedBox(
            width: 20,
          ),
          Padding(
              padding: EdgeInsets.only(top: 300),
              child: Image.asset('assets/images/frankspet-1.png')),
        ])

            //   ]
            ));
  }
}

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  bool pressGeoON = false;
  bool cmbscritta = true;
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomRight,
            child: InkWell(
                child: Column(children: [
                  cmbscritta
                      ? Image.asset(
                          'assets/icons/marufilter-button-last.png',
                          height: 40,
                        )
                      : Container(
                          width: 500,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/icone-setting-62.png'),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      // isPressed = !isPressed;
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/icons/icone-setting-49.png',
                                    //   color:
                                    //   isPressed ? Colors.white : Colors.blue,
                                    height: 40,
                                  ),
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-50.png',
                                  height: 40,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-51.png',
                                  height: 40,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-53.png',
                                  height: 40,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-54.png',
                                  height: 40,
                                ),
                                Image.asset(
                                  'assets/icons/icone-setting-52.png',
                                  height: 40,
                                ),
                                // Padding(
                                //     padding:
                                //         EdgeInsets.fromLTRB(0, 100, 500, 0),
                                //     child: ToggleButton(
                                //       text1: 'hkd',
                                //       text2: 'hkjf',
                                //     )),
                              ],
                            ),
                          ),
                        ),
                ]),
                //    style: TextStyle(fontSize: 14)
                onTap: () {
                  setState(() {
                    pressGeoON = !pressGeoON;
                    cmbscritta = !cmbscritta;
                  });
                })),
      ),
    ]);
  }
}
