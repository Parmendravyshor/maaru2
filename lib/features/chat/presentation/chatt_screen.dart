import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/features/chat/presentation/chat_bloc.dart';
import 'package:maru/features/chat/presentation/chat_bloc.dart';
import 'package:maru/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'chat_state.dart';
import 'chat_event.dart';
import 'chat_bloc.dart';
import 'chat_bloc.dart';
import 'chat_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:chat_app/firebase/messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:chat_app/firebase/messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chat extends StatefulWidget {
  // final String user;
  //
  // const Chat({Key key, this.user}) : super(key: key);

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  TextEditingController _messageController;
  ScrollController _controller;
  IO.Socket socket;
  bool isAppodealInitialized = true;
  bool isfirst = true;
  final TextEditingController _textEditingController =
  new TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  final container = KiwiContainer();
  List<Message> messageList = [];
  String _image = "";
  Message message;
  final SharedPrefHelper _prefHelper =
  KiwiContainer().resolve<SharedPrefHelper>();
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
        'userId': 4,
        'user2Id': 29,
        'SenderID': 4,
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
    print('Connecting to chat service' + 4.toString());
    // String registrationToken = await getFCMToken();
    socket = IO.io('http://18.191.199.31:80', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userName':'4',
        // 'registrationToken': registrationToken
      }
    });

    socket.connect();
    socket.onConnect((_) {
      print('connected to websocket');
    });
    var data = {"userId": 29};
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
      'userId': 4,
      'user2Id': 29,
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
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                        onTap: () async {
                          //from path_provide package
                          final directory =
                          await getApplicationDocumentsDirectory();

                          String fName =
                              '${DateTime
                              .now()
                              .microsecondsSinceEpoch}.png';
                          String path = directory.path;

                          final savePath =
                          await screenshotController.captureAndSave(
                              path, //set path where screenshot will be saved
                              fileName: fName,
                              pixelRatio:
                              MediaQuery
                                  .of(context)
                                  .devicePixelRatio);
                          List<String> paths = [];
                          paths.add(savePath);
                          // await Share.shareFiles(paths);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.share,
                              size: 20.0,
                            ),
                            // Text(
                            //   "Share",
                            //   style: ChadbotStyle.text.small,
                            // ),
                          ],
                        ))),
              ],
              // Set this height
              flexibleSpace: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    BackArrowButton(),
                    ProfileAvatar(
                      imageUrl:
                      ('assets/images/istockphoto-1179420343-612x612.jpg'),
                      width: 60,
                      avatarRadius: 60,
                      Color: Colors.yellow,
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
            bottom: 60,
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
                   4.toString());
                return (message['SenderID'].toString() ==
                    4.toString())
                    ? Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset('assets/128/CrystalGaskell.png',height: 70,width: 80,),
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.70),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              212, 234, 244, 1.0),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                        ),
                                        child:  Text('${message['message']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16))
                                      ),

                                      // AvatarImage(
                                      //     KiwiContainer()
                                      //         .resolve<SharedPrefHelper>()
                                      //         .getStringByKey(
                                      //         ChadbotConstants
                                      //             .chadProfileImage,
                                      //         ChadbotConstants.defKomImage),
                                      //     false),
                                      SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),

                )
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //
                    //     Text('${message['message']}',
                    //         style: TextStyle(
                    //             color: Colors.black, fontSize: 16))
                    //   ],
                    // ),
                 // ),
             //   )
                    : ChatBubble(
                  clipper:
                  ChatBubbleClipper1(type: BubbleType.receiverBubble),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.grey[100],
                  child: Container(
                    constraints:
                    BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${message['SenderID']}',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 10)),
                        Text('${message['message']}',
                            style: TextStyle(
                                color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.80,
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      controller: _messageController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
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
                      icon: Icon(Icons.send, color: Colors.redAccent),
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
}


// class chatScreen extends StatefulWidget {
//   @override
//   chatScreenState createState() {
//     return chatScreenState();
//   }
// }
//
// class chatScreenState extends State<chatScreen> {
//   bool isAppodealInitialized = true;
//   bool isfirst = true;
//   final TextEditingController _textEditingController =
//   new TextEditingController();
//   ScreenshotController screenshotController = ScreenshotController();
//   final _controller = ScrollController();
//   IO.Socket socket;
//   final container = KiwiContainer();
//   List<Message> messageList = [];
//   String _image = "";
//   Message message;
//   final SharedPrefHelper _prefHelper =
//   KiwiContainer().resolve<SharedPrefHelper>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     connectToServer();
//   }
//
//   void getChatt() {
//     var userId;
//     var user2Id;
//     socket.emit('get_chat', {
//       userId: 4,
//       user2Id: 0,
//     });
//     socket.on('my_chat', (chat) =>
//     {
//       print('singham ${chat}')
//     });
//     //  setConversations(chat);
//
//   }
//
// //   const getChat = () => {
// // // socket.current.emit('get_chat', {
// // // userId : userId,
// // // user2Id : currentChat ? currentChat.id : '',
// // // });
//   void connectToServer() {
//     try {
//       socket = IO.io('http://18.191.199.31:80',
//           OptionBuilder().setTransports(['websocket']).build());
//
//       socket.onConnect((_) {
//         print('connect');
//         print('ddconnect');
//       });
//
//       var data = {
//         "userId": 29
//       };
//       socket.emit('connect_user', data);
//       print(data);
//       var streamSocket;
//       socket.on('connect_listener', (data) =>
//       {
//         getChatt()
//       });
// //getConversion
//     } catch (e) {
//       print(e.toString());
//     }
//
//     //   socket.emit(
//     //     'connect_user',
//     //     {'userId': 29},
//     //   );
//     //   socket.connect();
//   }
//
//
//   // Listen to Location updates of connected usersfrom server
//   handleLocationListen(Map<String, dynamic> data) async {
//     print(data);
//   }
//
//   // Send update of user's typing status
//
//   // Listen to update of typing status from connected users
//   void handleTyping(Map<String, dynamic> data) {
//     print(data);
//   }
//
//   // Send a Message to the server
//   // sendMessage(String message) {
//   //   socket.emit("message",
//   //     {
//   //       "id": socket.id,
//   //       "message": message, // Message to be sent
//   //       "timestamp": DateTime.now().millisecondsSinceEpoch,
//   //     },
//   //   );
//   // }
//
//   // Listen to all message events from connected users
//   void handleMessage(Map<String, dynamic> data) {
//     print(data);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => container.resolve<ChatBloc>(),
//       child: Screenshot(
//           controller: screenshotController,
//           child: Scaffold(
//             backgroundColor: Color(0XFFf9f9f9),
//             appBar: AppBar(
//               toolbarHeight: 190,
//               elevation: 0,
//               actions: <Widget>[
//                 Padding(
//                     padding: EdgeInsets.only(right: 10.0),
//                     child: GestureDetector(
//                         onTap: () async {
//                           //from path_provide package
//                           final directory =
//                           await getApplicationDocumentsDirectory();
//
//                           String fName =
//                               '${DateTime
//                               .now()
//                               .microsecondsSinceEpoch}.png';
//                           String path = directory.path;
//
//                           final savePath =
//                           await screenshotController.captureAndSave(
//                               path, //set path where screenshot will be saved
//                               fileName: fName,
//                               pixelRatio:
//                               MediaQuery
//                                   .of(context)
//                                   .devicePixelRatio);
//                           List<String> paths = [];
//                           paths.add(savePath);
//                           // await Share.shareFiles(paths);
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Icon(
//                               Icons.share,
//                               size: 20.0,
//                             ),
//                             // Text(
//                             //   "Share",
//                             //   style: ChadbotStyle.text.small,
//                             // ),
//                           ],
//                         ))),
//               ],
//               // Set this height
//               flexibleSpace: Container(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 30),
//                     BackArrowButton(),
//                     ProfileAvatar(
//                       imageUrl:
//                       ('assets/images/istockphoto-1179420343-612x612.jpg'),
//                       width: 60,
//                       avatarRadius: 60,
//                       Color: Colors.yellow,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'OSCAR',
//                       style: MaaruStyle.text.tiniest,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             body: SafeArea(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 0.5,
//                     child: Divider(
//                       color: Colors.grey[350],
//                     ),
//                   ),
//                   Container(),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Flexible(
//                     flex: 15,
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 10),
//                       child: BlocBuilder<ChatBloc, ChatState>(
//                         builder: (context, state) {
//                           if (state is ChatSendInitial) {
//                             BlocProvider.of<ChatBloc>(context)
//                                 .add(ChatOpened());
//                           }
//                           if (state is ChatSendInProgress) {
//                             if (messageList.length == 0) {
//                               messageList = state.messageList;
//                             }
//                             final typeMessage = Message(message: '', messageType: 3);
//                             messageList.add(typeMessage);
//                           }
//                           if (state is ChatSendSuccess) {
//                             messageList.removeWhere(
//                                     (element) => element.typeOfMsg == 3);
//                             messageList = state.messageList;
//                           }
//
//                           if (messageList.length > 2) {
//                             messageList.removeWhere(
//                                     (element) => element.typeOfMsg == 4);
//                             final sentMessage = Message(message: '', messageType: 4);
//                             messageList.add(sentMessage);
//                           }
//
//                           Future.delayed(Duration(milliseconds: 200), () {
//                             if (_controller != null) {
//                               if (isfirst) {
//                                 isfirst = false;
//                                 _controller.jumpTo(
//                                     _controller.position.maxScrollExtent);
//                               } else {
//                                 _controller.animateTo(
//                                     _controller.position.maxScrollExtent,
//                                     duration: Duration(seconds: 2),
//                                     curve: Curves.fastOutSlowIn);
//                               }
//                             }
//                           });
//
//                           return ListView.builder(
//                             controller: _controller,
//                             itemCount: messageList.length,
//                             itemBuilder: (BuildContext ctxt, int index) {
//                               Message message = messageList.elementAt(index);
//                               if (message.typeOfMsg == 1) {
//                                 return Container(
//                                   margin: EdgeInsets.only(top: 15),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         constraints: BoxConstraints(
//                                             maxWidth: MediaQuery
//                                                 .of(context)
//                                                 .size
//                                                 .width *
//                                                 0.70),
//                                         padding: EdgeInsets.all(10),
//                                         margin: EdgeInsets.only(right: 20),
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(
//                                               212, 234, 244, 1.0),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(15),
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15)),
//                                         ),
//                                         child: Text(
//                                           message.text,
//                                         //  style: ChadbotStyle.text.small,
//                                         ),
//                                       ),
//                                       // AvatarImage(
//                                       //     KiwiContainer()
//                                       //         .resolve<SharedPrefHelper>()
//                                       //         .getStringByKey(
//                                       //         ChadbotConstants
//                                       //             .chadProfileImage,
//                                       //         ChadbotConstants.defKomImage),
//                                       //     false),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               } else if (message.typeOfMsg == 2) {
//                                 return Container(
//                                   margin: EdgeInsets.only(top: 15),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       _image.isEmpty
//                                           ? AvatarImage(
//                                           "assets/images/chat_avatar.png",
//                                           false)
//                                           : AvatarImage(_image, true),
//                                       Container(
//                                         constraints: BoxConstraints(
//                                             maxWidth: MediaQuery
//                                                 .of(context)
//                                                 .size
//                                                 .width *
//                                                 0.70),
//                                         padding: EdgeInsets.all(10),
//                                         margin: EdgeInsets.only(left: 20),
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(
//                                               225, 255, 199, 1.0),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(15),
//                                               bottomRight: Radius.circular(15),
//                                               topRight: Radius.circular(15)),
//                                         ),
//                                         child: Text(message.text,
//                                            ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               } else if (message.typeOfMsg == 3) {
//                                 return Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Container(
//                                     margin: EdgeInsets.all(10),
//                                     width: 50,
//                                     height: 50,
//                                     child: JumpingDotsProgressIndicator(
//                                       fontSize: 20.0,
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 return SizedBox(
//                                   height: 55,
//                                 );
//                               }
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       decoration:
//                       BoxDecoration(color: Theme
//                           .of(context)
//                           .cardColor),
//                       child: _buildTextComposer(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
//
//   CupertinoButton getIOSSendButton() {
//     return CupertinoButton(
//       child: new Text("Send"),
//       onPressed: _onButtonPressed,
//     );
//   }
//
//   IconButton getDefaultSendButton() {
//     return IconButton(
//       icon: const Icon(Icons.send),
//       onPressed: _onButtonPressed,
//     );
//   }
//
//
//   void _onButtonPressed() {
//     _textEditingController.clear();
//   }
//
//   Widget _buildTextComposer() {
//     return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
//       return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             InkWell(
//                 onTap: () {
//                   showModalBottomSheet<void>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Container(
//                             height: 130,
//                             color: Colors.white,
//                             child: Column(children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     IconItem(
//                                       Icons.insert_drive_file,
//                                       Colors.indigo,
//                                       'Document',
//                                     ),
//                                     IconItem(Icons.camera_alt, Colors.pink,
//                                         'Camera'),
//                                     IconItem(Icons.insert_photo, Colors.purple,
//                                         'Gallery'),
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                                 builder: (_) => MapView()));
//                                       },
//                                       child: IconItem(Icons.location_pin,
//                                           Colors.yellow, 'Location'),
//                                     )
//                                   ])
//                             ]));
//                       });
//                 },
//                 child: Image.asset(
//                   'assets/icons/icone-setting-64.png',
//                   height: 40,
//                 )),
//             SizedBox(
//               width: 10,
//             ),
//             Flexible(
//               child: TextFormField(
//                 controller: _textEditingController,
//                 //  style: ChadbotStyle.text.small,
//                 onChanged: (String messageText) {},
//
//                 decoration:
//                 const InputDecoration.collapsed(hintText: "Send a message"),
//               ),
//             ),
//             Stack(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 40),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                     child: InkWell(
//                       child: Image.asset(
//                         'assets/icons/icone-setting-65.png',
//                         height: 60,
//                       ),
//                       onTap: () {
//                         if (_textEditingController.text.isEmpty) return;
//                         BlocProvider
//                             .of<ChatBloc>(context)
//                             .isFromException =
//                         false;
//
//                         BlocProvider.of<ChatBloc>(context)
//                             .add(ChatMessageSent(
//                             _textEditingController.text, 183, 184, 0));
//                         _textEditingController.clear();
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget IconItem(IconData icon, Color color, String text) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: color,
//           child: Icon(
//             icon,
//             size: 29,
//           ),
//         ),
//         Text(
//           text,
//           style: MaaruStyle.text.tiny,
//         ),
//       ],
//     );
//   }
//
//
// }
//
// class AvatarImage extends StatelessWidget {
//   final String imagepath;
//   final bool isfile;
//   AvatarImage(this.imagepath, this.isfile);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image: isfile
//                 ? FileImage(File(imagepath))
//                 : AssetImage(
//                     'assets/images/istockphoto-1179420343-612x612.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ));
//   }
// }
//
// class JumpingDot extends AnimatedWidget {
//   JumpingDot({Key key, Animation<double> animation})
//       : super(key: key, listenable: animation);
//
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Container(
//       height: animation.value,
//       child: Text('.'),
//     );
//   }
// }
