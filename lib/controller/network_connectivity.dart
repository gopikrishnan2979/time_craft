import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectivity extends ChangeNotifier {
  bool isConnectedToNetwork = false;

  //initialising the connection and checking the network for the first time
  init() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnectedToNetwork = true;
    }
    checkConnectivity();
    notifyListeners();
  }

  //Listening for the connection status weather active or not
  checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if ((result == ConnectivityResult.mobile) || (result == ConnectivityResult.wifi)) {
        isConnectedToNetwork = true;
        notifyListeners();
      } else {
        isConnectedToNetwork = false;
        notifyListeners();
      }
    });
  }
}
