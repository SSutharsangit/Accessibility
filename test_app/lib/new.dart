import 'package:accessibility_features/accessible_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hello.png', // Replace 'assets/hello.jpg' with your actual asset path
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.cover, // Adjust fit as needed
            ),
            const SizedBox(height: 20),
            const AccessibleText(
              "heading",
            ),
          ],
        ),
      ),
    );
  }
}
