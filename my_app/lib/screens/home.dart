import 'package:flutter/material.dart';
import 'package:my_app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions:[ 
          IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){
            signOut(context);
          },
        ),
        ],
        title: Text('Home'),
        backgroundColor: const Color.fromARGB(255, 100, 5, 36),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page',
            style: TextStyle(
              fontSize: 20,
            ),
            )
          ],
        ),
      ),
    );
  }
  void signOut(BuildContext ctxt) async{
    final _sharedprefs = await SharedPreferences.getInstance();
    _sharedprefs.clear();

    Navigator.of(ctxt).pushAndRemoveUntil(MaterialPageRoute(builder: (cntx)=>LoginScreen()), (route)=>false);
  }
}