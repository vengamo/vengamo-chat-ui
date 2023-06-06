import 'package:flutter/material.dart';

class SendButtonProvider with ChangeNotifier {
  bool _isInputEmpty = true;

  bool get isInputEmpty => _isInputEmpty;

  void setInputEmpty(bool newValue) {
    _isInputEmpty = newValue;
    notifyListeners();
  }
}
