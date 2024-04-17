import 'package:flutter/material.dart';

enum AppTheme { light, dark, highContrast }

enum MonochromeMode { off, on }

class AccessibilityFeatures extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;
  double _currentFontSize = 16.0;
  bool _colorBlindMode = false;
  bool _impairedMode = false;
  double _textScaleFactor = 1.0;
  Color _headingColor = Colors.black; // Default heading color
  Color _textColor = Colors.black; // Default text color
  Color _textBgColor = Colors.transparent; // Default text background color
  Color _scaldBgColor = Colors.white; // Default scaffold background color
  double _lineHeight = 1.0; // Default line height
  double _letterSpacing = 1.0;
  // bool _monochrome = false;
  Color _imageColor = Colors.white;
  bool _imageVisibility = true;
  Alignment _textAlignment = Alignment.centerLeft;
  MonochromeMode _monochrome = MonochromeMode.off;

  // Constructor to initialize the theme
  AccessibilityFeatures() {
    _currentTheme = AppTheme.light;
    _currentFontSize = 16.0;
    _colorBlindMode = false;
    _textScaleFactor = 1.0;
  }

  // Getter methods for accessing properties
  AppTheme get currentTheme => _currentTheme;
  double get currentFontSize => _currentFontSize;
  bool get colorBlindMode => _colorBlindMode;
  bool get impairedMode => _impairedMode;
  MonochromeMode get monochrome => _monochrome;
  double get textScaleFactor => _textScaleFactor;
  Color get headingColor => _headingColor;
  Color get textColor => _textColor;
  Color get textBgColor => _textBgColor;
  Color get scaldBgColor => _scaldBgColor;
  double get lineHeight => _lineHeight;
  double get letterSpacing => _letterSpacing;
  Color get imageColor => _imageColor;
  bool get imageVisibility => _imageVisibility;
  Alignment get textAlignment => _textAlignment;

  // Method to set the theme
  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    // print("_currentTheme $_currentTheme");
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to increase font size
  void increaseFontSize() {
    if (_currentFontSize <= 24) {
      _currentFontSize += 2.0;
      updateTextScaleFactor();
    }
  }

  // Method to decrease font size
  void decreaseFontSize() {
    if (_currentFontSize >= 12) {
      _currentFontSize -= 2.0;
      updateTextScaleFactor();
    }
  }

  // Method to toggle color blind mode
  void toggleColorBlindMode() {
    _colorBlindMode = !_colorBlindMode;
    _scaldBgColor = _colorBlindMode ? Colors.black : Colors.white;
    _textColor = _colorBlindMode ? Colors.white : Colors.black;
    _headingColor = _colorBlindMode ? Colors.white : Colors.black;
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to toggle impaired mode
  void toggleimpairedMode() {
    _impairedMode = !_impairedMode;
    notifyListeners(); // Notify listeners to update UI
  }

  void disableDarkMode() {
    _currentTheme = AppTheme.light;
    notifyListeners(); // Notify listeners to update UI
  }

  void disableLightMode() {
    _currentTheme = AppTheme.dark;
    notifyListeners(); // Notify listeners to update UI
  }

  void toggleMonochrome() {
    _monochrome = _monochrome == MonochromeMode.off
        ? MonochromeMode.on
        : MonochromeMode.off;

    final bool isMonochrome = _monochrome == MonochromeMode.on;
    final bool isDarkTheme = _scaldBgColor == Colors.black;

    if (!isMonochrome) {
      // Set colors based on theme and monochrome mode
      _textColor = isDarkTheme ? Colors.white : Colors.black;
      _headingColor = isDarkTheme ? Colors.white : Colors.black;
      _imageColor = Colors.white; // Always white in non-monochrome mode
    } else {
      // Set colors to grey when monochrome mode is on
      _textColor = Colors.grey;
      _headingColor = Colors.grey;
      _imageColor = Colors.grey;
    }

    notifyListeners(); // Notify listeners to update UI
  }

  // Method to adjust text size
  void adjustTextSize(double newTextScaleFactor) {
    _textScaleFactor = newTextScaleFactor;
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to update text scale factor
  void updateTextScaleFactor() {
    // Calculate text scale factor based on current font size
    _textScaleFactor =
        _currentFontSize / 16.0; // Assuming 16.0 is the base font size
    notifyListeners(); // Notify listeners to update UI
  }

  void hideImage() {
    // Calculate text scale factor based on current font size
    _imageVisibility = !_imageVisibility; // Assuming 16.0 is the base font size
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to set heading color
  setHeadingColor(Color color) {
    _headingColor = color;
    notifyListeners();
  }

  // Method to set text color
  void setTextAlignment(Alignment align) {
    _textAlignment = align;
    notifyListeners();
  }

  // Method to set text color
  void setTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  // Method to set text background color
  void setTextBgColor(Color color) {
    _textBgColor = color;
    notifyListeners();
  }

  // Method to set scaffold background color
  void setScalfoldColor(Color color) {
    _scaldBgColor = color;
    notifyListeners();
  }

  void increaseLineHeight() {
    if (_lineHeight <= 3.0) {
      _lineHeight += 0.1;
      notifyListeners();
    }
  }

  void decreaseLineHeight() {
    _lineHeight -= 0.1;
    notifyListeners();
  }

  void increaseLetterSpace() {
    _letterSpacing += 0.1;
    notifyListeners();
  }

  void decreaseLetterSpace() {
    _letterSpacing -= 0.1;
    notifyListeners();
  }

  // Method to reset all settings
  void reset() {
    _currentTheme = AppTheme.light;
    _impairedMode = false;
    _monochrome = MonochromeMode.off;
    _currentFontSize = 16.0;
    _colorBlindMode = false;
    _textScaleFactor = 1.0;
    _textBgColor = Colors.transparent;
    _headingColor = Colors.black;
    _textColor = Colors.black;
    _textBgColor = Colors.transparent;
    _scaldBgColor = Colors.white;
    _imageColor = Colors.white;
    _lineHeight = 1.0;
    _letterSpacing = 1.0;
    _imageVisibility = true;
    _textAlignment = Alignment.centerLeft;
    notifyListeners();
  }
}
