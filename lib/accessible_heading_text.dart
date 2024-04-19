import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccessibleHeadingText extends StatefulWidget {
  final String data;
  final TextStyle? style;

  const AccessibleHeadingText(
    this.data, {
    super.key,
    this.style,
  });

  @override
  State<AccessibleHeadingText> createState() => _AccessibleHeadingTextState();
}

class _AccessibleHeadingTextState extends State<AccessibleHeadingText> {
  AccessibilityFeatures accessibilitySettings = AccessibilityFeatures();
  late Color headingColor;

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    final Color? textColor = widget.style?.color;
    final Color? fallbackColor = accessibilitySettings.headingColor;
    final bool isBlackOrWhite =
        textColor == Colors.black || textColor == Colors.white;

    final Color? finalColor =
        isBlackOrWhite ? fallbackColor : textColor ?? fallbackColor;

    return Text(
      widget.data,
      textAlign: accessibilitySettings.textAlignment,
      style: (widget.style ?? const TextStyle()).copyWith(
        fontWeight: widget.style?.fontWeight ??
            (accessibilitySettings.impairedMode
                ? FontWeight.bold
                : FontWeight.normal),
        backgroundColor:
            widget.style?.backgroundColor ?? accessibilitySettings.textBgColor,
        fontSize: ((widget.style?.fontSize ?? 0) *
                accessibilitySettings.textScaleFactor *
                (accessibilitySettings.impairedMode ? 1.2 : 1)) ??
            (accessibilitySettings.currentFontSize *
                accessibilitySettings.textScaleFactor *
                (accessibilitySettings.impairedMode ? 1.2 : 1)),
        color: finalColor,
        height: accessibilitySettings.lineHeight,
        letterSpacing: accessibilitySettings.letterSpacing,
      ),
    );
  }
}
