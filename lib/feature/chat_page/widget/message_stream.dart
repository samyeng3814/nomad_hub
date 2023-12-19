
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';
import 'package:nomad_hub/feature/chat_page/widget/message_bubbles.dart';

class MessagesStream extends StatefulWidget {
  final WebSocketChannel channel;
  final StreamController streamController;
  final String name;
  final String userID;
  const MessagesStream({
    super.key,
    required this.channel,
    required this.name,
    required this.userID,
    required this.streamController,
  });

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  late ScrollController _scrollController;

  bool? isWebsocketActive;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);

    return StreamBuilder(
      stream: widget.streamController.stream,
      builder: (context, snapshot) {
        isWebsocketActive = false;
        if (!snapshot.hasData || snapshot.data == null) {
          if (provider.messageBubbles.isEmpty) {
            return const Center(
              child: Text("You can chat"),
            );
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          });
          return ListView.builder(
            controller: _scrollController,
            reverse: false,
            shrinkWrap: true,
            physics: const RangeMaintainingScrollPhysics(),
            itemCount: provider.messageBubbles.length,
            itemBuilder: (context, index) {
              return Container(
                child: provider.messageBubbles[index],
              );
            },
          );
        } else if (snapshot.hasData && snapshot.data is! String) {
          String msgJson = utf8.decode(snapshot.data);
          final Map<String, dynamic> messageData = json.decode(msgJson);
          final String messageText = messageData["msg"];
          final String messageSender = messageData["senderName"];
          final String messageUserID = messageData["userID"];

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: widget.userID == messageUserID,
          );

          provider.messageBubbles.add(messageBubble);

          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController.jumpTo(
              _scrollController.position.maxScrollExtent,
            );
          });

          return ListView.builder(
            controller: _scrollController,
            reverse: false,
            shrinkWrap: true,
            physics: const RangeMaintainingScrollPhysics(),
            itemCount: provider.messageBubbles.length,
            itemBuilder: (context, index) {
              return Container(
                child: provider.messageBubbles[index],
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
