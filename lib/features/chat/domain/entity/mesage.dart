// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

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
}
