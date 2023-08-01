import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/theme/app_color.dart';
import 'components/without_avatar_bubble.dart';

class VengamoChatUI extends StatelessWidget {
  /// message text
  final String? text;
  /// true of false to determine if the message is from you or the other sender
  final bool isSender;
  /// the background color applied to chat bubble of message from you
  final Color senderBgColor;
  /// the background color applied to chat bubble of message from the other user
  final Color receiverBgColor;
  /// this boolean value will determine if the message is from same user
  /// it has some advantages for example
  /// of removing pointer and margin of group messages or between single message from different user
  final bool isNextMessageFromSameSender;
  /// This is time color
  /// by default Color(0x99000000), but it can be customized to provide good user experience.
  final Color timeLabelColor;
  /// this is text color
  final Color textColor;
  /// Message time
  final String time;
  /// this is a speech bubble arrow, it will determine, whether chat bubble will have a pointer/arrow or not.
  final bool pointer;
  /// This widget will display message status( sent, delivered or seen).
  final Widget ack;
  /// Represents the URL of an image.
  final String? imgUrl;
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

  ///call back function that will be fired on tap.
  final VoidCallback? onTap;

  ///Boolean for audio message
  final bool? isAudio;

  ///Audio source
  ///in this Version we're supporting only remote files, local files in coming version
  final String? audioSource;
  ///This can be very useful when uploading audio to the server and is not yet done uploading
  final bool? isLoading;

  const VengamoChatUI({
    super.key, 
    this.text,
    required this.isSender,
    required this.senderBgColor,
    required this.receiverBgColor,
    this.textColor = AppColors.darkModeBackgroundColor,
    this.isNextMessageFromSameSender = false,
    required this.time,
    this.timeLabelColor = AppColors.softBlackcolor,
    this.pointer = true,
    required this.ack,
    this.imgUrl = "", 
    this.caption = "",
    this.showLoadingOverlay = false,
    this.percentage = 0.0, 
    this.onTap,
    this.isAudio,
    this.audioSource, 
    this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: LayoutBuilder(
        builder: (ctx, constraints) {
           return ChatBubbleWithoutAvatar(
                    isMe: isSender,
                    message: text ?? '',
                    constraints: constraints,
                    senderBgColor : senderBgColor,
                    receiverBgColor: receiverBgColor,
                    isNextMessageFromSameSender: isNextMessageFromSameSender,
                    time : time,
                    timeLabelColor: timeLabelColor,
                    pointer: pointer,
                    ack: ack,
                    textColor: textColor,
                    imgUrl : imgUrl??"",
                    caption : caption,
                    showLoadingOverlay: showLoadingOverlay,
                    percentage: percentage,
                    onTap: onTap ?? () => {},
                    isAudio: isAudio?? false,
                    audioSource: audioSource?? "",
                    isLoading: isLoading?? false
              );
        })
        );
      },
    );
  }
}

