import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/vengamo_chat_ui.dart';
import 'package:vengamo_chat_ui/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'James Wagon',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const VengamoChatScreen(),
    );
  }
}

class VengamoChatScreen extends StatelessWidget {
  const VengamoChatScreen({super.key});

  String getTime() {
    int hour = DateTime.now().hour;
    int min = DateTime.now().minute;
    String hRes = hour <= 9 ? '0$hour' : hour.toString();
    String mRes = min <= 9 ? '0$min' : min.toString();
    return '$hRes:$mRes';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('James Wagon'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 2),
            child: Column(
              children: [

              VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: false,
              time: getTime(),
              isAudio: true,
              audioSource: 'http://www.uscis.gov/files/nativedocuments/Track%2093.mp3',
              timeLabelColor: AppColors.iconColor,
              pointer: true,
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
            const SizedBox(height: 10,),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              isNextMessageFromSameSender: false,
              time: getTime(),
              isAudio: true,
              audioSource: 'https://p.scdn.co/mp3-preview/c2bca95698cc381f0a1a9111095156d15ebd4698',
              timeLabelColor: AppColors.iconColor,
              pointer: true,
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
            // const SizedBox(height: 10,),
            //     VengamoChatUI(
            //   senderBgColor: AppColors.softGreenColor,
            //   receiverBgColor: AppColors.white,
            //   timeLabelColor: AppColors.darkModeBackgroundColor,
            //   isSender: false,
            //   isNextMessageFromSameSender: false,
            //   imgUrl : 'https://static.wikia.nocookie.net/frstarwars/images/4/43/TheChild-Fathead.png/revision/latest?cb=20201101090715',
            //   caption : "check this out! Why don't skeletons fight each other? They don't have the guts!",
            //   time: getTime(),
            //   pointer: true, 
            //   ack: Image.asset(
            //     'assets/images/seen.png',
            //     height: 12,
            //     width: 12,
            //   ),
            // ),
            const SizedBox(height: 10,),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              timeLabelColor: AppColors.white,
              isNextMessageFromSameSender: false,
              imgUrl : 'https://cdn.wallpapersafari.com/28/2/vrIzJD.jpg',
              time: getTime(),
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
            const SizedBox(height: 10,),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              timeLabelColor: AppColors.white,
              isNextMessageFromSameSender: false,
              imgUrl : 'https://weellu.s3.us-east-2.amazonaws.com/test/kYFhiApyyVRX.jpeg',
              time: getTime(),
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
               VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: false,
              time: getTime(),
              timeLabelColor : AppColors.softBlackcolor,
              text: "Yolla ✋ Hey, guess what?",
              pointer: true, 
              ack: const Icon(
                      Icons.check,
                      color: AppColors.iconColor, // You can customize the color here
                    size: 13, // You can customize the size here
              ),
            ),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: true,
              time: getTime(),
              timeLabelColor : AppColors.softBlackcolor,
              text: "What?",
              pointer: false, 
              ack: Image.asset(
                'assets/images/double_tick_grey.png',
                height: 13,
                width: 13,
              ),
            ),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              isNextMessageFromSameSender: false,
              time: getTime(),
              text: "I invented a new word!.",
              pointer: true, 
              ack: Image.asset(
                'assets/images/double_tick_green.png',
                height: 14,
                width: 15,
              ),
            ),
            const SizedBox(height: 5,),

            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              timeLabelColor: AppColors.darkModeBackgroundColor,
              isSender: true,
              isNextMessageFromSameSender: false,
              imgUrl : 'https://wallpaperaccess.com/full/1248267.jpg',
              caption: "Why did the sun never want to join the galaxy's talent show? Because it didn't want to be a star performer, it preferred to shine solo",
              time: getTime(),
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              isNextMessageFromSameSender: true,
              time: getTime(),
              text: "Hold on, a sec, let me pick this call?",
              pointer: false, 
              ack: Image.asset(
                'assets/images/double_tick_green.png',
                height: 14,
                width: 15,
              ),
            ),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              isNextMessageFromSameSender: true,
              time: getTime(),
              text: "Plagiarism! 💫 😂 ",
              pointer: false, 
              ack: Image.asset(
                'assets/images/double_tick_green.png',
                height: 14,
                width: 15,
              ),
            ),
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: false,
              time: getTime(),
              text: "Plagiarism!? 😂.",
              pointer: true, 
              ack: Image.asset(
                'assets/images/sent.png',
                height: 12,
                width: 12,
              ),
            ),
           
             VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: true,
              time: getTime(),
              text: "Thanks! I thought you'd like it 🤪",
              pointer: false, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ), VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: true,
              time: getTime(),
              text: "Why don't scientists trust atoms? Because they make up everything! If you'd like to hear more jokes or have any other questions, feel free to ask.😂🤪",
              pointer: false, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
        
            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: false,
              isNextMessageFromSameSender: false,
              time: getTime(),
              text: "check this out! Why don't skeletons fight each other? They don't have the guts!",
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
            
            const SizedBox(height: 5,),

            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: false,
              imgUrl : 'https://cache.marieclaire.fr/data/photo/w1000_ci/1ju/sean-connery-james-bond.jpg',
              caption: "Why did the sun never want to join the galaxy's talent show? Because it didn't want to be a star performer, it preferred to shine solo",
              time: getTime(),
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),

            VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              caption: "You'd like it 🤪",
              isNextMessageFromSameSender: false,
              imgUrl : 'https://wallpapers.com/images/high/peaceful-relaxing-vhbesnvs3ylhpuvk.webp',
              time: getTime(),
              timeLabelColor: AppColors.iconColor,
              pointer: false,
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),

           
        
              ],
            ),
          ),
        ),
      ), // Use Vengamo Chat UI component here
    );
  }
}