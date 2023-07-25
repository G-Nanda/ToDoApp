import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override

  final _emailController=TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim());
      showDialog(
        context: context,
         builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
         },
         );
      
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(
        context: context,
         builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
         }
         );
    }

  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Enter your Email and we will send you a password reset link",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,),),
          ),
          SizedBox(height: 10,),
          Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Email",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  onPressed: passwordReset,
                child: Text("Reset Password"),
                color:Colors.deepPurple
                ),
        ],
      ),
    );
  }
}