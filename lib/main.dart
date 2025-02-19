import 'package:chat_app/auth/auth_gate.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: lightMode,
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
