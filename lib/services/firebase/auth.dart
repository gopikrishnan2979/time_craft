import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/screens/home/home.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';

class Auth {
  Auth({required this.context});
  final BuildContext context;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  createNewUserWithEmailandPassword({
    required String email,
    required String password,
    required String phone,
    required String username,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        User? user = value.user;
        FirebaseInstanceModel.Uid = user!.uid;
        FirebaseInstanceModel.firestore.collection('users').doc(user.uid).set({
          'name': username,
          'email': email,
          'phone': phone,
          'image': user.photoURL,
        });
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(Home.routename);
        return value;
      });
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      alertshower(e);
    }
  }

  signInexistingWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(Home.routename);
        return value;
      });
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      alertshower(e);
    } catch (e) {
      log(e.toString());
    }
  }

  signInUsingGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((value) {
        User? user = value.user;
        FirebaseInstanceModel.firestore.collection('users').doc(user!.uid).set({
          'name': user.displayName,
          'email': user.email,
          'phone': user.phoneNumber,
          'image': user.photoURL,
        });
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(Home.routename);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  signOut() async {
    try {
      await _auth.signOut().then((value) {
        Navigator.popUntil(context, (route) => false);
        Navigator.of(context).pushNamed(SignInPage.routename);
      });
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      alertshower(e);
    } catch (e) {
      log(e.toString());
    }
  }

  alertshower(FirebaseException e) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: Text(e.message ?? ''),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
