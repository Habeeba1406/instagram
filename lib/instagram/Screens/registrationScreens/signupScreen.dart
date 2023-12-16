import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/instagram/Screens/HomeScreens/homepage.dart';
import 'package:instagram/instagram/data/firebase_service/firebase_auth.dart';
import 'package:instagram/instagram/util/dialog.dart';
import 'package:instagram/instagram/util/exception.dart';
import 'package:instagram/instagram/util/imgpicker.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;
  SignupScreen(this.show, {super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();
  final passwordConfirme = TextEditingController();
  FocusNode passwordConfirme_F = FocusNode();
  final username = TextEditingController();
  FocusNode username_F = FocusNode();
  final bio = TextEditingController();
  FocusNode bio_F = FocusNode();
  File? _imageFile;
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 96.w,
              height: 10.h,
            ),
            Center(
              child: Image.asset('assets/images/logo.jpg'),
            ),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  File _imagefilee =
                      await ImagePickerr().uploadImage('gallery');
                  setState(() {
                    _imageFile = _imagefilee;
                  });
                },
                child: CircleAvatar(
                  radius: 36.r,
                  backgroundColor: Colors.grey,
                  child: _imageFile == null
                      ? CircleAvatar(
                          radius: 32.r,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage:
                              AssetImage("assets/images/person.png"),
                        )
                      : CircleAvatar(
                          radius: 32.r,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ).image),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Textfield(
              email,
              Icons.email,
              'Email',
              email_f,
            ),
            SizedBox(
              height: 15.h,
            ),
            Textfield(
              username,
              Icons.lock_person,
              'Username',
              username_F,
            ),
            SizedBox(
              height: 15.h,
            ),
            Textfield(
              bio,
              Icons.abc,
              'Bio',
              bio_F,
            ),
            SizedBox(
              height: 15.h,
            ),
            Textfield(
              password,
              Icons.lock,
              'Password',
              password_f,
            ),
            SizedBox(
              height: 15.h,
            ),
            Textfield(
              passwordConfirme,
              Icons.lock,
              'Confirm Password',
              passwordConfirme_F,
            ),
            SizedBox(
              height: 20.h,
            ),
            Signup(),
            SizedBox(
              height: 10.h,
            ),
            Have()
          ],
        ),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Do you have account?",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Signup() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: InkWell(
        onTap: () async {
          try {
            await Authentication().Signup(
              email: email.text,
              password: password.text,
              passwordconfirme: passwordConfirme.text,
              username: username.text,
              bio: bio.text,
              profile: File(''),
            );
          } on exception catch (e) {
            dialogBuilder(context, e.message);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: GestureDetector(
            onTap: () => HomeScreen(),
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 23.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Textfield(TextEditingController controller, IconData icon, String type,
      FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: TextField(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: type,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.black : Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
