import 'dart:io';
import 'dart:ui';

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
import 'package:maru/features/Account_setting/presentation/payment/bloc/payment_bloc.dart';
import 'package:maru/features/Account_setting/presentation/payment/input_formetters.dart';
import 'package:maru/features/Account_setting/presentation/payment/my_strings.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_card_details.dart';
import 'package:maru/features/Book_Appointment/presentation/booked_confirm.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:flutter/services.dart';

class PaymentScreen1 extends StatefulWidget {
  // PaymentScreen1({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _PaymentScreen1State createState() => _PaymentScreen1State();
}

class _PaymentScreen1State extends State<PaymentScreen1>
    with SingleTickerProviderStateMixin {
  bool enabled = false;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  TextEditingController _expDateController;
  TextEditingController _creditCardNumberController;
  TextEditingController _nameOnCardController;
  TextEditingController _cvvController;
  TextEditingController _bankNameController;

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
        child: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  return Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(
                                  Icons.person,
                                  size: 40.0,
                                ),
                                hintText: 'What name is written on card?',
                                labelText: 'Card Name',
                              ),
                              onSaved: (String value) {
                                _card.name = value;
                              },
                              keyboardType: TextInputType.text,
                              validator: (String value) =>
                                  value.isEmpty ? Strings.fieldReq : null,
                              controller: _nameOnCardController,
                            ),
                            new SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(19),
                                CardNumberInputFormatter()
                              ],
                              controller: _creditCardNumberController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: const UnderlineInputBorder(),
                                filled: true,
                                icon: CardUtils.getCardIcon(_paymentCard.type),
                                hintText: 'What number is written on card?',
                                labelText: 'Number',
                              ),
                              onSaved: (String value) {
                                print('onSaved = $value');
                                print(
                                    'Num controller has = ${numberController.text}');
                                _paymentCard.number =
                                    CardUtils.getCleanedNumber(value);
                              },
                              validator: CardUtils.validateCardNum,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: UnderlineInputBorder(),
                                        filled: true,
                                        icon: Icon(Icons.credit_score),
                                        hintText: 'Number behind the card',
                                        labelText: 'CVV',
                                      ),
                                      validator: CardUtils.validateCVV,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        _paymentCard.cvv = int.parse(value);
                                      },
                                      controller: _cvvController,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        CardMonthInputFormatter()
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: const UnderlineInputBorder(),
                                        filled: true,
                                        icon: Image.asset(
                                          'assets/icons/icone-setting-21.png',
                                          width: 25,
                                          color: Colors.grey[600],
                                        ),
                                        hintText: 'MM/YY',
                                        labelText: 'Expiry Date',
                                      ),
                                      validator: CardUtils.validateDate,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        List<int> expiryDate =
                                            CardUtils.getExpiryDate(value);
                                        _paymentCard.month = expiryDate[0];
                                        _paymentCard.year = expiryDate[1];
                                      },
                                      controller: _expDateController,
                                    ),
                                  ),
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
                                            primary:
                                                Colors.red, // <-- Button color
                                            onPrimary:
                                                Colors.red, // <-- Splash color
                                          ),

