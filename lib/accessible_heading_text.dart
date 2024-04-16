import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class AccessibleHeadingText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AccessibleHeadingText(this.data, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    return Align(
      alignment:accessibilitySettings.textAlignment ,
      child: Text(
        data,
        style: style?.copyWith(
      fontWeight: accessibilitySettings.impairedMode ? FontWeight.bold : FontWeight.normal,
      backgroundColor: accessibilitySettings.textBgColor,
      fontSize: style!.fontSize! * accessibilitySettings.textScaleFactor * (accessibilitySettings.impairedMode ? 1.2 : 1),
      color: accessibilitySettings.headingColor,
      height: accessibilitySettings.lineHeight,
      letterSpacing:accessibilitySettings.letterSpacing
        ),
      ),
    );

  }
}
