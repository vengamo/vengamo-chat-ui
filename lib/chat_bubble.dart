import 'dart:math';
import 'package:flutter/material.dart';
import 'seenStatus.dart';
import '../models/message.dart';
import '../theme/AppColor.dart';
import 'BubbleText.dart';
// import 'BubbleText.dart';
import 'DismissableBubble.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  Color bgColor;
  bool isNextMessageFromSameSender;
  String status;
  
  ChatBubble({
    required this.text,
    required this.isSender,
    required this.bgColor,
    this.isNextMessageFromSameSender = false,
    this.status = "sent"
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: LayoutBuilder(
        builder: (ctx, constraints) {
           return _WithoutAvatar(
                    isMe: isSender,
                    message: text ?? '',
                    constraints: constraints,
                    bgColor : bgColor,
                    isNextMessageFromSameSender: isNextMessageFromSameSender,
                    status : status
              );
        })
        );
      },
    );
  }
}

class _WithoutAvatar extends StatelessWidget {
  
  _WithoutAvatar({
    required this.isMe,
    required this.message,
    required this.constraints,
    required this.bgColor,
    required this.isNextMessageFromSameSender,
    required this.status
  });

  final bool isMe;
  final String message;
  final BoxConstraints constraints;
  Color bgColor;
  bool isNextMessageFromSameSender;
  String status;

   BorderRadius _replyMsgRadius() {
    return BorderRadius.circular(15);
  }

@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        Container(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.8,
                        ),
                        margin: EdgeInsets.only(
                              top: isNextMessageFromSameSender ? 2 : 10,
                              bottom: 1,
                            ),
                        decoration: BoxDecoration(
                              color: isMe ? AppColors.softGreenColor: bgColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                                bottomLeft: isMe
                                    ? Radius.circular(9)
                                    : Radius.circular(9),
                                bottomRight: Radius.circular(9),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.13),
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                        child: Padding(
                          key: key,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            runAlignment: WrapAlignment.end,
                            alignment: WrapAlignment.end,
                            spacing: 20,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0, bottom: 6.0),
                                child: BubbleText(text: message, isMe: isMe,textColor:Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: SeenStatus(
                                  isMe: isMe,
                                  status: status,
                                  dateTextColor: Colors.black,
                                  timestamp: DateTime.now(),
                                ),
                              ),
                            ],
                          ),
                        ),
                       ),
                      ],
                    ),
    
                  if (isMe && !isNextMessageFromSameSender)
                      Positioned(
                        right: -8,
                        top: 19,
                        child: CustomPaint(
                          painter: TrianglePainter(isLeft: false, bg: bgColor),
                          size: Size(12, 12),
                        ),
                      ),
                    if (!isMe  && !isNextMessageFromSameSender)
                      Positioned(
                        left: -8,
                        top: 19,
                        child: CustomPaint(
                          painter: TrianglePainter(isLeft: true,  bg: bgColor),
                          size: Size(12, 12),
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

class TrianglePainter extends CustomPainter {
  final bool isLeft;
  Color bg;

  TrianglePainter({required this.isLeft, required this.bg});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = !isLeft ? AppColors.softGreenColor : bg;
    final path = Path();

    if (isLeft) {
      path
        ..moveTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height / 2)
        ..close();
    } else {
      path
        ..moveTo(0, 0)
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height / 2)
        ..close();
    }

    canvas.drawPath(path, paint);

    final shadowPaint = Paint()
      ..color = !isLeft ? AppColors.softGreenColor : bg
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1);
    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
