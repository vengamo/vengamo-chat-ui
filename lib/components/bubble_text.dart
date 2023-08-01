import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({
    Key? key,
    required this.text,
    required this.isMe,
    required this.textColor,
  }) : super(key: key);
 
  ///Message
  final String text;
  ///check if message is from me or the other user
  final bool isMe;
  ///Text color
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SelectableText(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 15),
      ),
    );
  }
}
