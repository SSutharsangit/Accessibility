import 'package:accessibility_features/accessibility_features.dart';
import 'package:accessibility_features/accessible_heading_text.dart';
import 'package:accessibility_features/accessible_text.dart';
import 'package:accessibility_features/accessiblity_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilityFeatures>(
      builder: (context, accessibilityFeatures, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Next Page'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              AccessibleHeadingText(
                "Heading changed",
                style: TextStyle(
                  fontSize: accessibilityFeatures.currentFontSize,
                  color: Colors.amber,
                ),
              ),
              AccessibleText(
                "Normal text",
                style: TextStyle(
                  fontSize: accessibilityFeatures.currentFontSize,
                  color: accessibilityFeatures.textColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
