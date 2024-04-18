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
    final double minFontSize = 16.0;
    final double maxFontSize = 24.0;
    final double minLineSpace = 0.1;
    final double maxLineSpace = 3.0;

    final Color? textColor = widget.style?.color;
    final Color fallbackColor = accessibilitySettings.headingColor;
    final bool isBlackOrWhite =
        textColor == Colors.black || textColor == Colors.white;

    final Color finalColor =
        isBlackOrWhite ? fallbackColor : textColor ?? fallbackColor;

    return Align(
      alignment: accessibilitySettings.textAlignment,
      child: Text(
        widget.data,
        style: (widget.style ?? const TextStyle()).copyWith(
          fontWeight: widget.style?.fontWeight ??
              (accessibilitySettings.impairedMode
                  ? FontWeight.bold
                  : FontWeight.normal),
          backgroundColor: widget.style?.backgroundColor ??
              accessibilitySettings.textBgColor,
          fontSize: ((widget.style?.fontSize ?? 0) *
                      accessibilitySettings.textScaleFactor *
                      (accessibilitySettings.impairedMode ? 1.2 : 1))
                  .clamp(minFontSize, maxFontSize) ??
              (accessibilitySettings.currentFontSize *
                      accessibilitySettings.textScaleFactor *
                      (accessibilitySettings.impairedMode ? 1.2 : 1))
                  .clamp(minFontSize, maxFontSize),
          color: finalColor,
          height: accessibilitySettings.lineHeight
              .clamp(minLineSpace, maxLineSpace),
          letterSpacing: accessibilitySettings.letterSpacing,
        ),
      ),
    );
  }
}
