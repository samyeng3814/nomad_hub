import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:provider/provider.dart';

import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';
import 'package:nomad_hub/feature/chat_page/widget/message_stream.dart';


class ChartPage extends StatefulWidget {
  final String name;
  final String userID;
  final String userImg;
  const ChartPage({
    super.key,
    required this.name,
    required this.userID,
    required this.userImg,
  });

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  TextEditingController messageTextController = TextEditingController();
  String messageText = "";
  FocusNode msgFocusNode = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatProvider>().connect();
  }

  @override
  void dispose() {
    Provider.of<ChatProvider>(context).channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding:const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.arrow_back,color: Colors.black,),
                ),
               AppSizedBox.w4,
                CircleAvatar(
                  backgroundImage: AssetImage(widget.userImg),
                  maxRadius: 24,
                ),
               AppSizedBox.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: widget.name, fontSize: 14, fontWeight: FontWeight.w600,),
                     AppSizedBox.h4,
                     CustomText(text: "Online", color: Colors.grey.shade600, fontSize: 12,),
                    ],
                  ),
                ),
               const Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: MessagesStream(
                channel: provider.channel,
                name: widget.name,
                userID: widget.userID,
                streamController: provider.streamController,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // decoration: const BoxDecoration(
                //   border: Border(
                //     top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                //   ),
                // ),
                height: 48,
                margin: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        focusNode: msgFocusNode,
                        autofocus: true,
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                       
                        },
                        onSubmitted: (value) {
                          String msg = messageTextController.text;
                          if (msg.isNotEmpty) {
                            provider.sendMsg(msg, widget.name, provider.userID);
                            messageTextController.clear();
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter a value',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                    ),
                    AppSizedBox.w12,
                    FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        String msg = messageTextController.text;
                        if (msg.isNotEmpty) {
                          provider.sendMsg(msg, widget.name,provider.userID);
                          messageTextController.clear();
                        }
                      },
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
