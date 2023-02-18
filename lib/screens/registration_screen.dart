import 'package:flashchat_dummy/constants.dart';
import 'package:flashchat_dummy/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat_dummy/components/rounded_btns.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isSpinning = false;
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24,
              ),
              RoundedButtons(
                  colour: Colors.blueAccent,
                  btnTitle: 'Register',
                  onpress: (() async {
                    setState(() {
                      isSpinning = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email.toString(),
                              password: password.toString());
                      if (newUser != null) {
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
