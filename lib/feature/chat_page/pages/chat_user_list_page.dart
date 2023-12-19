import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/feature/chat_page/provider/chat_provider.dart';
import 'package:nomad_hub/feature/chat_page/widget/conversation_user_list.dart';
import 'package:provider/provider.dart';

class ChatUserListPage extends StatefulWidget {
  const ChatUserListPage({super.key});
  @override
  State<ChatUserListPage> createState() => _ChatUserListPageState();
}

class _ChatUserListPageState extends State<ChatUserListPage> {

@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChatProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Conversations",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.pink,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: provider.chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationUserList(
                    name: provider.chatUsers[index].name,
                    messageText: provider.chatUsers[index].messageText,
                    imageUrl: provider.chatUsers[index].imageURL,
                    time: provider.chatUsers[index].time,
                    userID: provider.chatUsers[index].userID,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
