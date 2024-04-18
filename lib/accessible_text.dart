import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccessibleText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AccessibleText(this.data, {Key? key, this.style}) : super(key: key);

  final double minFontSize = 12.0;

  final double maxFontSize = 20.0;
  final double minLineSpace = 0.5;
  final double maxLineSpace = 3.0;

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    // Create a default style if `style` is null
    const defaultStyle = TextStyle();

    return Text(
      data,
      textAlign: accessibilitySettings.textAlignment ?? TextAlign.left,
      style: (style ?? defaultStyle).copyWith(
        fontWeight: accessibilitySettings.fontWeight ?? style?.fontWeight,
        backgroundColor:
            accessibilitySettings.textBgColor ?? style?.backgroundColor,
        fontSize: ((accessibilitySettings.currentFontSize ?? style?.fontSize) ??
                16.0) *
            (accessibilitySettings.textScaleFactor ?? 1.0),
        color: accessibilitySettings.textColor ?? style?.color,
        height: accessibilitySettings.lineHeight ?? style?.height,
        letterSpacing:
            accessibilitySettings.letterSpacing ?? style?.letterSpacing,
      ),
    );
  }
}
