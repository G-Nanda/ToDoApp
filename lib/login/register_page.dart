import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


 
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const RegisterPage({Key?key,required this.showLoginScreen}) :super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confirmPasswordController=TextEditingController();

  @override 
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim(),
          );  
    }  
  }

  bool passwordConfirmed() {
    if(_passwordController.text.trim()==_confirmPasswordController.text.trim()){
      return true;
    }
    else {
      return false;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: Text('Sign Up'),),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                Icon(
                  Icons.android,
                  size: 100,
                ),
               SizedBox(height: 75,),
                Text("Hello There!",
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  fontSize: 20,
                ), ),
          
                SizedBox(height: 10,),
          
                Text("Register below with your details",
                style: TextStyle(
                  
                  fontSize: 20,
                ),),
          
                SizedBox(height: 50,),
          
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
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Password",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  
                ),
          
                 SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Confirm Password",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  
                ),

                SizedBox(height: 10,),
          
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: GestureDetector(
                      onTap: signUp,
                    
                     child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),)),
                     ),
                   ),
                 ),
          
                SizedBox(height: 25,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Great to see you, Welcome! ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  
                
                  GestureDetector(
                    onTap:widget.showLoginScreen,
                    
                    child: Text(' Back ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  ],
                ),
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}