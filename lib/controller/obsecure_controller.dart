import 'package:flutter/material.dart';

class ObsecureController extends ChangeNotifier {
  bool isObsecure = true;
  void toggleObsecure() {
    isObsecure = !isObsecure;
    notifyListeners();
  }
}
