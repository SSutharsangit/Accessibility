import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class AccessibleText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  

  const AccessibleText(this.data, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    return Align(
      alignment: accessibilitySettings.textAlignment,
      child: Text(
        data,
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: accessibilitySettings.impairedMode ? FontWeight.bold : FontWeight.normal,
          backgroundColor: accessibilitySettings.textBgColor,
          fontSize: accessibilitySettings.currentFontSize* accessibilitySettings.textScaleFactor ,
          color:  accessibilitySettings.textColor,
          height: accessibilitySettings.lineHeight,
          letterSpacing: accessibilitySettings.letterSpacing,
        ),
      ),
    );
  }
}
