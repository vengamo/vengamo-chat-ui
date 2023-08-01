import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/components/text_widget.dart';
import '../BubbleDesign/whatsapp_arrow.dart';
import '../dismissable_bubble.dart';
import 'audio_widget.dart';
import 'image_widget.dart';

class ChatBubbleWithoutAvatar extends StatelessWidget {
  
  const ChatBubbleWithoutAvatar({
    super.key, 
    required this.isMe,
    required this.message,
    required this.constraints,
    required this.senderBgColor,
    required this.receiverBgColor,
    required this.isNextMessageFromSameSender,
    required this.pointer,
    required this.ack,
    required this.time,
    required this.timeLabelColor,
    required this.textColor, 
    required this.imgUrl, 
    required this.caption, 
    required this.showLoadingOverlay, 
    required this.percentage,
    required this.onTap, 
    this.isAudio,
    this.audioSource,
    this.isLoading
  });

  final bool isMe;
  final String message;
  final BoxConstraints constraints;
  final Color senderBgColor;
  final Color receiverBgColor;
  final bool isNextMessageFromSameSender;
  final bool pointer;
  final Widget ack;
  final String time;
  final Color timeLabelColor;
  final Color textColor;
   /// Represents the URL of an image.
  final String imgUrl;
  /// Represents the caption or textual description associated with an image.
  final String caption;
  
  /// Add this boolean variable to control the visibility of the loading overlay
  final bool showLoadingOverlay;
  /// The `percentage` represents the progress of the image upload or download operation.
  /// It indicates the completion percentage of the image transfer process,
  /// providing feedback to the user about the progress of the operation.
  /// The value of `percentage` ranges from 0.0 to 1.0, where 0.0 represents no progress,
  /// and 1.0 represents the completion of the operation.
  final double percentage;

  //call back function that will be fired on tap.
  final VoidCallback onTap;

  ///Boolean for audio message
  final bool? isAudio;

  ///Audio source
  ///in this Version we're supporting only remote files, local files in coming version
  final String? audioSource;
  ///This can be very useful when uploading audio to the server and is not yet done uploading
  final bool? isLoading;


  String extractdata(String message, String imageUrl){
    if (message.isNotEmpty && imageUrl.isEmpty || isAudio == true) {
        return 'text';
      } else {
        return 'image';
     }
   }

@override
  Widget build(BuildContext context) {
    /// final size = MediaQuery.of(context).size;
    return DismssibleBubble(
      isMe: isMe,
      message: message,
      child: Wrap(
        children: [
          Stack(
            children: [
              Align(
                alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                      extractdata(message,imgUrl) == "image" ? 
                        Container(
                          constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.8,
                        ),
                        margin: EdgeInsets.only(
                              top: isNextMessageFromSameSender ? 2 : 10,
                              bottom: 1,
                            ),
                          child: ImageWidget(
                           onTap: onTap,
                           imgUrl: imgUrl,
                           caption: caption, 
                           constraints: constraints,
                           color: isMe ? senderBgColor: receiverBgColor,
                            isMe: isMe,
                            textColor: textColor,
                            message: message,
                            ack: ack,
                            time: time,
                            timeLabelColor: timeLabelColor,
                            showLoadingOverlay:showLoadingOverlay,
                            percentage:percentage
                           ),
                        ) : Container(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.8,
                        ),
                        margin: EdgeInsets.only(
                              top: isNextMessageFromSameSender ? 2 : 10,
                              bottom: 1,
                            ),
                        decoration: BoxDecoration(
                              color: isMe ? senderBgColor: receiverBgColor,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(9),
                                topRight: const Radius.circular(9),
                                bottomLeft: isMe
                                    ? const Radius.circular(9)
                                    : const Radius.circular(9),
                                bottomRight: const Radius.circular(9),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.13),
                                  blurRadius: 1,
                                  offset: const Offset(0,1),
                                ),
                              ],
                            ),
                        child: isAudio! ? AudioWidget(
                          isMe: isMe,
                          textColor: textColor,
                          audioSource: audioSource!,
                          ack: ack,
                          senderBgColor:senderBgColor,
                          receiverBgColor:receiverBgColor,
                          time: time,
                          timeLabelColor: timeLabelColor,
                          isLoading: isLoading!
                        ):
                        TextWidget(
                          isMe: isMe,
                          textColor: textColor,
                          message: message,
                          ack: ack,
                          time: time,
                          timeLabelColor: timeLabelColor,
                        ),
                       ),
                      ],
                    ),
    
                  if (isMe && !isNextMessageFromSameSender && pointer)
                      Positioned(
                        right: -8,
                        top: 19,
                        child: CustomPaint(
                          painter: WhatsAppTrianglePainter(isLeft: false, bg: isMe ? senderBgColor: receiverBgColor),
                          size: const Size(12, 12),
                        ),
                      ),
                    if (!isMe  && !isNextMessageFromSameSender && pointer)
                      Positioned(
                        left: -8,
                        top: 19,
                        child: CustomPaint(
                          painter: WhatsAppTrianglePainter(isLeft: true,  bg: isMe ? senderBgColor: receiverBgColor),
                          size: const Size(12, 12),
                        ),
                      ),
                  ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
