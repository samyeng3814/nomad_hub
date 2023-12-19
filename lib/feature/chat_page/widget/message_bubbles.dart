import 'package:flutter/material.dart';
import 'package:nomad_hub/core/components/custom_text_widget.dart';
import 'package:nomad_hub/core/utils/app_sizedbox.dart';
import 'package:nomad_hub/feature/chat_page/widget/msg_bubble_background.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    this.sender,
    this.text,
    this.isMe,
  });

  final String? sender;
  final String? text;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    final messageAlignment = isMe! ? Alignment.topRight : Alignment.topLeft;
    return FractionallySizedBox(
      alignment: messageAlignment,
      widthFactor: 0.8,
      child: Align(
        alignment: messageAlignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: Column(
            crossAxisAlignment:
                isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              CustomText(
                text: sender!,
                fontSize: 8.0,
                color: Colors.black54,
              ),
              AppSizedBox.h4,
              ClipRRect(
                borderRadius: isMe!
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))
                    : const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                child: BubbleBackground(
                  colors: [
                    if (isMe!) ...const [
                      Color.fromARGB(255, 139, 195, 240),
                      Color(0XFF1A4CfB),
                      // Color(0xFF1976D2),
                    ] else ...[
                      Colors.grey.shade100,
                      const Color.fromARGB(255, 203, 202, 202),
                    ],
                  ],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    child: CustomText(
                      text: text!,
                      color: isMe! ? Colors.white : Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Column(
    //     crossAxisAlignment:
    //         isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Text(
    //         sender!,
    //         style: const TextStyle(
    //           fontSize: 12.0,
    //           color: Colors.black54,
    //         ),
    //       ),
    //       Material(
    // borderRadius: isMe!
    //     ? const BorderRadius.only(
    //         topLeft: Radius.circular(30.0),
    //         bottomLeft: Radius.circular(30.0),
    //         bottomRight: Radius.circular(30.0))
    //     : const BorderRadius.only(
    //         bottomLeft: Radius.circular(30.0),
    //         bottomRight: Radius.circular(30.0),
    //         topRight: Radius.circular(30.0),
    //       ),
    //         elevation: 5.0,
    //         color: isMe! ? Colors.lightBlueAccent : Colors.white,
    //         child: Padding(
    //           padding:
    //               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    //           child: Text(
    //             text!,
    //             style: TextStyle(
    //               color: isMe! ? Colors.white : Colors.black54,
    //               fontSize: 15.0,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
