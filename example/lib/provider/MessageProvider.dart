import 'package:flutter/material.dart';
import '../models/message.dart';

class MessagesProvider extends ChangeNotifier {
  // we init with few hard code messages
    List<Message> _messages = [
      Message(1,'550e8400-e29b-41d4-a716-446655440000', '123e4567-e89b-12d3-a456-426655440000', 'Hello!', 'seen'),
      Message(2,'550e8400-e29b-41d4-a716-446655440000', '123e4567-e89b-12d3-a456-426655440000', 'How are you?', 'seen'),
      Message(3,'550e8400-e29b-41d4-a716-446655440000', '123e4567-e89b-12d3-a456-426655440000', 'What are you doing?','delivered'),
      Message(4,'123e4567-e89b-12d3-a456-426655440000', 'U550e8400-e29b-41d4-a716-446655440000', 'I am fine.','delivered'),
      Message(4,'123e4567-e89b-12d3-a456-426655440000', 'U550e8400-e29b-41d4-a716-446655440000', 'provide it with a default value. This way, if a value is not explicitly passed, it will automatically be assigned the default value.','delivered'),
      Message(5,"550e8400-e29b-41d4-a716-446655440000", '123e4567-e89b-12d3-a456-426655440000',
          "This song had me in a choke hold when it came out. Here I am in 2023 still listening 🥰", 'sent'),
    ];
 
  List<Message> get messages => _messages;
    
  //add Message
  void addMessage(Message message) {
  final existingMessageIndex = _messages.indexWhere((m) => m.id == message.id);
    if (existingMessageIndex != -1) {
      _messages[existingMessageIndex] = message;
    } else {
      _messages.add(message);
    }
    notifyListeners();
  }

}