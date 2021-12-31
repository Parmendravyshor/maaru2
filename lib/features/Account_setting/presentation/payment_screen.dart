import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
import 'package:maru/features/Book_Appointment/presentation/booked_confirm.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  bool enabled = false;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  TextEditingController _expDateController;
  TextEditingController _creditCardNumberController;
  TextEditingController _nameOnCardController;
  TextEditingController _cvvController;

  @override
  void initState() {
    _expDateController = TextEditingController();
    _creditCardNumberController = TextEditingController();
    _nameOnCardController = TextEditingController();
    _cvvController = TextEditingController();

    super.initState();
  }
  TextEditingController _nameEditingController;
  TextEditingController _controller;
  bool priceupdate_value = true;

  List<int> userSearchItems = [];
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  var nameTECs = <TextEditingController>[];
  var ageTECs = <TextEditingController>[];
  var jobTECs = <TextEditingController>[];
  List<Container> containers = List <Container>();

  Container createContainer() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var jobController = TextEditingController();
    nameTECs.add(nameController);
    ageTECs.add(ageController);
    jobTECs.add(jobController);
    return  Container(
        color: Color(0xffFFFFFF),
        child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

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
                                'NAME on Card'.toUpperCase(),
                                style:
                                MaaruStyle.text.greyDisable,
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
                              enabled: _status,
                              editingController: _nameOnCardController,
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
                                'Credit Card Number'.toUpperCase(),
                                style:
                                MaaruStyle.text.greyDisable,
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
                              TextInputType.number,
                              enabled: _status,
                              editingController:
                              _creditCardNumberController,
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0,
                        left: MediaQuery.of(context).size.width *
                            0.1 /
                            2),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Cvv'.toUpperCase(),
                                style: MaaruStyle.text.greyDisable,
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: 10,

                          Flexible(
                            child: Container(
                                padding: EdgeInsets.only(left: 200, ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max  ,
                                  children: [
                                    Row(children: [
                                      Text('Exp'.toUpperCase(), style: MaaruStyle.text.greyDisable,),


                                    ],)
                                  ],)
                            ),
                          ),

                        ]),),

                  Padding(
                      padding: EdgeInsets.only(top: 0.0,),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            child: ThemedTextField(
                              "",
                              TextInputType.number,
                              enabled: _status,
                              editingController: _cvvController,
                            ),
                          ),
                          Flexible(
                            child: ThemedTextField(
                              "",
                              TextInputType.number,
                              enabled: _status,
                              editingController: _expDateController,
                            ),
                          ),
                        ],
                      )),


              SizedBox(height: 10,),
              InkWell(onTap: (){
                setState(() {
                  _removeWidget();
                });
              },
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, ),
                 child: Row(

                    children: [

                    ElevatedButton(

                      onPressed: () {

                      },
                      child: Icon(Icons.remove, color: Colors.white,),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Colors.red, // <-- Button color
                        onPrimary: Colors.red, // <-- Splash color
                      ),
                    ),
                    Text('Remove Card'.toUpperCase(),style:GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color(0xFFc72019))))
                  ],
                  ))),
            ])
    ));
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
              _expDateController.text =
                  _prefHelper.getStringByKey(MaruConstant.exp_date, "");
              _creditCardNumberController.text =
                  _prefHelper.getStringByKey(MaruConstant.credit_card_no, "");
              _nameOnCardController.text =
                  _prefHelper.getStringByKey(MaruConstant.name_on_card, "");
              _cvvController.text =
                  _prefHelper.getStringByKey(MaruConstant.cvv, "");
              if (state is SavePaymentButtonTapped) {
                _status = true;
              }
              return SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                    BackArrowButton(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topRight,
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
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                            padding: EdgeInsets.only(top: 70.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.1 /
                                                2,
                                        right:
                                            MediaQuery.of(context).size.width *
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
                                                'Payment Information',
                                                style: MaaruStyle.text.tiniest,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                'Name on Card',
                                                style:
                                                    MaaruStyle.text.greyDisable,
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
                                              editingController: _nameOnCardController,
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
                                                'Credit Card Number',
                                                style:
                                                    MaaruStyle.text.greyDisable,
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
                                              TextInputType.number,
                                              enabled: !_status,
                                              editingController:
                                                  _creditCardNumberController,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: MediaQuery.of(context).size.width *
                                            0.1 /
                                            2),
                                    child:
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Cvv',
                                                style: MaaruStyle.text.greyDisable,
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //   width: 10,

                                          Flexible(
                                            child: Container(
                                                padding: EdgeInsets.only(left: 200, ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.max  ,
                                                  children: [
                                                    Row(children: [
                                                      Text('Exp', style: MaaruStyle.text.greyDisable,),


                                                    ],)
                                                  ],)
                                            ),
                                          ),

                                        ]),),

                                  Padding(
                                      padding: EdgeInsets.only(top: 0.0,),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Flexible(
                                            child: ThemedTextField(
                                              "",
                                              TextInputType.number,
                                              enabled: !_status,
                                              editingController: _cvvController,
                                            ),
                                          ),
                                          Flexible(
                                            child: ThemedTextField(
                                              "",
                                              TextInputType.number,
                                              enabled: !_status,
                                              editingController: _expDateController,
                                            ),
                                          ),
                                        ],
                                      )),
                                ]))),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: containers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return containers[index];
                              },
                            ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20,top: 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              radius: 25,
                              child: Icon(
                                Icons.add,
                                color: MaaruColors.buttonColor,
                                size: 25,
                              ),
                            )),


                        InkWell(
                            onTap: ()async {
                              !_status;
                              setState(() => containers.add(createContainer()));
                            },
                            child: Text(
                              '  Add New Card',
                              style: MaaruStyle.text.mediumGreen,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Container(
                              height: 100,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[50],
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Visa Card',
                                          style: MaaruStyle.text.tiniest,
                                        ),
                                        Text(
                                          'Primary Payment',
                                          style: MaaruStyle.text.greyDisable,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 150),
                                        child: Text(
                                          '**** **** **** 9877',
                                          style: MaaruStyle.text.tiny,
                                        ))
                                  ]))),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 100,
                              width: 380,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.grey[100])),
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discover Card',
                                          style: MaaruStyle.text.greyDisable,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 150),
                                        child: Text(
                                          '**** **** **** 9877',
                                          style: MaaruStyle.text.greyDisable,
                                        ))
                                  ]))),
                          SizedBox(
                            height: 30,
                          ),
                          !_status
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, right: 25, top: 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Container(
                                              child: RaisedButton(
                                            child: const Text("Payment"),
                                            textColor: Colors.white,
                                            color: MaaruColors.buttonColor,
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookedConfirm()));
                                              // String paword =
                                              // _newController
                                              //     .text;
                                              //
                                              // if (paword.length <
                                              // 8) {
                                              // AlertManager
                                              //     .showErrorMessage(
                                              // "Password must be 8 characters long",
                                              // context);
                                              // }
                                              // else {
                                              Dialogs
                                                  .showLoadingDialog(
                                              context,
                                              _keyLoader,
                                              "Updating Password..");
                                              BlocProvider.of<
                                              PetProfileBloc>(
                                              context)
                                                  .add(
                                              savePayment(
                                              _cvvController
                                                  .text,
                                              _creditCardNumberController.text,
                                              _nameOnCardController.text,
                                              _expDateController
                                                  .text));
                                               
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0)),
                                          )),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                              child: RaisedButton(
                                            child: Text("Cancel"),
                                            textColor: Colors.white,
                                            color: MaaruColors.textColor,
                                            onPressed: () {
                                              setState(() {
                                                _status = true;
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0)),
                                          )),
                                        ),
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    )
                  ])));
            })));
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
  _removeWidget() {
    if (containers.length > 0) {
      containers.removeLast();
    }
  }
}




