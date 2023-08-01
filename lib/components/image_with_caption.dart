import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/components/place_holder.dart';
import '../Utils/index.dart';
import '../seen_status.dart';
import 'image_with_loading_indicator.dart';

class ImageWithCaption extends StatelessWidget {
  const ImageWithCaption(
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
      required this.onTap});

  /// Represents the URL of an image.
  final String? imgUrl;

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
    if (imgUrl == "" || imgUrl == null) {
      return Container();
    }

    //validate if image url sent is indeed base64
    bool isImageBase64 = isBase64(cleanBase64(imgUrl!));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth * 0.8,
          minHeight: 150,
          maxHeight: 400,
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: isImageBase64
                            ? ImageWithLoadingIndicator(imgUrl: imgUrl!)
                            : Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: imgUrl!,
                                  imageBuilder: (context, imageProvider) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black12,
                                              BlendMode.colorBurn),
                                        ),
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const PlaceHolder(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                      ),
                    ),
                    if (showLoadingOverlay) // Display the loading overlay conditionally based on the showLoadingOverlay variable
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(9)),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Icon(Icons.close,
                                          color: Colors.white, size: 32),
                                    ),
                                    Positioned.fill(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        value:
                                            percentage, // Replace "progress" with the actual progress value (0.0 to 1.0)
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
                      child: Text(caption),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: SeenStatus(
                        isMe: isMe,
                        time: time,
                        dateTextColor: timeLabelColor,
                        messageAck: ack,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
