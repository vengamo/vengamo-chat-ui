import 'package:flutter/material.dart';

class WhatsAppTrianglePainter extends CustomPainter {
  final bool isLeft;
  final Color bg;

  const WhatsAppTrianglePainter({required this.isLeft, required this.bg});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = bg;
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
      ..color = bg
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);
    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}