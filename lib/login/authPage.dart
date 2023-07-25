import 'package:flutter/material.dart';
import 'package:to_do_app/login/login_screen.dart';
import 'package:to_do_app/login/register_page.dart';



class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {



  bool showLoginScreen=true;

  void toggleScreens(){
    setState(() {
      showLoginScreen=!showLoginScreen;
    });


  }
  @override
  Widget build(BuildContext context) {
    if(showLoginScreen){
      return LoginScreen(showRegisterPage: toggleScreens);
    }
    else {
      return RegisterPage(showLoginScreen: toggleScreens);
    }
    
  }
}