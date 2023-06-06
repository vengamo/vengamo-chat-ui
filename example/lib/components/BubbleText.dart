import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BubbleText extends StatelessWidget {
  
  BubbleText({
    required this.text,
    required this.isMe,
    required this.textColor
  });

  final String text;
  bool isMe;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SelectableText(
        text,
        style: GoogleFonts.roboto(color: isMe ? Colors.black.withOpacity(0.87) : textColor, fontSize: 15),
      ),
    );
  }
}