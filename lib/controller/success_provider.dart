import 'package:flutter/material.dart';

class SuccessProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  bool _success = false;

  bool get success => _success;

  void setSuccess(bool value) {
    _success = value;
    notifyListeners();
  }
}
