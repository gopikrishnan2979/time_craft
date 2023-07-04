import 'package:flutter/material.dart';
import 'package:time_craft/services/firebase/auth.dart';
import 'package:time_craft/view/core/styles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller,
      required this.namecontroller,
      required this.phonecontroller,
      required this.formkey});
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController namecontroller;
  final TextEditingController passwordcontroller;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  content: SizedBox(
                    height: khieght * 0.2,
                    child: Center(
                      child: SizedBox(
                          height: khieght * 0.05,
                          width: khieght * 0.05,
                          child: const CircularProgressIndicator()),
                    ),
                  ),
                ),
              );
              Auth(context: context).createNewUserWithEmailandPassword(
                  email: emailcontroller.text.trim(),
                  password: passwordcontroller.text.trim(),
                  phone: phonecontroller.text.trim(),
                  username: namecontroller.text.trim());
            }
            // validationController.validationbuilder();
            // Navigator.of(context).pushReplacementNamed(Home.routename);
          },
          style: buttonstyle(),
          child: buttonchild(text: 'Sign Up')),
    );
  }

  Widget buttonchild({required String text}) {
    return SizedBox(
      width: kwidth * 0.7,
      height: khieght * 0.05,
      child: Center(
        child: Text(
          text,
          style: interwhitebold,
        ),
      ),
    );
  }

  ButtonStyle buttonstyle() {
    return ButtonStyle(
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        backgroundColor: const MaterialStatePropertyAll(black));
  }
}
