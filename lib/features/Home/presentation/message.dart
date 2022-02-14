import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/custom_card.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/features/chat/presentation/chatt_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'chat_circle_list_view.dart';
import 'create_home_screen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Messages extends StatefulWidget {
  // const Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
<<<<<<< HEAD
  TextEditingController _petNameController;
  @override
  void initState() {
    _petNameController = TextEditingController();
=======
  @override
  void initState() {
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
    initSocket();
  }

  int id;
  IO.Socket socket;
  Future<void> initSocket() async {
    print('Connecting to chat service' + 4.toString());
    // String registrationToken = await getFCMToken();
    socket = IO.io('http://18.191.199.31:80', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userName': _prefHelper.getIntByKey('id', id),
        // 'registrationToken': registrationToken
      }
    });

    socket.connect();
    socket.onConnect((_) {
      print('connected to websocket');
    });

    var data = {"userId": _prefHelper.getIntByKey('id', id)};
    socket.emit('connect_user', data);
    socket.on("connect_listener", (message) {
      getChats();
      print('============>data in connect_listener' + message.toString());
    });

    // socket.on('newChat', (message) {
    //   print(message);
    //   setState(() {
    //     MessagesModel.messages.add(message);
    //   });
    // });
    // socket.on('allChats', (messages) {
    //   print(messages);
    //   setState(() {
    //     MessagesModel.messages.addAll(messages);
    //   });
    // });
  }

  void getChats() {
    print("get chats..........");

    socket.emit('get_chat', {
      'userId': _prefHelper.getIntByKey('id', id),
      'user2Id': 4,
    });
    socket.on(
        "my_chat",
        (messages) => {
              if (mounted)
                {
                  setState(() {
                    MessagesModel.messages.clear();
                    MessagesModel.messages.addAll(messages);
                  })
                },
              print("my chats.........." + messages.toString())
            });
  }

  ScrollController _controller;
  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    var selectedIndex;
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        bottomNavigationBar: CreateHomeScreen(
            selectedIndex: 3,
            Color2: selectedIndex == 3
                ? Colors.grey[300]
                : MaaruColors.textButtonColor
            //Color:MaaruColors.textButtonColor
            ),
        body: BlocProvider(
          create: (context) => KiwiContainer().resolve<LoginBloc>(),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginInitial) {
              BlocProvider.of<LoginBloc>(context).add(event.GetProvider(''));

              return const CircularProgressIndicator();
            } else if (state is ProviderLoaded1) {
              return SafeArea(
                  bottom: false,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: 30,
                      ),

                      // Align(
                      //     alignment: Alignment.centerRight,
                      //
                      //         child:
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,

                        ),
                        child:   Image.asset('assets/128/CrystalGaskell.png'),
                      ),

                      Padding(
                          padding:
                              EdgeInsets.only(top: 15, right: 20, left: 10),
                          child: TextFormField(
                            // cursorColor: Colors.black,
                            decoration: InputDecoration(
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.7),
                                    borderSide: new BorderSide(
                                        color: Colors.grey[300], width: 1.0)),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.7),
                                    borderSide: new BorderSide(
                                        color: Colors.grey[300], width: 1.0)),
                                hintText: 'Search',
                                hintStyle: MaaruStyle.text.greyDisable,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 25.0, 10.0),
                                fillColor: Colors.white,
                                suffixIcon: Image.asset(
                                  'assets/icons/icone-setting-19.png',
                                  height: 50,
                                  // width: 30,
                                )),
<<<<<<< HEAD
                            onChanged: (text){
                              BlocProvider.of<LoginBloc>(context).add(event.GetProvider(_petNameController.text));
                            },controller: _petNameController,
=======
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '   Providers'.toUpperCase(),
                          style: MaaruStyle.text.tiny,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Column(
                        children: [
<<<<<<< HEAD
                          Container(
                            height: 70,
                            width: 400,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state
                                    .getProviderModel.providersListing.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Image.network(
                                            state
                                                .getProviderModel
                                                .providersListing[
                                            index]
                                                .img,
                                            errorBuilder:
                                                (BuildContext, Object,
                                                StackTrace) {
                                              return Image.asset(
                                                'assets/128/CrystalGaskell.png',
                                                fit: BoxFit.fitWidth,
                                              );
                                            },
                                          ),
                                        ),
                                      ]);
                                }),
                          ),
=======
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state
                                  .getProviderModel.providersListing.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 100,
                                        child: Image.network(
                                          state
                                              .getProviderModel
                                              .providersListing[
                                          index]
                                              .img,
                                          errorBuilder:
                                              (BuildContext, Object,
                                              StackTrace) {
                                            return Image.asset(
                                              'assets/128/CrystalGaskell.png',
                                              fit: BoxFit.fitWidth,
                                            );
                                          },
                                        ),
                                      ),
                                    ]);
                              }),
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state
                                  .getProviderModel.providersListing.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => Chat1(
                                                    user: state
                                                        .getProviderModel
                                                        .providersListing[index]
                                                        .id
                                                        .toString(),
                                                  )));
                                    },
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 20),
                                            child: Container(
                                                height: 120,
                                                width: 400,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[50],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Center(
                                                  child: ListTile(
                                                    leading: Image.network(
                                                      state
                                                          .getProviderModel
                                                          .providersListing[
                                                              index]
                                                          .img,
                                                      errorBuilder:
                                                          (BuildContext, Object,
                                                              StackTrace) {
                                                        return Image.asset(
                                                          'assets/128/CrystalGaskell.png',
                                                          fit: BoxFit.fitWidth,
                                                        );
                                                      },
                                                    ),
                                                    title: Text(
                                                      state
                                                          .getProviderModel
                                                          .providersListing[
                                                              index]
                                                          .companyName
                                                          .toString(),
                                                      style:
                                                          MaaruStyle.text.tiny,
                                                    ),
                                                    subtitle: ListView.builder(
                                                        controller: _controller,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        shrinkWrap: true,
                                                        reverse: true,
                                                        cacheExtent: 1000,
                                                        itemCount: 0,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          var message =
                                                              MessagesModel
                                                                  .messages[0];
                                                          print(message[
                                                                      'SenderID']
                                                                  .toString() +
                                                              '---------' +
                                                              4.toString());
                                                          return Text(
                                                            '${message['4']}',
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey),
                                                          );
                                                        }),
                                                    trailing: Text(
                                                      'today'.toUpperCase(),
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                )))),
                                  ),
                                ]);
                              }),
                        ],
                      )
                    ]),
                  ));
            } else {
              return const CircularProgressIndicator();
            }
            ;
          }),
        ));
  }
}
