import 'package:flutter/material.dart';

class SeenStatus extends StatelessWidget {
  ///check if message is from me or the other user
  final bool isMe;
  ///Message time
  final String time;
  ///Time label color
  final Color dateTextColor;
  ///Message status(sent, delivered and seen)
  final Widget messageAck;
 
  const SeenStatus(
      {
      super.key, 
      required this.time,
      required this.isMe,
      required this.dateTextColor,
      required this.messageAck
   });

  Widget _buildStatus(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Text(
            time,
            style: TextStyle(
                fontSize: 12,
                color: dateTextColor
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        if (isMe)
         messageAck
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: _buildStatus(context),
    );
  }
}