//                         ],
//                       )),
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
                          ]));
                }))));
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
    var _autoValidateMode = AutovalidateMode.disabled;

  var _card = new PaymentCard();

  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
    _bankNameController = TextEditingController();
    _expDateController = TextEditingController();
    _creditCardNumberController = TextEditingController();
    _nameOnCardController = TextEditingController();
    _cvvController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[360],
        key: _scaffoldKey,
        body: BlocProvider(
            create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                      if(state is SavePaymentButtonTapped){}
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Form(
                          key: _formKey,
                          autovalidateMode: _autoValidateMode,
                          child: ListView(children: <Widget>[
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
                             Text('Update Payment',style: MaaruStyle.text.tiniest,),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(
                                  Icons.person,
                                  size: 40.0,
                                ),
                                hintText: 'What name is written on card?',
                                labelText: 'Card Name',
                              ),
                              onSaved: (String value) {
                                _card.name = value;
                              },
                              keyboardType: TextInputType.text,
                              validator: (String value) =>
                                  value.isEmpty ? Strings.fieldReq : null,
                              onChanged: (text){

                              },
                              controller: _nameOnCardController,
                            ),
                             const SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(19),
                                CardNumberInputFormatter()
                              ],
                              controller: _creditCardNumberController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hoverColor: Colors.white,
                                border: const UnderlineInputBorder(),
                                filled: true,
                                icon: CardUtils.getCardIcon(_paymentCard.type),
                                hintText: 'What number is written on card?',
                                labelText: 'Number',
                              ),
                              onSaved: (String value) {
                                print('onSaved = $value');
                                print(
                                    'Num controller has = ${numberController.text}');
                                _paymentCard.number =
                                    CardUtils.getCleanedNumber(value);
                              },
                              validator: CardUtils.validateCardNum,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      decoration:  InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: UnderlineInputBorder(),
                                        filled: true,
                                        icon:Image.asset(
                                          'assets/images/card_cvv.png',
                                          width: 40.0,
                                          color: Colors.grey[600],
                                        ),
                                        hintText: 'Number behind the card',
                                        labelText: 'CVV',
                                      ),
                                      validator: CardUtils.validateCVV,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        _paymentCard.cvv = int.parse(value);
                                      },
                                      controller: _cvvController,
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        CardMonthInputFormatter()
                                      ],
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hoverColor: Colors.white,
                                        border: const UnderlineInputBorder(),
                                        filled: true,
                                        icon: Image.asset(
                                          'assets/icons/icone-setting-21.png',
                                          width: 25,
                                          color: Colors.grey[600],
                                        ),
                                        hintText: 'MM/YY',
                                        labelText: 'Expiry Date',
                                      ),
                                      validator: CardUtils.validateDate,
                                      keyboardType: TextInputType.number,
                                      onSaved: (value) {
                                        List<int> expiryDate =
                                            CardUtils.getExpiryDate(value);
                                        _paymentCard.month = expiryDate[0];
                                        _paymentCard.year = expiryDate[1];
                                      },
                                      controller: _expDateController,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new SizedBox(
                              height: 30.0,
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: containers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return containers[index];
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocProvider(
                              create: (context) =>
                                  KiwiContainer().resolve<PaymentBloc>(),
                              child: BlocBuilder<PaymentBloc, PaymentState>(
                                  builder: (context, state) {
                                if (state is PaymentInitial) {
                                  BlocProvider.of<PaymentBloc>(context)
                                      .add(GetUserPayment());

                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is GetUserPaymentModel) {
                                  return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 0),
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: state
                                                  .fetchCardDetailsModel
                                                  .getCardDetails
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 15.0),
                                                  child: Container(
                                                      height: 100,
                                                      width: 380,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .deepPurple[50],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0)),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  20,
                                                                  20,
                                                                  10,
                                                                  0),
                                                          child:
                                                              Column(children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Visa Card',
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .tiniest,
                                                                ),
                                                                Text(
                                                                  'Primary Payment',
                                                                  style: MaaruStyle
                                                                      .text
                                                                      .greyDisable,
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    '************${state.fetchCardDetailsModel.getCardDetails[index].cardNumber.substring(state.fetchCardDetailsModel.getCardDetails[index].cardNumber.length - 4)}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: MaaruStyle
                                                                        .text
                                                                        .tiny,
                                                                  ),
                                                                ))
                                                          ]))),
                                                );
                                              }),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              height: 100,
                                              width: 380,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                      color: Colors.grey[100])),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 20, 10, 0),
                                                  child: Column(children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Discover Card',
                                                          style: MaaruStyle
                                                              .text.greyDisable,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 150),
                                                        child: Text(
                                                          '**** **** **** 9877',
                                                          style: MaaruStyle
                                                              .text.greyDisable,
                                                        ))
                                                  ]))),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Padding(
                                          //         padding:
                                          //             const EdgeInsets
                                          //                     .only(
                                          //                 left: 10,
                                          //                 top: 0),
                                          //         child: CircleAvatar(
                                          //           backgroundColor:
                                          //               Colors.grey[100],
                                          //           radius: 25,
                                          //           child: Icon(
                                          //             Icons.add,
                                          //             color: MaaruColors
                                          //                 .buttonColor,
                                          //             size: 25,
                                          //           ),
                                          //         )),
                                          //     InkWell(
                                          //         onTap: () async {
                                          //           !_status;
                                          //           setState(() =>
                                          //               containers.add(
                                          //                   createContainer()));
                                          //         },
                                          //         child: Text(
                                          //           '   Add New Card',
                                          //           style: MaaruStyle
                                          //               .text.mediumGreen,
                                          //         ))
                                          //   ],
                                          // ),
                                          const SizedBox(
                                            height: 30.0,
                                          ),
                                          ThemedButton(
                                            text: 'Update Payment',
                                            enabled: true,
                                            onPressed: () {
                                              final FormState form =
                                                  _formKey.currentState;
                                              if (!form.validate()) {
                                                setState(() {
                                                  _autoValidateMode =
                                                      AutovalidateMode
                                                          .always; // Start validating on every change.
                                                });
                                                _showInSnackBar(
                                                    'Please fix the errors in red before submitting.');
                                              } else {
                                                form.save();
                                                MyStatefulWidget();
                                                //    Dialogs.showLoadingDialog(context, _keyLoader, "Updating Payment..");
                                                //  MyStatefulWidget();
                                                BlocProvider.of<
                                                            PaymentBloc>(
                                                        context)
                                                    .add(savePayment(
                                                        _cvvController.text,
                                                        _creditCardNumberController
                                                            .text,
                                                        _cvvController.text,
                                                        _expDateController
                                                            .text));

                                                // Encrypt and send send payment details to payment gateway
                                                _showInSnackBar(
                                                    'Payment card is valid');
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ));
                                } else {
                                  return CircularProgressIndicator();
                                }
                                ;
                              }),
                            )
                          ])));
                }))));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidateMode =
            AutovalidateMode.always; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      Dialogs.showLoadingDialog(context, _keyLoader, "Updating Payment..");
      MyStatefulWidget();
      BlocProvider.of<PaymentBloc>(context).add(savePayment(
          _nameOnCardController.text,
          _creditCardNumberController.text,
          _expDateController.text,
          _cvvController.text));

      // Encrypt and send send payment details to payment gateway
      _showInSnackBar('Payment card is valid');
    }
  }

  Widget _getPayButton() {
    if (Platform.isIOS) {
      return ThemedButton(
        text: 'Update Payment',
        onPressed: _validateInputs,
        enabled: true,
      );
    } else {
      return ThemedButton(
        text: 'Update Payment',
        onPressed: _validateInputs,
        enabled: true,
      );
    }
  }

  void _showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }

  _removeWidget() {
    if (containers.length > 0) {
      containers.removeLast();
    }
  }
}
