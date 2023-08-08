import 'package:flutter/material.dart';

//controller for providing the obsecureing the contents such as passwords
class ObsecureController extends ChangeNotifier {
  bool isObsecure = true;
  void toggleObsecure() {
    isObsecure = !isObsecure;
    notifyListeners();
  }
}
