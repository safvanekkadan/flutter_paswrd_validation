import 'package:flutter/material.dart';

class SuccessProvider extends ChangeNotifier {
  bool _success = false;

  bool get success => _success;

  void setSuccess(bool value) {
    _success = value;
    notifyListeners();
  }
}
