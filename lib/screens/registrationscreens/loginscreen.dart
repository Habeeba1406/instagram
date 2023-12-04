import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;
  LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              width: 50,
            ),
            Center(
                child: Image.asset(
              'assets/images/logo.jpg',
            )),
            SizedBox(
              height: 40,
            ),
            Textfield(email, Icons.email, 'Email', email_f),
            SizedBox(height: 15),
            Textfield(password, Icons.lock, 'Password', password_f),
            SizedBox(
              height: 10,
            ),
            forgot(),
            SizedBox(
              height: 10,
            ),
            login(),
            SizedBox(
              height: 10,
            ),
            signup()
          ],
        ),
      ),
    );
  }

  Widget signup() {
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
              "Sign up ",
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

  Widget login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
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
          borderRadius: BorderRadius.circular(5),
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
