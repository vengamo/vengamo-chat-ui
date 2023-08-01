import 'package:flutter/material.dart';

class AudioPlaceHolder extends StatelessWidget {
  const AudioPlaceHolder({Key? key,
  required this.error}) : super(key: key);
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Play button with white background and circular border
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: error
                ? const Icon(
                    Icons.error,
                    color: Colors.red,
                  ) : const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Color(0xFF2BCA72),
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),
        // Image placeholder
        //while Audio is still cashing
        Image.asset(
          'assets/images/wave_placeholder.png',
          height: 40,
          width: 180,
        )
      ],
    );
  }
}
