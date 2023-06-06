import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vengamo_chat/models/message.dart';
import 'package:vengamo_chat/theme/AppColor.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../provider/MessageProvider.dart';
import '../provider/sendButtonProvider.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final messageInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    messageInputController.dispose();
    super.dispose();
  }

  _sendMessage() {
    final sendButtonProvider =
        Provider.of<SendButtonProvider>(context, listen: false);
    sendButtonProvider.setInputEmpty(true);
    Provider.of<MessagesProvider>(context, listen: false).addMessage(Message(
        10 + Random().nextInt(991),
        '550e8400-e29b-41d4-a716-446655440000',
        '123e4567-e89b-12d3-a456-426655440000',
        messageInputController.text,
        "sent"));
    messageInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(LineAwesomeIcons.paperclip,
                          color: AppColors.iconColor),
                      onPressed: () {
                        // Add functionality for tapping the "+" icon
                      },
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            reverse: true,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: TextField(
                                // focusNode:
                                //     messagesProvider.focusNode,
                                controller: messageInputController,
                                onSubmitted: (_) => _sendMessage(),
                                onChanged: (text) {
                                  final sendButtonProvider =
                                      Provider.of<SendButtonProvider>(context,
                                          listen: false);
                                  sendButtonProvider
                                      .setInputEmpty(text.trim().isEmpty);
                                },
                                textInputAction: TextInputAction.send,
                                maxLines: null,
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Type message',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined,
                          color: AppColors.iconColor),
                      onPressed: () {
                        // Add functionality for tapping the emoji icon
                      },
                    ),
                    Consumer<SendButtonProvider>(
                        builder: (context, sendButtonProvider, child) {
                      return sendButtonProvider.isInputEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.mic,
                                color: AppColors.iconColor,
                              ),
                              onPressed: () {
                                // Add functionality for tapping the mic icon
                              },
                            )
                          : IconButton(
                              icon: const Icon(LineAwesomeIcons.paper_plane),
                              onPressed: () =>  _sendMessage(),
                            );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
