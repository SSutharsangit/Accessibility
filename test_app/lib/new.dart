import 'package:accessibility_features/accessible_text.dart';
import 'package:accessibility_features/accessiblity_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         AccessibilityImage(
          image: AssetImage('assets/hello.png'), // Provide your image here
          width: 200, // Optional: Set the width of the image
          height: 200, // Optional: Set the height of the image
          fit: BoxFit.cover, // Optional: Set the fit of the image
          alignment: Alignment.center, // Optional: Set the alignment of the image
           // Optional: Apply a color to the image
          colorBlendMode: BlendMode.colorBurn, // Optional: Set the color blend mode
          filterQuality: FilterQuality.high, // Optional: Set the filter quality
        ),
          SizedBox(height: 20),
          AccessibleText(
            "Heading",
            style: TextStyle(
              fontSize:20 
            ),
          ),
        ],
      ),
    );
  }
}
