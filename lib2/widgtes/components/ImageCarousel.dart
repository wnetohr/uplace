import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/routes/routes.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  const ImageCarousel({required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust as necessary
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(images[index]),
          );
        },
      ),
    );
  }
}