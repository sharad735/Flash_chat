import 'package:flashchat_dummy/screens/welcome_screen.dart';
import 'package:flashchat_dummy/screens/registration_screen.dart';
import 'package:flashchat_dummy/screens/login_screen.dart';
import 'package:flashchat_dummy/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat_dummy/firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => WelcomeScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        ChatScreen.id:(context) => ChatScreen(),
      },
    );
  }
}
