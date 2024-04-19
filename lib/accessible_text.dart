import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccessibleText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AccessibleText(this.data, {super.key, this.style});

  final double minFontSize = 12.0;

  final double maxFontSize = 20.0;
  final double minLineSpace = 0.5;
  final double maxLineSpace = 3.0;

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    final Color? textColor = style?.color;
    final Color? fallbackColor = accessibilitySettings.textColor;
    final bool isBlackOrWhite =
        textColor == Colors.black || textColor == Colors.white;

    final Color? finalColor =
        isBlackOrWhite ? fallbackColor : textColor ?? fallbackColor;

    return Text(
      data,
      textAlign: accessibilitySettings.textAlignment,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: style?.fontWeight ??
            (accessibilitySettings.impairedMode
                ? FontWeight.bold
                : FontWeight.normal),
        backgroundColor:
            style?.backgroundColor ?? accessibilitySettings.textBgColor,
        fontSize: ((style?.fontSize ?? 0) *
                    accessibilitySettings.textScaleFactor *
                    (accessibilitySettings.impairedMode ? 1.2 : 1))
                .clamp(minFontSize, maxFontSize) ??
            (accessibilitySettings.currentFontSize *
                    accessibilitySettings.textScaleFactor *
                    (accessibilitySettings.impairedMode ? 1.2 : 1))
                .clamp(minFontSize, maxFontSize),
        color: finalColor,
        height:
            accessibilitySettings.lineHeight.clamp(minLineSpace, maxLineSpace),
        letterSpacing: accessibilitySettings.letterSpacing,
      ),
    );
  }
}
