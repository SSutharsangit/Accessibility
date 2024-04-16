
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accessibility_features/accessibility_features.dart';

class AccessibilityImage extends StatelessWidget {
  final ImageProvider image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final Color? color;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;

  const AccessibilityImage({
    required this.image,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final accessibilitySettings = context.watch<AccessibilityFeatures>();
    return Container(
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: accessibilitySettings.imageColor,
        colorBlendMode: colorBlendMode,
        filterQuality: filterQuality,
      ),
    );
  }
}
