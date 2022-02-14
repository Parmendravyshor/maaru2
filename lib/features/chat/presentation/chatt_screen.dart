import 'dart:convert';
import 'dart:io';
<<<<<<< HEAD
=======
import 'dart:ui';
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/features/chat/domain/entity/mesage.dart';
import 'package:maru/main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
  File imageFile;

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
        'user2Id': 73,
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

  String _image = "";
  String file = '';
  final picker = ImagePicker();
  int popTime = 0;
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    if (pickedFile != null) {
      _image = pickedFile.path;
      await _prefHelper.saveString(MaruConstant.img, _image);
      setState(() {});
    } else {
      AlertManager.showErrorMessage("Failed to load image", context);
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
    var data = {"userId": 73};
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
      'user2Id': 73,
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

  void onImageSend(String path, String message) async {
    for (int i = 0; i < popTime; i++) {
      Navigator.pop(context);
    }

    setState(() {
      popTime = 0;
    });
    print('dddddd$path');

//     var request = http.MultipartRequest('POST',Uri.parse('http://18.191.199.31:80/routes/addimage'),
//
//     );
// request.files.add(await http.MultipartFile.fromPath('img', path));
// request.headers.addAll({
//   'Content-Type': 'json/application'
// });
//     http.StreamedResponse response = await request.send();
//     var httpResponse = await http.Response.fromStream(response);
//     var data = json.decode(httpResponse.body);
//     print(data['path']);

    // var messagePost = {
    //   'userId': 4,
    //   'user2Id': 73,
    //   'SenderID': 4,
    //   'message': message,
    //   'messageType': path
    // };
    // socket.emit('send_messages', messagePost);
    //
    // socket.on('send_new_message', (message) {
    //   print('send_new_message>>>>>>' + message.toString());
    //   setState(() {
    //     if (mounted) {
    //       MessagesModel.messages.add(message);
    //     }
    //   });
    // });
    // Navigator.pop(context);
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
<<<<<<< HEAD
              SizedBox(height: 30),
              BackArrowButton(),
              Container(
                height: 75,
                padding: const EdgeInsets.only(right: 20),
=======
              SizedBox(height: size.height * 0.03),
              BackArrowButton(),
              Container(
                height: size.height * 0.08,
                padding: const EdgeInsets.only(right: 0),
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
<<<<<<< HEAD

                ),
                child:   Image.asset('assets/128/AlanPost.png'),
              ),

              SizedBox(
                height: 20,
=======
                ),
                child: Image.asset('assets/128/AlanPost.png'),
              ),
              SizedBox(
                height: size.height * 0.02,
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
              ),
              Text(
                'Ram',
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
<<<<<<< HEAD
                    ?
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration:  BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: _prefHelper.getStringByKey('img', '').isEmpty
                                        ? const ExactAssetImage(
                                        'assets/128/AlanPost.png')
                                        : FileImage(File(_prefHelper.getStringByKey('img', ''))),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15,),
                              ChatBubble(
                                  clipper:
                                      ChatBubbleClipper1(type: BubbleType.sendBubble),
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  backGroundColor: Colors.yellow[100],
                                  child:
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: size.width * 0.7),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text('${message['message']}',
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 16))
                                          ],
                                        ),

                                  ),
                                ),
                            ],
                          ),
                        )


                    : Row(
                      children: [
                        ChatBubble(
                            clipper:
                                ChatBubbleClipper1(type: BubbleType.receiverBubble),
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            backGroundColor: Colors.white,
                            child:
                                Container(
                                  constraints:
                                      BoxConstraints(maxWidth: size.width * 0.7),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${message['SenderID']}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 10)),
                                      Text('${message['message']}',
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 16))
                                    ],
                                  ),

                            ),
                          ),
                        Image.asset('assets/128/CrystalGaskell.png',height: 50,width: 50,),
                      ],
                    );
