import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/user_editor_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/common/widgets/textfield_widget.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/address/widgets/address_adding.dart';

class UserDataEditor extends StatelessWidget {
  final bool isname;
  final String initialText;
  final BuildContext ctx;
  final bool isFromHome;
  const UserDataEditor({
    super.key,
    this.isname = false,
    required this.initialText,
    required this.ctx,
    this.isFromHome = false,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserEditingController>(context, listen: false).editingController;
    return AlertDialog(
      title: Text(isname ? 'Name' : 'Phone'),
      content: Form(
        key: formkey,
        child: TextFieldCustom(
          hint: isname ? 'Name' : 'Phone',
          controller: controller,
          isname: isname,
          isphone: !isname,
          inputType: isname ? TextInputType.name : TextInputType.number,
        ),
      ),
      actions: [
        isFromHome
            ? const SizedBox()
            : TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              change(value: controller.text.trim(), context: context);
            },
            child: const Text('Change'))
      ],
    );
  }

  change({required String value, required BuildContext context}) {
    if (formkey.currentState!.validate()) {
      if (isname) {
        usernameChange(value: value, isname: true, context: ctx);
      } else {
        usernameChange(value: value, isname: false, context: ctx);
      }
      Navigator.of(context).pop();
    }
  }

  usernameChange(
      {required String value, required bool isname, required BuildContext context}) async {
    Map<String, dynamic> data = isname ? {'name': value} : {'phone': value};
    await FirebaseInstances.user
        .doc(FirebaseInstances.uid)
        .set(data, SetOptions(merge: true))
        .then((_) {
      
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBarDesign(text: 'Successfully changed', color: addingColor));
    });
  }
}
