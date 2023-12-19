import 'package:flutter/material.dart';

import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/navigation/navigation.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';

import 'package:nomad_hub/feature/chat_page/pages/user_chat_page.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ConversationUserList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  String userID;
  ConversationUserList({
    super.key,
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
    required this.userID,
  });
  @override
  State<ConversationUserList> createState() => _ConversationUserListState();
}

class _ConversationUserListState extends State<ConversationUserList> {
   @override
  Widget build(BuildContext context) {
  var provider = Provider.of<ChatProvider>(context); 

    return InkWell(
      onTap: () {
       pushContext(context, route:  ChartPage(name: widget.name,userID:provider.userID, userImg: widget.imageUrl) , );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 26,
                  ),
                  AppSizedBox.w16,
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(
                            text: widget.name,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          AppSizedBox.h6,
                          CustomText(
                              text: widget.messageText,
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              fontWeight: widget.isMessageRead
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
                text: widget.time,
                fontSize: 12,
                fontWeight:
                    widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
          ],
        ),
      ),
    );
  }
}
