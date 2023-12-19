class MessageModel {
  String type;
  String message;
  String sendName;
  String userID;
  bool? isTyping;
  MessageModel(
      {required this.message,
      required this.type,
      required this.sendName,
      required this.userID,
       this.isTyping,});
}