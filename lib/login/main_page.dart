import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/login/authPage.dart';
import 'package:to_do_app/login/login_screen.dart';
import 'package:to_do_app/screens/home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Home();
          }
          else{
            return AuthPage();
          }

        }
        ),
    );
    
  }
}