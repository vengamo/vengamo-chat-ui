import 'package:flutter/material.dart';
import '../seen_status.dart';
import 'bubble_text.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {
      super.key,
      required this.isMe,
      required this.message,
      required this.textColor,
      required this.ack,
      required this.time,
      required this.timeLabelColor
    });
  final bool isMe;
  final String message;
  final Color textColor;
  final Widget ack;
  final String time;
  final Color timeLabelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        runAlignment: WrapAlignment.end,
        alignment: WrapAlignment.end,
        spacing: 18,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 6.0),
            child: BubbleText(text: message, isMe: isMe, textColor: textColor),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: SeenStatus(
                isMe: isMe,
                time: time,
                dateTextColor: timeLabelColor,
                messageAck: ack),
          ),
        ],
      ),
    );
  }
}
