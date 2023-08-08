import 'package:flutter/material.dart';


//-------------------------controller for editing user data
class UserEditingController extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();
  UserEditingController({required String initialData}) {
    editingController.text = initialData;
  }
}
