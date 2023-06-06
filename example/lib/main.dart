import 'package:flutter/material.dart';
import 'package:vengamo_chat/provider/MessageProvider.dart';
import 'package:vengamo_chat/provider/sendButtonProvider.dart';
import 'package:vengamo_chat/theme/AppColor.dart';
import 'components/ChatMessages.dart';
import 'components/textInput.dart';
import 'models/message.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SendButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessagesProvider(),
        )
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: MyHomePage(title: 'Vengamo chat UI'),
    ));
  }
}

class MyHomePage extends StatelessWidget {
 MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primarycolor,
        title: Text(title),
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatMessages()
            ), 
          TextInputField()
        ],
      ),
    );
  }
}
