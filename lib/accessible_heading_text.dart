import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class AccessibleHeadingText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final double? fontSize; 
  final Color? textColor;

  const AccessibleHeadingText(this.data, {super.key, this.style, this.fontSize, this.textColor});

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
          fontSize: fontSize != null ? fontSize! * accessibilitySettings.textScaleFactor* (accessibilitySettings.impairedMode ? 1.2 : 1) : style?.fontSize,
          color: textColor ?? accessibilitySettings.headingColor,
          height: accessibilitySettings.lineHeight,
          letterSpacing: accessibilitySettings.letterSpacing,
        ),
      ),
    );
  }
}
