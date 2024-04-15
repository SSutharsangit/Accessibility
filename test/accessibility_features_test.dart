import 'package:flutter_test/flutter_test.dart';

import 'package:accessibility_features/accessibility_features.dart';

void main() {
  test('adds one to input values', () {
    final accessibilityFeatures = AccessibilityFeatures();
    expect(accessibilityFeatures.colorBlindMode, false);
    expect(accessibilityFeatures.textScaleFactor, 1.0);
  });
}
