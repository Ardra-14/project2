import 'package:flutter/material.dart';
import 'package:my_app/screens/login.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 129, 151),
      body: Center(
        child: Image.asset("assets/2.jpg",
        height: 1000,
        ),       
      ),
    );
  }
  

  Future<void> gotoLogin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }));
  }
}