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
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import  'chat_event.dart';
import 'chat_state.dart';
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  Socket _socket;
  List<Message> messageList = [];
  final SharedPrefHelper sharedPrefHelper;
  final EmailSignin emailSignin;
  final GetTextFile getTextFile;
  ChatBloc(this.sharedPrefHelper, this.emailSignin, this.getTextFile,[String address = 'http://18.191.199.31:80'])
      : super() {

      IO.Socket socket = IO.io(address, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });

// Dart client
      socket.on('connect', (_) {
        print('connect');
      });
      socket.on('event', (data) => print(data));
      socket.on('disconnect', (_) => print('disconnect'));
      socket.on('fromServer', (_) => print(_));

      print(e);

  }
  int tried = 0;
  bool isFromException = false;
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatOpened) {

      var maps;
      messageList = List.generate(maps.length, (i) {
        return Message(
          maps[i]['message'],
          maps[i]['type'],
        );
      });

      yield ChatSendSuccess(messageList);
    } else if (event is ChatMessageSent) {
      tried++;

      if (isFromException) {
        isFromException = false;
      } else {
        final sentMessage = Message(event.message, 1);
        messageList.add(sentMessage);
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
       final response =
       await getData(event.message, _prefHelper.getStringByKey(MaruConstant.token, "",));
       if (response.statusCode == 200) {
          try {
            var jsonResponse = convert.jsonDecode(response.body);
            var body = convert.jsonDecode(jsonResponse['body']);
            var message = body['Answer'];
            final receivedMessage = Message(message, 2);
            messageList.add(receivedMessage);


            yield ChatSendSuccess(messageList);
          } catch (e) {}
        } else {
          if (tried % 3 != 0) {
            isFromException = true;
            add(event);
          }
        }
      } catch (e) {
        print('result exception ${e.toString()}');
      }
    }
  }

  @override
  // TODO: implement initialState
  ChatState get initialState =>ChatSendInitial() ;
}
SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
Future<http.Response> getData(String question, String jwtToken) {
  final token = _prefHelper.getStringByKey(MaruConstant.token, "",);

  var headers = {
    "access-token": token
  };
  return http
      .get(
    Uri.parse('http://18.191.199.31/api/chat/get-chats/5'),
    headers: headers
    // body: jsonEncode(
    //     <String, String>{"utterance": question, "jwttoken": jwtToken}),
  )
      .timeout(Duration(seconds: 30), onTimeout: () {
    throw TimeoutException("timeout occurred");
  });
}
