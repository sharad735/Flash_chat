import 'package:flashchat_dummy/components/rounded_btns.dart';
import 'package:flashchat_dummy/constants.dart';
import 'package:flashchat_dummy/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSpinning = false;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 200.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: kInputDecoration,
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButtons(
                  colour: Colors.lightBlueAccent,
                  btnTitle: 'Log In',
                  onpress: (() async {
                    setState(() {
                      isSpinning = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      isSpinning = false;
                    } catch (e) {
                      print(e);
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
