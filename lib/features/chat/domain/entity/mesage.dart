// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
class MessagesModel {
  static final List<dynamic> messages = [];

  static updateMessages(dynamic message) async {
    messages.add(message);
  }
}

List<Message> welcomeFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));
String welcomeToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Message {
  Message({
    this.id,
    this.senderId,
    this.receiverId,
    this.chatConstantId,
    this.groupId,
    this.message,
    this.readStatus,
    this.messageType,
    this.deletedId,
    this.created,
    this.updated,
    this.recieverName,
    this.image,
    this.senderName,
    this.senderImage,
  });
  int id;
  int senderId;
  int receiverId;
  int chatConstantId;
  int groupId;
  String message;
  int readStatus;
  int messageType;
  int deletedId;
  int created;
  int updated;
  String recieverName;
  String image;
  String senderName;
  String senderImage;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    chatConstantId: json["chatConstantId"],
    groupId: json["groupId"],
    message: json["message"],
    readStatus: json["readStatus"],
    messageType: json["messageType"],
    deletedId: json["deletedId"],
    created: json["created"],
    updated: json["updated"],
    recieverName: json["recieverName"],
    image: json["image"],
    senderName: json["senderName"],
    senderImage: json["senderImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "senderId": senderId,
    "receiverId": receiverId,
    "chatConstantId": chatConstantId,
    "groupId": groupId,
    "message": message,
    "readStatus": readStatus,
    "messageType": messageType,
    "deletedId": deletedId,
    "created": created,
    "updated": updated,
    "recieverName": recieverName,
    "image": image,
    "senderName": senderName,
    "senderImage": senderImage,
  };
  String get text => message;
  int get typeOfMsg => messageType;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'type': messageType,
    };
  }

  @override
  String toString() {
    return 'Message{message: $message, type: $messageType}';
  }
}


class MessagesModel1 {
  static final List<dynamic> messages = [];

  static updateMessages(dynamic message) async {
    messages.add(message);
  }
}

class Chat1 extends StatefulWidget {
  final String user;

  const Chat1({Key key, this.user}) : super(key: key);

  @override
  Chat1State createState() => Chat1State();
}

class Chat1State extends State<Chat1> {
  TextEditingController _messageController;
  ScrollController _controller;
  IO.Socket socket;

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    _messageController.text = '';
    print(messageText);
    if (messageText != '') {
      var messagePost = {
        'senderId': '4',
        'receiverId': '',
        'messageType': '0',
        "message":"hello",
      };
      socket.emit('new_message', messagePost);
    }
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _controller = ScrollController();
    initSocket();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      _controller.animateTo(
        0.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      )
    });
  }

  Future<void> initSocket() async {
    socket = IO.io('http://18.191.199.31:80',
        OptionBuilder().setTransports(['websocket']).build());

    socket.onConnect((_) {
      print('connect');
      print('ddconnect');
    });

    var data = {
      "userId" : 29
    };
    socket.emit('connect_user',data);
    print(data);
    socket.on('newChat', (message) {
      print(message);
      setState(() {
        MessagesModel.messages.add(message);
      });
    });
    socket.on('allChats', (messages) {
      print(messages);
      setState(() {
        MessagesModel.messages.addAll(messages);
      });
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
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.60,
              child: Container(
                child: Text(
                  'Chat',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
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
                var message = MessagesModel.messages[MessagesModel.messages.length - index - 1];
                return (message['sender'] == widget.user)
                    ? ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.yellow[100],
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('@${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))
                      ],
                    ),
                  ),
                )
                    : ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  backGroundColor: Colors.grey[100],
                  child: Container(
                    constraints: BoxConstraints(maxWidth: size.width * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${message['sender']} @${message['time']}', style: TextStyle(color: Colors.grey, fontSize: 10)),
                        Text('${message['message']}', style: TextStyle(color: Colors.black, fontSize: 16))
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
                        labelStyle: TextStyle(fontSize: 15, color: Colors.black),
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
