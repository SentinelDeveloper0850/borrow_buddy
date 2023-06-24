import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    print("🚀 toggleDarkMode triggered");
    _isDarkMode = _isDarkMode ? false : true;
    notifyListeners();
  }
}
