import 'package:flutter/material.dart';

class UserEditingController extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();
  UserEditingController({required String initialData}) {
    editingController.text = initialData;
  }
}
