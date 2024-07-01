import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/splash.dart';

const Save_Key_Name = "UserLoggedIn";

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'First App',
      // home: HomeScreen(),
      // home: LoginScreen(),
      home: SplashScreen(),
    );
  }
}