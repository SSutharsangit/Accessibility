import 'package:flutter/material.dart';

enum AppTheme { light, dark, highContrast }

class AccessibilityFeatures extends ChangeNotifier {
  AppTheme? _currentTheme;
  double? _currentFontSize;
  bool? _colorBlindMode;
  bool? _impairedMode;
  double? _textScaleFactor;
  Color? _headingColor; 
  Color? _textColor; 
  Color? _textBgColor; 
  Color? _scaldBgColor; 
  double? _lineHeight; 
  double? _letterSpacing;
  bool? _monochrome;
  Color? _imageColor;
  bool? _imageVisibility;
 bool? _showimage;
  TextAlign? _textAlignment;
FontWeight? _fontWeight;




  // Getter methods for accessing properties
  AppTheme? get currentTheme => _currentTheme;
  FontWeight? get fontWeight=>_fontWeight;
  double? get currentFontSize => _currentFontSize;
  bool? get colorBlindMode => _colorBlindMode;
  bool? get impairedMode => _impairedMode;
  bool? get monochrome => _monochrome;
  double? get textScaleFactor => _textScaleFactor;
  Color? get headingColor => _headingColor;
  Color? get textColor => _textColor;
  Color? get textBgColor => _textBgColor;
  Color? get scaldBgColor => _scaldBgColor;
  double? get lineHeight => _lineHeight;
  double? get letterSpacing => _letterSpacing;
  Color? get imageColor => _imageColor;
  bool? get imageVisibility => _imageVisibility;
   bool? get showimage => _showimage;
  TextAlign? get textAlignment => _textAlignment;


  // Method to set the theme
  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to increase font size
  void increaseFontSize() {
    _currentFontSize = (_currentFontSize ?? 16.0) + 2.0;
    updateTextScaleFactor();
  }

  // Method to decrease font size
  void decreaseFontSize() {
    _currentFontSize = (_currentFontSize ?? 16.0) - 2.0;
    updateTextScaleFactor();
  }

  // Method to toggle color blind mode
  void toggleColorBlindMode() {
    _colorBlindMode = !(_colorBlindMode ?? false);
    if(_colorBlindMode!){
      _scaldBgColor = _colorBlindMode! ? Colors.black : Colors.white;
    _textColor = _colorBlindMode! ? Colors.white : Colors.black;
    _headingColor = _colorBlindMode! ? Colors.white : Colors.black;
    }else{
      _scaldBgColor = null;
    _textColor = null;
    _headingColor = null;
    }
    
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to toggle impaired mode
  void toggleimpairedMode() {
       _impairedMode = !(_impairedMode ?? false);
  

    _fontWeight = _impairedMode! ? FontWeight.bold : null;
  

  notifyListeners(); // Notify listeners to update UI
  }

  void toggleMonochrome() {
    _monochrome = !(_monochrome ?? false);
    if (_monochrome!) {
      // Set colors to monochrome
      _textColor = Colors.grey;
      _headingColor = Colors.grey;
      _imageColor = Colors.grey;
    } else {
      // Reset colors to normal
      _textColor =null; 
      _headingColor =null; 
      _imageColor = null;
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
    _textScaleFactor = (_currentFontSize ?? 16.0) / 16.0; // Assuming 16.0 is the base font size
    notifyListeners(); // Notify listeners to update UI
  }

void hideImage() {
  _showimage = !(_showimage ?? true);
  _imageVisibility = _showimage ?? true;
  notifyListeners(); // Notify listeners to update UI
}  


  // Method to set heading color
  void setHeadingColor(Color color) {
    _headingColor = color;
    notifyListeners();
  }
  
  // Method to set text alignment
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
    _lineHeight = (_lineHeight ?? 1.0) + 0.1;
    notifyListeners();
  }

  void decreaseLineHeight() {
    _lineHeight = (_lineHeight ?? 1.0) - 0.1;
    notifyListeners();
  }

  void increaseLetterSpace() {
    _letterSpacing = (_letterSpacing ?? 1.0) + 0.1;
    notifyListeners();
  }

  void decreaseLetterSpace() {
    _letterSpacing = (_letterSpacing ?? 1.0) - 0.1;
    notifyListeners();
  }

  // Method to reset all settings
  void reset() {
    _currentTheme =null;
    _impairedMode = false;
    _monochrome = false;
    _currentFontSize = null;
    _colorBlindMode = false;
    _textScaleFactor = null;
    _textBgColor = null;
    _headingColor =null;
    _textColor = null;
    _textBgColor = null;
    _scaldBgColor = null;
    _imageColor =null;
    _lineHeight =null; 
    _letterSpacing = null;
    _imageVisibility = false;
    _textAlignment = null;
    _fontWeight=null;
    notifyListeners();
  }
}
