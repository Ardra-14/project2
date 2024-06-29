import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
          backgroundColor: const Color.fromARGB(255, 100, 5, 36),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Color.fromARGB(255, 6, 53, 92),
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (_){
                      if(_isDataMatched){
                        return null;
                      }else{
                        return 'error';
                      }
                    },
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 127, 125),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 17, 102, 172),
                        ),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 56, 2, 34),
                        fontSize: 20,
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (_){
                      if(_isDataMatched){
                        return null;
                      }else{
                        return 'error';
                      }
                    },
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 128, 127, 125), width: 2),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          Icons.password,
                          color: const Color.fromARGB(255, 17, 102, 172),
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 56, 2, 34),
                        fontSize: 20,
                      ),
                      hintText: "Enter your password",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Color.fromARGB(255, 3, 58, 110)),
                    minimumSize: WidgetStateProperty.all(Size(20, 30)),
                    padding: WidgetStateProperty.all(EdgeInsets.all(20)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  onPressed: () {
                    _formKey.currentState!.validate();
                      checkLogin(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isDataMatched,
                  child: Text('Invalid username and password',
                  style: TextStyle(
                    color: Colors.red,
                  )
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void checkLogin(BuildContext ctxt) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //go to home
      Navigator.pushReplacement(ctxt, MaterialPageRoute(builder: (ctxt1){
        return HomeScreen();
      }));

    } else {
      //error message  using snackbar
      final _errorMessage = "Invalid username and password";

      ScaffoldMessenger.of(ctxt).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 231, 224, 181),
        duration: Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text(
          _errorMessage,
          style: TextStyle(color: Colors.black),
        ),
      ));

      //using alert dialog

      showDialog(
        context: ctxt,
        builder: (cxt){
          return AlertDialog(
            title: Text('Error'),
            content: Text(_errorMessage),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(cxt).pop();
              }, child: Text('close'))
            ],
          );
        }
      );
      //show text

      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
