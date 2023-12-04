import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/data/firebase_service/firebase_auth.dart';
import 'package:instagram/util/dialog.dart';
import 'package:instagram/util/exception.dart';

class signupScreen extends StatefulWidget {
  final VoidCallback show;
  const signupScreen(this.show, {super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();
  final name = TextEditingController();
  FocusNode name_f = FocusNode();
  final username = TextEditingController();
  FocusNode username_f = FocusNode();
  final passwordconfirm = TextEditingController();
  FocusNode passwordconfirm_f = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.jpg',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(
                  'assets/images/person.png',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Textfield(username, Icons.person, 'Username', username_f),
            SizedBox(
              height: 16,
            ),
            Textfield(name, Icons.person, 'Full name', name_f),
            SizedBox(
              height: 16,
            ),
            Textfield(email, Icons.email, 'Email / Phone number', email_f),
            SizedBox(
              height: 16,
            ),
            Textfield(password, Icons.lock, 'Password', password_f),
            SizedBox(
              height: 16,
            ),
            Textfield(passwordconfirm, Icons.lock, 'confirm password',
                passwordconfirm_f),
            SizedBox(
              height: 16,
            ),
            signup(),
            const SizedBox(
              height: 10,
            ),
            Have(),
          ],
        ),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Don't have account ?",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              "Login ",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget signup() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async {
          try {
            await Authentication().Signup(
                email: email.text,
                password: password.text,
                passwordconfirm: passwordconfirm.text,
                username: username.text,
                fullname: name.text,
                profile: File(''));
          } on exception catch (e) {
            dialogBuilder(context, e.message);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Text(
            'sign up',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget forgot() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot password ?',
            style: TextStyle(
              fontSize: 13,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget Textfield(TextEditingController controller, IconData icon,
      String typename, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: 470,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
              hintText: typename,
              prefixIcon: Icon(
                icon,
                color: focusNode.hasFocus ? Colors.black : Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 139, 136, 136),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ))),
        ),
      ),
    );
  }
}
