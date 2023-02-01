import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  // int _count = 0;
  // int get count => _count;
  bool _isDark = true;
  bool get isDark => _isDark;

  void goDark() {
    _isDark = ! _isDark;
    notifyListeners();
  }

}