import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:nomad_hub/core/utils/userid_generator.dart';
import 'package:nomad_hub/feature/chat_page/widget/message_bubbles.dart';
import 'package:nomad_hub/feature/chat_page/chat_model/chat_user_model.dart';
import 'package:nomad_hub/feature/chat_page/chat_model/message_model.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatUsers> chatUsers = [
    ChatUsers(
      name: "Jane Russel",
      messageText: "Awesome Setup",
      imageURL: "assets/images/avartar_image.jpg",
      time: "Now",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Glady's Murphy",
      messageText: "That's Great",
      imageURL: "assets/images/avartar_image.jpg",
      time: "Yesterday",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Jorge Henry",
      messageText: "Hey where are you?",
      imageURL: "assets/images/avartar_image.jpg",
      time: "31 Nav",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Philip Fox",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "assets/images/avartar_image.jpg",
      time: "28 Oct",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Debra Hawkins",
      messageText: "Thankyou, It's awesome",
      imageURL: "assets/images/avartar_image.jpg",
      time: "23 Oct",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Jacob Pena",
      messageText: "will update you in evening",
      imageURL: "assets/images/avartar_image.jpg",
      time: "17 Nav",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "Andrey Jones",
      messageText: "Can you please share the file?",
      imageURL: "assets/images/avartar_image.jpg",
      time: "24 Nav",
      userID: getUserIDGenerator(),
    ),
    ChatUsers(
      name: "John Wick",
      messageText: "How are you?",
      imageURL: "assets/images/avartar_image.jpg",
      time: "18 Nav",
      userID: getUserIDGenerator(),
    ),
  ];

  List listMsg = [];
  List<MessageBubble> messageBubbles = [];
  String? token;
  String messageText = "";
  FocusNode msgFocusNode = FocusNode();
  var channel;
  StreamController streamController = StreamController.broadcast(
    sync: true,
  );
  bool _reconnecting = false;
  late WebSocketChannel webSocket;
  String connectionStatus = '';
final String _userID =getUserIDGenerator();

String get userID => _userID;

  connect() {
    if (!_reconnecting) {
      _reconnecting = true;
      channel = kIsWeb
          ? WebSocketChannel.connect(
              Uri.parse(
                  'ws://192.168.1.143:3000?fcmToken=$token&groupId=GroupChat'),
            )
          : IOWebSocketChannel.connect(
              'ws://192.168.1.143:3000?fcmToken=$token&groupId=GroupChat',
            );

      channel.stream.listen(
        (event) {
          streamController.add(event);
        },
        onDone: () async {
          _reconnecting = true;
          // notificationSnackbar(_scaffoldKey.currentContext,
          //     "You got disconnected\n\nTry after sometimes");
          await _delayedReconnect();
        },
        onError: (error) async {
          debugPrint("Error in websocket connection: + $error");
          await _delayedReconnect();
        },
        cancelOnError: true,
      );
    }
  }

  Future<void> _delayedReconnect() async {
    await Future.delayed(const Duration(seconds: 4));
    // _reconnecting = false;
    // connect();
  }

  void sendMsg(String msg, String senderName, String userID) {
    MessageModel msgModel = MessageModel(
      message: msg,
      type: "sendNewMessage",
      sendName: senderName,
      userID: userID,
    );

    Map<String, dynamic> websocketMessage = {
      "type": msgModel.type,
      "msg": msgModel.message,
      "senderName": msgModel.sendName,
      "userID": msgModel.userID,
    };
    listMsg.add(jsonEncode(websocketMessage));

    final jsonWebSocketMsg = jsonEncode(websocketMessage);

    channel.sink.add(jsonWebSocketMsg);
  }

  // void startTyping(String senderName) {
  //   MessageModel msgModel = MessageModel(
  //     message: "",
  //     type: "typing",
  //     sendName: senderName,
  //     userID: guidGenerator(),
  //   );

  //   Map<String, dynamic> websocketMessage = {
  //     "type": msgModel.type,
  //     "msg": msgModel.message,
  //     "senderName": msgModel.sendName,
  //     "userID": msgModel.userID,
  //     "isTyping": true,
  //   };

  //   channel.sink.add(websocketMessage);
  // }

  // void stopTyping(String senderName) {
  //   MessageModel msgModel = MessageModel(
  //     message: "",
  //     type: "typing",
  //     sendName: senderName,
  //     userID: guidGenerator(),
  //   );

  //   Map<String, dynamic> websocketMessage = {
  //     "type": msgModel.type,
  //     "msg": msgModel.message,
  //     "senderName": msgModel.sendName,
  //     "userID": msgModel.userID,
  //     "isTyping": false,
  //   };
  //   channel.sink.add(websocketMessage);
  // }
}
