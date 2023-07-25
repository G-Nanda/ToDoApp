import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/login/main_page.dart';








void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
    runApp(const MyApp());
}
  




class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:Colors.transparent 
        )
        
        );
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home:MainPage(),
    );
  }
}
