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
  List<Container> containers = List<Container>();

  Container createContainer() {
    var nameController = TextEditingController();
    var ageController = TextEditingController();
    var jobController = TextEditingController();
    nameTECs.add(nameController);
    ageTECs.add(ageController);
    jobTECs.add(jobController);
    return Container(
        color: Color(0xffFFFFFF),
        child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  ThemedTextField(
                    "Name On Card",
                    TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textStyle: TextStyle(color: Colors.grey[300]),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                    },
                    editingController: _expDateController,
                  ),
                  ThemedTextField(
                    "Credit Card Number",
                    TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textStyle: TextStyle(color: Colors.grey[300]),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    editingController: _nameEditingController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: ThemedTextField(
                            "Cvv", TextInputType.text,
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
                                  hintText: 'Exp',
                                  hintStyle: MaaruStyle.text.greyDisable,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[300]),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 40,
                                    color: MaaruColors.buttonColor,
                                  )),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _removeWidget();
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(10),
                                  primary: Colors.red, // <-- Button color
                                  onPrimary: Colors.red, // <-- Splash color
                                ),
                              ),
                              Text('Remove Card',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: Color(0xFFc72019))))
                            ],
                          ))),
                ])));
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
                            Align(alignment: Alignment.center,
                            child:
                            Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    //_image.isEmpty
                                    // ? ExactAssetImage(
                                    //  Image.asset(
                                      'assets/icons/icone-setting-28.png'),
                                  //  : FileImage(File(_image)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
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
                                          //   Row(
                                          //     mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          //     mainAxisSize: MainAxisSize.min,
                                          //     children: <Widget>[
                                          //       _status
                                          //           ? _getEditIcon()
                                          //           : Container(),
                                          //     ],
                                          //   )
                                        ],
                                      )),
                                  ThemedTextField(
                                    "Name On Card",
                                    TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    onChanged: (text) {
                                      //BlocProvider.of<RegisterBloc>(context).add(FNameChanged(text));
                                    },
                                    editingController: _expDateController,
                                  ),
                                  ThemedTextField(
                                    "Credit Card Number",
                                    TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    onChanged: (text) {
                                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                                    },
                                    editingController: _nameEditingController,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: ThemedTextField(
                                            "Cvv", TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            textStyle: TextStyle(
                                                color: Colors.grey[300]),
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
                                            padding: EdgeInsets.only(
                                                left: 15, bottom: 40),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                // contentPadding: EdgeInsets.only(left: 20),
                                                labelText: 'Exp',
                                                labelStyle:
                                                    MaaruStyle.text.greyDisable,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[300]),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
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
                            padding: EdgeInsets.only(left: 20, top: 0),
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
                            onTap: () async {
                              !_status;
                              setState(() => containers.add(createContainer()));
                            },
                            child: Text(
                              'Add New Card',
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
                        ThemedButton(
                          text: 'Update Payment',
                                            onPressed: () {
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
                                              Dialogs.showLoadingDialog(
                                                  context,
                                                  _keyLoader,
                                                  "Updating Payment..");
                                              BlocProvider.of<PetProfileBloc>(
                                                      context)
                                                  .add(savePayment(
                                                      _cvvController.text,
                                                      _creditCardNumberController
                                                          .text,
                                                      _nameOnCardController
                                                          .text,
                                                      _expDateController.text));
                                            },

                        ),
                          SizedBox(height: 40,)
                        ],
                                  ),
                                ),


                        ],
                      ),
                    )
                  );
            })));
  }

  _removeWidget() {
    if (containers.length > 0) {
      containers.removeLast();
    }
  }
}




