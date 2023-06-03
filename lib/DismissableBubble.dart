import 'package:flutter/material.dart';

class DismssibleBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final Widget child;
  const DismssibleBubble({
    required this.isMe,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(      
      direction: isMe
          ? DismissDirection.endToStart
          : DismissDirection.startToEnd,
      onDismissed: (direction) {},
      key: UniqueKey(),
      confirmDismiss: (_) async {                      
        final f = Future.delayed(Duration.zero).then((value) {
          print(message);
          return false;
        });
        return await f;
      },
      background: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Wrap(
          children: [
            if(!isMe)
            SizedBox(width: 20),
            FittedBox(
                child: Icon(
              Icons.reply,
              color: Colors.white.withOpacity(0.87),
            )),
            if(isMe)
            SizedBox(width: 20),
          ],
        ),
      ),
      child: child,
    );
  }
}