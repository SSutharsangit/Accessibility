import 'package:accessibility_features/accessible_heading_text.dart';
import 'package:accessibility_features/accessible_text.dart';
import 'package:accessibility_features/accessiblity_image.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AccessibilityImage(
              image: AssetImage('assets/hello.png'),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorBlendMode: BlendMode.colorBurn,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(height: 20),
            AccessibleHeadingText("Heading"),
            AccessibleText("NormaL text"),
          ],
        ),
      ),
    );
  }
}
