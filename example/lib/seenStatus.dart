import 'package:flutter/material.dart';
import 'messageStatus.dart';

class SeenStatus extends StatelessWidget {
  final bool isMe;
  final String status;
  final DateTime timestamp;
  final Color dateTextColor;

  const SeenStatus(
      {required this.status,
      required this.isMe,
      required this.timestamp,
      required this.dateTextColor});

  String getTime() {
    int hour = timestamp.hour;
    int min = timestamp.minute;
    String hRes = hour <= 9 ? '0$hour' : hour.toString();
    String mRes = min <= 9 ? '0$min' : min.toString();
    return '$hRes:$mRes';
  }

  Widget _buildStatus(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: Text(
            getTime(),
            style: TextStyle(
                fontSize: 12,
                color: isMe ? Colors.black.withOpacity(0.6) : dateTextColor),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        if (status == "sent" && isMe)
         MessageStatus(status: "sent", height: 12, width: 12, paddingTop: 1.8),
        if (status == "delivered" && isMe)
          MessageStatus(status: "delivered", height: 12, width: 12, paddingTop: 1.8),

        if (status == "seen" && isMe)
          MessageStatus(status: "seen", height: 12, width: 12, paddingTop: 1.8),
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
