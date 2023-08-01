import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/components/voice_wave/helpers/utils.dart';

/// document will be added
class AudioWaves extends StatelessWidget {
const AudioWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [for (int i = 0; i < 27; i++) _singleWave(context)],
    );
  }

  Widget _singleWave(BuildContext context) {
    final double height = 5.74.w() * math.Random().nextDouble() + .26.w();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: .2.w()),
      width: .56.w(),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: const Color(0x99000000),
      ),
    );
  }
}
