import 'package:flutter/material.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/loading_placeholder.png').image,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black12,
                  BlendMode.colorBurn,
                ),
              ),
            ),
          ),
        ),
        const Center(
          child:
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.0,
              ), // Replace this with your custom loading widget if needed
        ),
      ],
    );
  }
}
