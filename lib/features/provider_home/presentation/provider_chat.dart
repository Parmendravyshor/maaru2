import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat2 extends StatefulWidget {
  final String user;

  const Chat2({Key key, this.user}) : super(key: key);

  @override
  Chat2State createState() => Chat2State();
}

class Chat2State extends State<Chat2> {
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  TextEditingController _messageController;
  ScrollController _controller;
  IO.Socket socket;

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    _messageController.text = '';
    print(messageText);
    if (messageText != '') {
      // var messagePost = {
      //   "id": socket.id,
      //   'message': messageText,
      //   'sender': widget.user,
      //   'recipient': 'message',
      //   'time': DateTime.now().toUtc().toString().substring(0, 16)
      // };
      var messagePost = {
        'userId': 73,
        'user2Id': 4,
        'SenderID': 73,
        'message': messageText,
        'messageType': '0'
      };
      socket.emit('send_messages', messagePost);

      socket.on('send_new_message', (message) {
        print('send_new_message>>>>>>' + message.toString());
        setState(() {
          if (mounted) {
            MessagesModel.messages.add(message);
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _controller = ScrollController();
    initSocket();
    MessagesModel.messages.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          )
        });
  }

  Future<void> initSocket() async {
    print('Connecting to chat service' + widget.user.toString());
    // String registrationToken = await getFCMToken();
    socket = IO.io('http://18.191.199.31:80', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userName': widget.user,
        // 'registrationToken': registrationToken
      }
    });
    print('aaaaaa${widget.user}');
    socket.connect();
    socket.onConnect((_) {
      print('connected to websocket');
    });
    var data = {"userId": 4};
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
      'userId': 73,
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

  @override
  void dispose() {
    _messageController.dispose();
    socket.disconnect();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeOf(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 190,
        elevation: 0,

        // Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 30),
              BackArrowButton(),
              Container(
                height: 75,
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                ),
                child:   Image.asset('assets/128/AlanPost.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'OSCAR',
                style: MaaruStyle.text.tiniest,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 120,
            width: size.width,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              cacheExtent: 1000,
              itemCount: MessagesModel.messages.length,
              itemBuilder: (BuildContext context, int index) {
                var message = MessagesModel
                    .messages[MessagesModel.messages.length - index - 1];
                print(message['SenderID'].toString() +
                    '---------' +
                    widget.user.toString());
                return (message['SenderID'].toString() ==
                        widget.user.toString())
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _prefHelper
                                        .getStringByKey('img', '')
                                        .isEmpty
                                    ? const ExactAssetImage(
                                        'assets/128/AlanPost.png')
                                    : FileImage(File(
                                        _prefHelper.getStringByKey('img', ''))),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              child: Container( decoration: BoxDecoration(
                                  color: MaaruColors.button2Color,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7),
                                      bottomLeft: Radius.circular(7),
                                      bottomRight: Radius.circular(7))),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                constraints:
                                    BoxConstraints(maxWidth: size.width * 0.7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${message['message']}',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 16)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MaaruColors.buttonColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7))),
                                margin: EdgeInsets.only(left: 20, right: 20),
                                constraints:
                                    BoxConstraints(maxWidth: size.width * 0.7),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${message['SenderID']}',
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 10)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${message['message']}',
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 16)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:'assets/128/CrystalGaskell.png'
                                        .isEmpty
                                    ? const ExactAssetImage(
                                        'assets/128/CrystalGaskell.png')
                                    : FileImage(File(
                                        _prefHelper.getStringByKey('img', ''))),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 130,
                                  color: Colors.white,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconItem(
                                            Icons.insert_drive_file,
                                            Colors.indigo,
                                            'Document',
                                          ),
                                          IconItem(Icons.camera_alt,
                                              Colors.pink, 'Camera'),
                                          IconItem(Icons.insert_photo,
                                              Colors.purple, 'Gallery'),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          MapView()));
                                            },
                                            child: IconItem(Icons.location_pin,
                                                Colors.yellow, 'Location'),
                                          )
                                        ])
                                  ]));
                            });
                      },
                      child: Image.asset(
                        'assets/icons/icone-setting-64.png',
                        height: 40,
                      )),
                  Container(
                    width: size.width * 0.70,
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      controller: _messageController,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: "Message",
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        counterText: '',
                      ),
                      style: TextStyle(fontSize: 15),
                      keyboardType: TextInputType.text,
                      maxLength: 500,
                    ),
                  ),
                  Container(
                    width: size.width * 0.20,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/icons/icone-setting-65.png',
                        height: 60,
                      ),
                      onPressed: () {
                        _sendMessage();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget IconItem(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
          ),
        ),
        Text(
          text,
          style: MaaruStyle.text.tiny,
        ),
      ],
    );
  }
}

class AvatarImage extends StatelessWidget {
  final String imagepath;
  final bool isfile;
  AvatarImage(this.imagepath, this.isfile);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: isfile
                ? FileImage(File(imagepath))
                : AssetImage(
                    'assets/images/istockphoto-1179420343-612x612.jpg'),
            fit: BoxFit.cover,
          ),
        ));
  }
}

class JumpingDot extends AnimatedWidget {
  JumpingDot({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      child: Text('.'),
    );
  }
}
