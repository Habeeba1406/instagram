import 'package:flutter/material.dart';
import 'package:instagram/instagram/Screens/registrationScreens/loginScreen.dart';
import 'package:instagram/instagram/Screens/registrationScreens/signupScreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void go() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return loginScreen(go);
    } else {
      return SignupScreen(go);
    }
  }
}
