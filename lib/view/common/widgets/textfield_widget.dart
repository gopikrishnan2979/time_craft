import 'package:flutter/material.dart';
import 'package:time_craft/services/validator/validator_textfield.dart';
import 'package:time_craft/view/core/styles.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.controller,
      this.passwordgiven,
      this.suffix,
      this.isobsecure = false,
      this.inputType = TextInputType.text,
      this.isemail = false,
      this.isname = false,
      this.ispassword = false,
      this.isconfirmpassword = false,
      this.isphone = false});
  final Widget? suffix;
  final bool isobsecure;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isname;
  final bool isemail;
  final bool ispassword;
  final bool isphone;
  final bool isconfirmpassword;
  final String? passwordgiven;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      obscureText: isobsecure,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: kwidth * 0.02),
          child: suffix ?? const SizedBox(),
        ),
        iconColor: black,
        hintText: hint,
        hintStyle: inter,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: black,
          ),
        ),
      ),
      validator: (value) => Validation().validation(
          value: value?.trim(),
          isname: isname,
          isemail: isemail,
          ispassword: ispassword,
          isphone: isphone,
          password: passwordgiven,
          isconfirmpassword: isconfirmpassword),
    );
  }
}


