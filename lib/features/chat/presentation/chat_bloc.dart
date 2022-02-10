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
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatBloc extends Bloc<ChatEvent, ChatState> {

  @override
  // TODO: implement initialState
  ChatState get initialState => ChatSendInitial();
  Socket _socket;
  final SharedPrefHelper sharedPrefHelper;
  final EmailSignin emailSignin;
  final GetTextFile getTextFile;


  Future<void> initSocket() async {
    print('Connecting to chat service' + 4.toString());
    // String registrationToken = await getFCMToken();
    _socket = IO.io('http://18.191.199.31:80', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'query': {
        'userName':'4',
        // 'registrationToken': registrationToken
      }
    });

    _socket.connect();
    _socket.onConnect((_) {
      print('connected to websocket');
    });
    var data = {"userId": 29};
    _socket.emit('connect_user', data);
    _socket.on("connect_listener", (message) {
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
  ChatBloc(this.sharedPrefHelper, this.emailSignin, this.getTextFile,
     )
      : super() ;


  List<MessagesModel> messageList;

  int tried = 0;
  bool isFromException = false;
  final SharedPrefHelper _prefHelper =
      KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatMessageSent) {
      yield ChatSendInProgress(MessagesModel.messages);
      var messagePost = {
        'userId': 4,
        'user2Id': 29,
        'SenderID': 4,
        'message': '',
        'messageType': '0'
      };
      _socket.emit('send_messages', messagePost);

      _socket.on('send_new_message', (message) {
        print('send_new_message>>>>>>' + message.toString());

        {
          MessagesModel.messages.add(message);
        }
      });
      yield ChatSendSuccess(MessagesModel.messages);
    } else if (event is ChatOpened) {
      _socket.emit('get_chat', {
        'userId': 4,
        'user2Id': 29,

      });
   _socket.on(
          "my_chat",
              (messages) =>
          {
            MessagesModel.messages.clear(),
            MessagesModel.messages.addAll(messages)
          });
      yield ChatGet(messageList);
    }
  }
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
