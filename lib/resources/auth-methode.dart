import 'dart:typed_data';

import 'package:mysaiph/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/user.dart'as model;


class AuthMethodes{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
    await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }
  Future<String> SignUPUser({
    required String email,
    required String password,
    required String pseudo,
    required String ville,
    required String phoneNumber,
    required String pharmacy,
    required String Datedenaissance,
    required Uint8List file,
    required String Verified,


  })async{
    String res = "some error occurred";
    try{
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          pseudo.isNotEmpty ||
          ville.isNotEmpty ||
          phoneNumber.isNotEmpty ||
          pharmacy.isNotEmpty ||
          Datedenaissance.isNotEmpty||

          file != null){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);

        //add user to database
        model.User user = model.User(
          pseudo: pseudo,
          uid: cred.user!.uid,
          email: email,
          followers: [],
          following: [],
          photoUrl: photoUrl,
          pharmacy:pharmacy,
          phoneNumber:phoneNumber,
          ville:ville,
          Datedenaissance: Datedenaissance,
          Verified: Verified,

        );
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson()
        );

        // await _firestore.collection('users').add({
        // 'pseudo': pseudo,
        //'uid': cred.user!.uid,

        //'email': email,

        //'followers': [],
        //'following': [],
        //});
        res = "success";
      } else {
        res = "Please enter all the fields";
      }

    }catch(err){
      res= err.toString();
    }
    return res;
  }
  Future<String> updateUser({
    required String pseudo,
    required String ville,
    required String phoneNumber,
    required String pharmacy,
    required String Datedenaissance,
    required Uint8List file,
    required String Verified,


    String? newEmail, // New email parameter
    String? newPassword,  // New password parameter
  }) async {
    String res = "Some error occurred";
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        // If a new email is provided, update the email
        if (newEmail != null && newEmail.isNotEmpty) {
          await currentUser.updateEmail(newEmail);
        }

        // If a new password is provided, update the password
        if (newPassword != null && newPassword.isNotEmpty) {
          await currentUser.updatePassword(newPassword);
        }

        // Create a map with updated user data (excluding email and password)
        Map<String, dynamic> updatedUserData = {
          'pseudo': pseudo,
          'ville': ville,
          'phoneNumber': phoneNumber,
          'pharmacy': pharmacy,
          'Datedenaissance': Datedenaissance,
          'Verified': Verified,
          'email':newEmail,

        };

        // Update the user's data in Firestore
        await _firestore.collection('users').doc(currentUser.uid).update(updatedUserData);

        res = "success";
      } else {
        res = "User not logged in";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
        print("sucess");
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }


}