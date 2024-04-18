import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class AccessibleHeadingText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AccessibleHeadingText(this.data, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    // Create a default style if `style` is null
    final defaultStyle = TextStyle();

    return Text(
      data,
       textAlign: accessibilitySettings.textAlignment ?? TextAlign.left,
      style: (style ?? defaultStyle).copyWith(
        fontWeight: accessibilitySettings.fontWeight ?? style?.fontWeight ,
        backgroundColor: accessibilitySettings.textBgColor,
        fontSize: (accessibilitySettings.currentFontSize ?? 16.0) *
            (accessibilitySettings.textScaleFactor ?? 1.0) *
            (accessibilitySettings.impairedMode ?? false ? 1.2 : 1),
        color: accessibilitySettings.headingColor ?? defaultStyle.color,
        height: accessibilitySettings.lineHeight ?? defaultStyle.height,
        letterSpacing: accessibilitySettings.letterSpacing ?? defaultStyle.letterSpacing,
      ),
    );
  }
}
