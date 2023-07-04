import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/view/screens/home/home.dart';
import 'package:time_craft/view/screens/signin_signup/signin/signin.dart';

class Auth {
  Auth({required this.context});
  final BuildContext context;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  createNewUserWithEmailandPassword({
    required String email,
    required String password,
    required String phone,
    required String username,
  }) {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        User? user = value.user;
        _firestore.collection('users').doc(user!.uid).set({
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Alert'),
          content: Text(e.message ?? ''),
        ),
      );
    }
  }

  signInexistingWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(Home.routename);
        return value;
      });
    } on FirebaseException catch (e) {
      log(e.message ?? '');
      Navigator.of(context).pop();
      alertshower(e);
    } catch (e) {
      log(e.toString());
    }
  }

  signOut() {
    try {
      _auth.signOut().then((value) {
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
