import 'package:chat_app/screens/homeScreen.dart';
import 'package:chat_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
        if(snapshot.hasData){
          return const Homescreen();
        }
        else{
          return LoginScreen();
        }
      }),
    );
  }
}