=======
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: Row(
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
                                      : FileImage(File(_prefHelper
                                          .getStringByKey('img', ''))),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Container(
                                decoration: BoxDecoration(
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
                                    Text('${message['message']}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: MaaruColors.buttonColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      bottomLeft: Radius.circular(7),
                                      bottomRight: Radius.circular(7))),
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('${message['SenderID']}',
                                  //     style: const TextStyle(
                                  //         color: Colors.grey, fontSize: 10)),
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
                          Image.asset(
                            'assets/128/CrystalGaskell.png',
                            height: 50,
                            width: 50,
                          ),
                        ],
                      );
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
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
                                          InkWell(
                                            onTap: () async {
                                              setState(() {
                                                popTime = 2;
                                              });
                                              final pickedFile =
                                                  await picker.getImage(
                                                      source:
                                                          ImageSource.gallery,
                                                      maxHeight: 200,
                                                      maxWidth: 200);
//                                                 if (pickedFile != null) {
//                                                   _image = pickedFile.path;
//                                                   await _prefHelper.saveString(
//                                                       MaruConstant.img, _image);
//                                                   setState(() {
//                                                     MaterialPageRoute(
//                                                         builder: (_) =>
//                                                             CameraViewPage(
//                                                               path: pickedFile.path,
//                                                               onImageSend: onImageSend,
//                                                             ));
//                                                   });
//
//                                                   setState(() {});
//                                                 } else {
//                                                   AlertManager.showErrorMessage(
//                                                       "Failed to load image",
//                                                       context);
//                                                 }
                                              print('dddd');

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          CameraViewPage(
                                                            path:
                                                                pickedFile.path,
                                                            onImageSend:
                                                                onImageSend,
                                                          )));
                                              print(pickedFile.path);
                                              print('ffhfjhfhf');
                                            },
                                            child: IconItem(Icons.insert_photo,
                                                Colors.purple, 'Gallery'),
                                          ),
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

class CameraViewPage extends StatefulWidget {
  const CameraViewPage({Key key, this.path, this.onImageSend})
      : super(key: key);
  final String path;
  final Function onImageSend;
  static TextEditingController _controller = TextEditingController();

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(widget.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            widget.onImageSend(widget.path);
                            CameraViewPage._controller.text.trim();
                          });
                        },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                  controller: CameraViewPage._controller,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// List<CameraDescription> cameras;
//
// class CameraScreen extends StatefulWidget {
//   CameraScreen({Key key}) : super(key: key);
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   CameraController _cameraController;
//   Future<void> cameraValue;
//   bool isRecoring = false;
//   bool flash = false;
//   bool iscamerafront = true;
//   double transform = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _cameraController = CameraController(cameras[0], ResolutionPreset.high);
//     cameraValue = _cameraController.initialize();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _cameraController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//               future: cameraValue,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       child: CameraPreview(_cameraController));
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               }),
//           Positioned(
//             bottom: 0.0,
//             child: Container(
//               color: Colors.black,
//               padding: EdgeInsets.only(top: 5, bottom: 5),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                           icon: Icon(
//                             flash ? Icons.flash_on : Icons.flash_off,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               flash = !flash;
//                             });
//                             flash
//                                 ? _cameraController
//                                 .setFlashMode(FlashMode.torch)
//                                 : _cameraController.setFlashMode(FlashMode.off);
//                           }),
//                       GestureDetector(
//                         onLongPress: () async {
//                           await _cameraController.startVideoRecording();
//                           setState(() {
//                             isRecoring = true;
//                           });
//                         },
//                         onLongPressUp: () async {
//                           XFile videopath =
//                           await _cameraController.stopVideoRecording();
//                           setState(() {
//                             isRecoring = false;
//                           });
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (builder) => VideoViewPage(
//                                     path: videopath.path,
//                                   )));
//                         },
//                         onTap: () {
//                           if (!isRecoring) takePhoto(context);
//                         },
//                         child: isRecoring
//                             ? Icon(
//                           Icons.radio_button_on,
//                           color: Colors.red,
//                           size: 80,
//                         )
//                             : Icon(
//                           Icons.panorama_fish_eye,
//                           color: Colors.white,
//                           size: 70,
//                         ),
//                       ),
//                       IconButton(
//                           icon: Transform.rotate(
//                             angle: transform,
//                             child: Icon(
//                               Icons.flip_camera_ios,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               iscamerafront = !iscamerafront;
//                               transform = transform + pi;
//                             });
//                             int cameraPos = iscamerafront ? 0 : 1;
//                             _cameraController = CameraController(
//                                 cameras[cameraPos], ResolutionPreset.high);
//                             cameraValue = _cameraController.initialize();
//                           }),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     "Hold for Video, tap for photo",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void takePhoto(BuildContext context) async {
//     XFile file = await _cameraController.takePicture();
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (builder) => CameraViewPage(
//               path: file.path,
//             )));
//   }
// }
