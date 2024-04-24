import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, highContrast }

enum MonochromeMode { off, on }

class AccessibilityFeatures extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.light;
  double _currentFontSize = 16.0;
  bool _colorBlindMode = false;
  bool _impairedMode = false;
  double _textScaleFactor = 1.0;
  Color? _headingColor; // Default heading color
  Color? _textColor; // Default text color
  Color _textBgColor = Colors.transparent; // Default text background color
  Color _scaldBgColor = Colors.white; // Default scaffold background color
  double _lineHeight = 1.0; // Default line height
  double _letterSpacing = 1.0;
  Color _imageColor = Colors.white;
  bool _imageVisibility = true;
  TextAlign _textAlignment = TextAlign.left;
  MonochromeMode _monochrome = MonochromeMode.off;
  bool _systemMode = false;
  bool _isDark = false;
  bool get isDark => _isDark;

  SharedPreferences? storage;

  // Constructor to initialize the theme
  AccessibilityFeatures() {
    _currentTheme = AppTheme.light;
    _currentFontSize = 16.0;
    _colorBlindMode = false;
    _textScaleFactor = 1.0;
  }

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  changeTheme() {
    _isDark = !isDark;
    storage?.setBool("isDark", _isDark);
    _textColor = _isDark ? Colors.white : Colors.black;
    _headingColor = isDark ? Colors.white : Colors.black;
    _imageColor = Colors.white;
    notifyListeners();
  }

  //Init method of provider
  init() async {
    //After we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage?.getBool("isDark") ?? false;
    _systemMode = storage?.getBool("isSystem") ?? false;

    notifyListeners();
  }

  // Getter methods for accessing properties
  AppTheme get currentTheme => _currentTheme;
  double get currentFontSize => _currentFontSize;
  bool get colorBlindMode => _colorBlindMode;
  bool get impairedMode => _impairedMode;
  MonochromeMode get monochrome => _monochrome;
  double get textScaleFactor => _textScaleFactor;
  Color? get headingColor => _headingColor;
  Color? get textColor => _textColor;
  Color get textBgColor => _textBgColor;
  Color get scaldBgColor => _scaldBgColor;
  double get lineHeight => _lineHeight;
  double get letterSpacing => _letterSpacing;
  Color get imageColor => _imageColor;
  bool get imageVisibility => _imageVisibility;
  TextAlign get textAlignment => _textAlignment;
  bool get systemMode => _systemMode;
  // ThemeMode get theme => _theme;

  // Method to set the theme
  // void setTheme(AppTheme theme) {
  //   _currentTheme = theme;
  //   // print("_currentTheme $_currentTheme");
  //   notifyListeners(); // Notify listeners to update UI
  // }

  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
  );
  ThemeData darkMode = ThemeData(brightness: Brightness.dark);

  // Method to increase font size
  void increaseFontSize() {
    if (_currentFontSize <= 26) {
      _currentFontSize += 2.0;
      updateTextScaleFactor();
    }
  }

  // Method to decrease font size
  void decreaseFontSize() {
    if (_currentFontSize >= 11) {
      _currentFontSize -= 2.0;
      updateTextScaleFactor();
    }
  }

  // Method to toggle color blind mode
  // void toggleColorBlindMode() {
  //   _colorBlindMode = !_colorBlindMode;
  //   _scaldBgColor = _colorBlindMode ? Colors.black : Colors.white;
  //   // _theme = _colorBlindMode ? ThemeMode.light : ThemeMode.dark;
  //   _textColor = _colorBlindMode ? Colors.white : Colors.black;
  //   _headingColor = _colorBlindMode ? Colors.white : Colors.black;

  //   notifyListeners(); // Notify listeners to update UI
  // }

  // void darkMode() {
  //   _colorBlindMode = !_colorBlindMode;
  //   _scaldBgColor = Colors.black;
  //   _textColor = Colors.white;
  //   _headingColor = Colors.white;
  //   notifyListeners();
  // }

  // void lightMode() {
  //   _scaldBgColor = Colors.white;
  //   _textColor = Colors.black;
  //   _headingColor = Colors.black;
  //   notifyListeners();
  // }

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

    if (_monochrome == MonochromeMode.on) {
      // Set colors to grey when monochrome mode is on
      _textColor = Colors.grey;
      _headingColor = Colors.grey;
      _imageColor = Colors.grey;
    } else if (systemMode == true) {
      final Brightness brightness =
          PlatformDispatcher.instance.platformBrightness;
      // brightness == Brightness.dark;
      if (brightness == Brightness.dark) {
        _textColor = Colors.white;
        _headingColor = Colors.white;
      } else {
        _textColor = Colors.black;
        _headingColor = Colors.black;
      }
    } else {
      // Set colors based on theme when monochrome mode is off
      _textColor = _isDark ? Colors.white : Colors.black;
      _headingColor = _isDark ? Colors.white : Colors.black;
      _imageColor = Colors.white; // Always white in non-monochrome mode
    }
    storage?.setBool("isDark", _isDark);
    notifyListeners();
  }

  void toggleSystem() {
    _systemMode = !_systemMode; // Toggle system mode
    if (_systemMode) {
      // If system mode is on, adjust theme mode based on system brightness
      final Brightness brightness =
          PlatformDispatcher.instance.platformBrightness;
      // brightness == Brightness.dark;
      if (brightness == Brightness.dark) {
        _textColor = Colors.white;
        _headingColor = Colors.white;
      } else {
        _textColor = Colors.black;
        _headingColor = Colors.black;
      }
    } else {
      // If system mode is off, set text and heading colors based on current theme
      _textColor = _isDark ? Colors.white : Colors.black;
      _headingColor = _isDark ? Colors.white : Colors.black;
    }
    storage?.setBool("isSystem", _systemMode);
    notifyListeners();
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
  void setTextAlignment(TextAlign align) {
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
    if (_lineHeight > 0.5) {
      _lineHeight -= 0.1;
      notifyListeners();
    }
  }

  void increaseLetterSpace() {
    if (_letterSpacing <= 3.0) {
      _letterSpacing += 0.1;
      notifyListeners();
    }
  }

  void decreaseLetterSpace() {
    if (_letterSpacing > 0.1) {
      _letterSpacing -= 0.1;
      notifyListeners();
    }
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
    _textBgColor = Colors.transparent;
    _scaldBgColor = Colors.white;
    _imageColor = Colors.white;
    _lineHeight = 1.0;
    _letterSpacing = 1.0;
    _imageVisibility = true;
    _textAlignment = TextAlign.left;
    if (!isDark) {
      _headingColor = Colors.black;
      _textColor = Colors.black;
    } else {
      _headingColor = Colors.white;
      _textColor = Colors.white;
    }
    notifyListeners();
  }
}
