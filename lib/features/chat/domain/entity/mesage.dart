class Message {
  final String message;
  final int messageType;
  // final String userId;
  // final String user2Id;
  Message(this.message, this.messageType, );

  String get text => message;
  int get typeOfMsg => messageType;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'messageType': messageType,
     // 'userId':userId,
     // 'user2Id':user2Id
    };
  }

  @override
  String toString() {
    return 'Message{message: $message, type: $messageType}';
  }
}
