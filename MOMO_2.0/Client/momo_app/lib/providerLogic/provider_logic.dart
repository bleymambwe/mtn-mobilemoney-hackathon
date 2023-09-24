import 'package:flutter/material.dart';

class SendReceiveProvider extends ChangeNotifier {
  bool isSendPressed = false;
  bool isReceivePressed = true;

  void setSendPressed(bool value) {
    isSendPressed = value;
    notifyListeners(); // Notify listeners when the state changes
    print('Send $isReceivePressed');
  }

  void setReceivePressed(bool value) {
    isReceivePressed = value;
    notifyListeners();
    print(
        'Received $isReceivePressed'); // Notify listeners when the state changes
  }
}
