import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controllers/wishlist_controller.dart';
import 'package:time_craft/services/firebase/auth.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/home/home.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {super.key,
      required this.formkey,
      required this.emailcontroller,
      required this.passwordcontroller});
  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: khieght * 0.0),
            child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    loading(context);
                    String? error = await Auth().signInexistingWithEmailAndPassword(
                        email: emailcontroller.text, password: passwordcontroller.text);
                    if (context.mounted) {
                      if (error == null) {
                        await Provider.of<WishlistController>(context, listen: false).getwishlist();
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed(Home.routename);
                        }
                      } else {
                        Navigator.of(context).pop();
                        alertshower(context: context, text: error);
                      }
                    }
                  }
                },
                style: buttonstyle(),
                child: buttonchild(text: 'Sign In')),
          ),
          Text(
            'or',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () async {
                loading(context);
                String? error = await Auth().signInUsingGoogle();
                if (context.mounted && error == null) {
                  await Provider.of<WishlistController>(context, listen: false).getwishlist();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed(Home.routename);
                  }
                }
              },
              style: buttonstyle(),
              child: buttonchild(text: 'Continue with google'))
        ],
      ),
    );
  }

  Widget buttonchild({required String text}) {
    return SizedBox(
      width: kwidth * 0.7,
      height: khieght * 0.05,
      child: Center(
        child: Text(text, style: interwhitebold),
      ),
    );
  }

  ButtonStyle buttonstyle() {
    return ButtonStyle(
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      backgroundColor: const MaterialStatePropertyAll(black),
    );
  }

  loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: khieght * 0.2,
          child: Center(
            child: SizedBox(
              height: khieght * 0.05,
              width: khieght * 0.05,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
