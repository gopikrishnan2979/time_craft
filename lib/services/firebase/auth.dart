import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/services/firebase/userdata_getter.dart';

//Firebase auth service
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

// --------------------------create new user with email
  Future<String?> createNewUserWithEmailandPassword({
    required String email,
    required String password,
    required String phone,
    required String username,
  }) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async{
        User? user = value.user;
        FirebaseInstances.uid = user!.uid;
        bool didGetUser=await collectUserData( uid: user.uid);
        FirebaseInstances.user.doc(user.uid).set({
          'name': username,
          'email': email,
          'phone': phone,
          'image': user.photoURL,
        }, SetOptions(merge: true));
        if (didGetUser) {
          return 'error occured in collecting user data';
        }
        return null;
      });
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }

//--------------------------signing in to a existing account with email
  Future<String?> signInexistingWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        FirebaseInstances.uid = value.user!.uid;
        bool didGetUser=await collectUserData( uid: value.user!.uid);
        if (didGetUser) {
          return 'error occured in collecting user data';
        }
        return null;
      });
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }

//-------------------------Sign in using google credentials
  Future<String?> signInUsingGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return await _auth.signInWithCredential(credential).then((value) async {
        User? user = value.user;
        FirebaseInstances.uid = user!.uid;
        bool didGetUser = await collectUserData(uid: user.uid);
        
        FirebaseInstances.user.doc(user.uid).set({
          'name': user.displayName,
          'email': user.email,
          'phone': user.phoneNumber,
          'image': user.photoURL,
        }, SetOptions(merge: true));
        if (didGetUser) {
          return 'error occured in collecting user data';
        }
        return null;
      });
    } on FirebaseException catch (e) {
      return e.message ?? '';
    } catch (e) {
      return e.toString();
    }
  }

// ---------------------------------signout fromt the app
  Future<String?> signOut() async {
    try {
      return await _auth.signOut().then((value) {
        FirebaseInstances.uid;
        FirebaseInstances.userEmail = null;
        FirebaseInstances.userName = null;
        FirebaseInstances.userPhone = null;
        return null;
      });
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }

//---------------password reseting feature for reset the password as the user forget the password

  Future<String?> resetPassword({required String email}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email).then((value) => null);
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }
}
