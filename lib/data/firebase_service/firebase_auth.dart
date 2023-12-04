import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/data/firebase_service/firestore.dart';
import 'package:instagram/data/firebase_service/storage.dart';
import 'package:instagram/util/exception.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> Signup({
    required String email,
    required String password,
    required String passwordconfirm,
    required String username,
    required String fullname,
    required File profile,
  }) async {
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          fullname.isNotEmpty) {
        if (password == passwordconfirm) {
          await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

          ///upload profile on storage
          if (profile != File('')) {
            URL =
                await StorageMethod().uploadImageToStorage('profile', profile);
          } else {
            URL = '';
          }

          ///get information with firestore
          await Firebase_Firestore().CreateUser(
            email: email,
            username: username,
            fullname: fullname,
            profile: URL == ''
                ? 'https://console.firebase.google.com/u/1/project/fir-cli-a7a20/storage/fir-cli-a7a20.appspot.com/files'
                : URL,
          );
        } else {
          throw exception('password and confirm password should be same');
        }
      } else {
        throw exception('enter all the fields');
      }
    } on FirebaseException catch (e) {
      throw exception(e.message.toString());
    }
  }
}
