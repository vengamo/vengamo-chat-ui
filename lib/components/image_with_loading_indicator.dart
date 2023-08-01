import 'package:flutter/material.dart';
import 'dart:convert';
import '../Utils/index.dart';

class ImageWithLoadingIndicator extends StatelessWidget {
  final String imgUrl;
 const ImageWithLoadingIndicator({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: MemoryImage(base64Decode(cleanBase64(imgUrl))),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black26,
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
              ),
        ), 
      ],
    );
  }
}
