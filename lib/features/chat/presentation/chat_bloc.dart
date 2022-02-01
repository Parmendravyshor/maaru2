import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';

import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/features/chat/domain/usecases/get_text_file.dart';
import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  Socket _socket;
  List<Message> messageList = [];
  final SharedPrefHelper sharedPrefHelper;
  final EmailSignin emailSignin;
  final GetTextFile getTextFile;
  ChatBloc(this.sharedPrefHelper, this.emailSignin, this.getTextFile,
      [String address = 'http://18.191.199.31:80'])
      : super() {
    _socket = io(
      address,
      OptionBuilder()
          .setTransports(['websockets'])
          .disableAutoConnect()
          .enableAutoConnect()
          .disableReconnection()
          .build(),
    );
    try {
      _socket.on('connect', (_) {
        print('connect');
      });
      _socket.on('event', (data) => print(data));
      _socket.on('disconnect', (_) => print('disconnect'));
      _socket.on('fromServer', (_) => print(_));
      _socket.onConnect((data) => print('succes'));
      //add(OnlineConnectedEvent()));
      _socket.onConnectError((data) => print('sss1'));
      _socket.onConnectTimeout((data) => print('sss2'));
      _socket.onDisconnect((data) => print('sss3'));
      _socket.onError((data) => print('sss4'));
      _socket.on('joined', (data) => print('sss5'));
      print('pass');
    } catch (e) {
      print('kkk${e.toString()}');
    }
  }
  int tried = 0;
  bool isFromException = false;
  final SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatOpened) {
      var maps;
      messageList = List.generate(maps.length, (i) {
        return Message(
              message:maps[i]['message'],
              messageType: maps[i]['messageType'],
              senderId: maps[i]['senderId'],
              receiverId: maps[i]['receiverId']
        );});

      yield ChatSendSuccess(messageList);
    } else if (event is ChatMessageSent) {
      tried++;

      if (isFromException) {
        isFromException = false;
      } else {
        final sentMessage = Message(
          message :event.message,
          messageType: event.mesageType,
          senderId:4,
          receiverId: event.userid2,
        );
        messageList.add(sentMessage);
    //    _socket.emit('send_message',sentMessage);
        yield ChatSendInProgress(messageList);
      }

      DateTime expiryTime = DateTime.fromMillisecondsSinceEpoch(
          int.parse(sharedPrefHelper.getExpiryTime()) * 1000);

      if (expiryTime.isBefore(DateTime.now())) {
        await emailSignin(EmailAuthParams(
            email: sharedPrefHelper.getEmail(),
            password: '',
            first_name: "",
            lName: ""));
      }

      try {
        _socket.emit('get_message',{
          'userId':29
        });
            final receivedMessage = Message(
              receiverId: 4,
              senderId: 0,

            );
            messageList.add(receivedMessage);
        _socket.on('connect_listener', (Message) => {
         // getChatt()
        });
            yield ChatSendSuccess(messageList);
          } catch (e) {}

        print('result exception ${e.toString()}');
      }
    }

  @override
  // TODO: implement initialState
  ChatState get initialState => ChatSendInitial();
  }



// let data = {
//   "userId" : info.id
// };
// socket.current.emit('connect_user', data);
// socket.current.on("connect_listener",function(data){
//   getChat();
//   console.log(data, '============>data in connect_listener');
// });
// const getChat = () => {
// socket.current.emit('get_chat', {
// userId : userId,
// user2Id : currentChat ? currentChat.id : '',
// });
//
// socket.current.on("my_chat", (chat) => {
// if(chat){
// setConversations(chat);
// }
// });
// };
// const handleSubmit = async (e) => {
// e.preventDefault();
// //send_messages
// socket.current.emit('send_messages',  {
// userId : userId,
// user2Id : currentChat ? currentChat.id : '',
// message :newMessage,
// messageType :'0',
// });
// setNewMessage("");
// };