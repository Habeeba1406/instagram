import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/instagram/data/firebase_service/firestore.dart';
import 'package:instagram/instagram/data/firebase_service/storage.dart';
import 'package:instagram/instagram/util/exception.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> Login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseException catch (e) {
      throw exception(e.message.toString());
    }
  }

  Future<void> Signup({
    required String email,
    required String password,
    required String passwordconfirme,
    required String username,
    required String bio,
    required File profile,
  }) async {
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          passwordconfirme.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        if (password == passwordconfirme) {
          await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );

          //upload profile image on storage
          if (profile != File('')) {
            URL =
                await StorageMethod().uploadImageToStorage('Profile', profile);
          } else {
            URL = '';
          }

          //get information with firestore
          await Firebase_Firestore().CreateUser(
              email: email,
              username: username,
              bio: bio,
              profile: URL == ''
                  ? 'https://firebasestorage.googleapis.com/v0/b/fir-cli-a7a20.appspot.com/o/person.png?alt=media&token=586d8597-5aea-46f4-b605-1e2bd86085c6'
                  : URL);
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


// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instagram/data/firebase_service/firestore.dart';
// import 'package:instagram/data/firebase_service/storage.dart';
// import 'package:instagram/util/exception.dart';

// class Authentication {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   Future<void> Signup({
//     required String email,
//     required String password,
//     required String passwordconfirme,
//     required String username,
//     required String bio,
//     required File profile,
//   }) async {
//     String URL;
//     try {
//       if (email.isNotEmpty &&
//           password.isNotEmpty &&
//           username.isNotEmpty &&
//           bio.isNotEmpty) {
//         if (password == passwordconfirme) {
//           await _auth.createUserWithEmailAndPassword(
//             email: email.trim(),
//             password: password.trim(),
//           );

//           ///upload profile on storage
//           if (profile != File('')) {
//             URL =
//                 await StorageMethod().uploadImageToStorage('profile', profile);
//           } else {
//             URL = '';
//           }

//           ///get information with firestore
//           await Firebase_Firestore().CreateUser(
//             email: email,
//             username: username,
//             fullname: fullname,
//             profile: URL == ''
//                 ? 'https://console.firebase.google.com/u/1/project/fir-cli-a7a20/storage/fir-cli-a7a20.appspot.com/files'
//                 : URL,
//           );
//         } else {
//           throw exception('password and confirm password should be same');
//         }
//       } else {
//         throw exception('enter all the fields');
//       }
//     } on FirebaseException catch (e) {
//       throw exception(e.message.toString());
//     }
//   }
// }
