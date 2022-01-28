/// Events class for Chat screen
abstract class ChatEvent {
  ChatEvent();
}

/// Chat Opened
///
/// This event is fired when Chat is opened
class ChatOpened extends ChatEvent {
  ChatOpened();

  @override
  String toString() => "ChatOpened";
}

/// Chat Opened
///
/// This event is fired when Chat is opened
class ChatMessageSent extends ChatEvent {
  final String message;
   final int userid;
   final int userid2;
   final int mesageType;
  ChatMessageSent(this.message, this.userid, this.userid2, this.mesageType,);

  @override
  String toString() => "ChatMessageSent";
}
class OnlineConnectingEvent extends ChatEvent{
  OnlineConnectingEvent();
  @override
  String toString() => "OnlineConnectingEvent";
}
class OnlineConnectedEvent extends ChatEvent{
  OnlineConnectedEvent();
  @override
  String toString() => "OnlineConnectedEvent";
}
class OnlineConnectErrorEvent extends ChatEvent{
  final String error;
  OnlineConnectErrorEvent(this.error);
  @override
  String toString() => "OnlineConnectErrorEvent";
}
class OnlineConnectTimeoutEvent extends ChatEvent{
  final String error;

  OnlineConnectTimeoutEvent(this.error);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
class OnlineDisconnectEvent extends ChatEvent{
  final String error;

  OnlineDisconnectEvent(this.error);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
class OnlineErrorEvent extends ChatEvent{
  final String error;

  OnlineErrorEvent(this.error);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

}
class OnlineJoinedEvent extends ChatEvent{
  final String error;

  OnlineJoinedEvent(this.error);
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

}