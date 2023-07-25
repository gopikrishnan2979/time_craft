import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/screens/home/home.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';

class SplashScreen extends StatelessWidget {
  static const routename = '/';
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait(context);
    });
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    ));
  }

  wait(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    Timer(const Duration(milliseconds: 2000), () {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed(SignInPage.routename);
      } else {
        FirebaseInstanceModel.uid = user.uid;
        Navigator.of(context).pushReplacementNamed(Home.routename);
      }
    });
  }
}
