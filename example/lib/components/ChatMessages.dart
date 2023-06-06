import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vengamo_chat/components/chatBubble.dart';
import 'package:vengamo_chat/theme/AppColor.dart';
import '../models/message.dart';
import '../provider/MessageProvider.dart';

class ChatMessages extends StatelessWidget {
const ChatMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkModeBackgroundColor
                  : AppColors.backgroundColor,
              image: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : DecorationImage(
                      image: AssetImage('assets/images/bg_img.png'),
                      fit: BoxFit.none,
                      repeat: ImageRepeat.repeat),
              gradient: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      stops: [0.0, 0.45, 1.0],
                      colors: [
                        Color(0xfffce0ca),
                        Color(0xfff7f4e1),
                        Color(0xfffce0ca),
                      ],
                    ),
            ),
        child:
            Consumer<MessagesProvider>(builder: (context, messagesProvider, _) {
          List<Message> messages = messagesProvider.messages.reversed.toList();

          return ListView.builder(
            padding:
            const EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 30),
            shrinkWrap: true,
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {

              final message = messages[index];
              final isUserA = message.senderId == '550e8400-e29b-41d4-a716-446655440000';

              //check if the next message is from same user.
              final _isNextMessageFromSameSender =
                  index < messages.length - 1 &&
               messages[index + 1].senderId == messages[index].senderId;

              return ChatBubble(
                  text: message.text,
                  status: message.status,
                  isSender: isUserA,
                  bgColor: AppColors.white,
                  isNextMessageFromSameSender: _isNextMessageFromSameSender
                 );
            },
          );
        }));
  }
}
