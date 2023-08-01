import 'package:flutter/material.dart';
import 'image_with_caption.dart';
import 'image_without_caption.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {super.key,
      required this.imgUrl,
      required this.caption,
      required this.constraints,
      required this.color,
      required this.isMe,
      required this.message,
      required this.textColor,
      required this.ack,
      required this.time,
      required this.timeLabelColor, 
      required this.showLoadingOverlay, 
      required this.percentage, 
      required this.onTap
      });

  /// Represents the URL of an image.
  final String imgUrl;

  /// Represents the caption or textual description associated with an image.
  final String caption;

  /// Represents the constraints applied to a widget's size.
  ///
  /// The [constraints] parameter is used to define the maximum width and height that a widget can occupy.
  /// It is commonly used in layout calculations to determine the size and positioning of child widgets within a parent widget.
  ///
  /// Example usage:
  /// dart /// Container( /// constraints: BoxConstraints( /// maxWidth: constraints.maxWidth * 0.8, /// ), /// child: ... /// ) /// ///
  /// In this example, the maxWidth property of the constraints is set to 80% of the maximum width available to the parent widget.
  /// This constraint ensures that the child widget, wrapped inside the Container, does not exceed the specified maximum width.

  final BoxConstraints constraints;

  ///Background Color
  final Color color;

  /// this indicates if the message is from me or the other user
  final bool isMe;

  /// message content eg text
  final String message;

  /// color that will be applied to the text
  final Color textColor;

  /// Message status example ( sent, delivered and seen)
  final Widget ack;

  /// message time
  final String time;

  /// color that will be applied on time label.
  final Color timeLabelColor;

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

  @override
  Widget build(BuildContext context) {
    return caption != ""
        ? ImageWithCaption(
            onTap: onTap,
            imgUrl: imgUrl,
            caption: caption,
            constraints: constraints,
            color: color,
            isMe: isMe,
            message: message,
            textColor: textColor,
            ack: ack,
            time: time,
            timeLabelColor: timeLabelColor,
            showLoadingOverlay:showLoadingOverlay,
            percentage: percentage)
        : ImageWithoutCaption(
          onTap: onTap,
            imgUrl: imgUrl,
            caption: caption,
            constraints: constraints,
            color: color,
            isMe: isMe,
            message: message,
            textColor: textColor,
            ack: ack,
            time: time,
            timeLabelColor: timeLabelColor,
            showLoadingOverlay:showLoadingOverlay,
            percentage: percentage);
  }
}
