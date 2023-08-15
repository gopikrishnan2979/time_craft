import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/network_controllers/network_connectivity.dart';
import 'package:time_craft/services/firebase/userdata_getter.dart';
import 'package:time_craft/controller/wishlist_controllers/wishlist_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/screens/home/home.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';

class SplashScreen extends StatelessWidget {
  static const routename = '/';
  const SplashScreen({super.key});

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
      ),
    );
  }

  wait(BuildContext context) async {
    Provider.of<NetworkConnectivity>(context, listen: false).init();
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed(SignInPage.routename);
      });
    } else {
      FirebaseInstances.uid = user.uid;
      await collectUserData( uid: user.uid);
      if (context.mounted) {
        await Provider.of<WishlistController>(context, listen: false).getwishlist();
      }
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed(Home.routename);
      });
    }
  }
}
