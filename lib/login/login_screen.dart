import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home.dart';


import 'forgot_pw.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  
  const LoginScreen({Key?key,required this.showRegisterPage}) :super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();


  Future signIn() async{
    showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator());
      }
      );




    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
       password: _passwordController.text.trim());

       

       Navigator.of(context).pop();
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text("Hello Buddy!",
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  
                  fontSize: 20,
                ), ),
          
                SizedBox(height: 10,),
          
                Text("Welcome Back, Have a nice day!",
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
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   
                    
                     child: GestureDetector(
                      
                      onTap: signIn,
                       child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text('Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),)),
                       ),
                     
                   ),
                 ),
                 SizedBox(height: 10,),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                          },
                          
                          ),
                          );
                        },
                         child: Text('Forgot Password?',
                         style: TextStyle(
                                             color: Colors.blue,
                                             fontWeight: FontWeight.bold,
                                           ),),
                       ),
                     ],
                   ),
                 ),
          
                SizedBox(height: 25,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  
                
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(' Register now',
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