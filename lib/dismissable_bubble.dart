import 'package:flutter/material.dart';

class DismssibleBubble extends StatelessWidget {
  ///if message is from me
  final bool isMe;
  ///Text message
  final String message;
  ///widget, chat bubble
  final Widget child;

  const DismssibleBubble({
    super.key, 
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
          return false;
        });
        return await f;
      },
      background: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Wrap(
          children: [
            if(!isMe)
            const SizedBox(width: 20),
            FittedBox(
                child: Icon(
              Icons.reply,
              color: Colors.white.withOpacity(0.87),
            )),
            if(isMe)
            const SizedBox(width: 20),
          ],
        ),
      ),
      child: child,
    );
  }
}