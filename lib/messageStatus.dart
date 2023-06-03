import 'package:flutter/material.dart';

class MessageStatus extends StatelessWidget {
MessageStatus({super.key, required this.status, required this.height, required this.width, required this.paddingTop});

final String status;
final double height;
final double width;
final double paddingTop;

  @override
  Widget build(BuildContext context) {
    // Assume that the `status` variable has been initialized somewhere
    switch (status) {
      case 'sent':
        return Padding(
          padding: EdgeInsets.only(top: paddingTop == 0 ? 0 : 1.8),
          child: Image.asset(
            'assets/images/sent.png',
            height: height,
            width: width,
          ),
        );
      case 'delivered':
        return Padding(
          padding: EdgeInsets.only(top: paddingTop == 0 ? 0 : 1.8),
          child: Image.asset(
            'assets/images/delivered.png',
            height: height,
            width: width,
          ),
        );
      case 'seen':
        return Padding(
          padding: EdgeInsets.only(top: paddingTop == 0 ? 0 : 1.8),
          child: Image.asset(
            'assets/images/seen.png',
            height: height,
            width: width,
          ),
        );
      default:
       return const SizedBox();
    }
  }
}