import 'package:first_app_flutter/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool _animateLogin = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "This is login page text",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // wrapping in scroll view also avoids pixel/bottom overflow
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.scaleDown,
              ),
              Text(
                "Welcome $_name!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                  shadows: [
                    Shadow(
                      blurRadius: 100,
                      color: Colors.purple,
                    )
                  ],
                ),
                textScaleFactor: 3.0, // original size * 3
              ),
              SizedBox(
                height: 30,
              ), // empty box for spacing (didnt use padding on purpose)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 60,
                ),
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Enter Username",
                        ),
                        onChanged: (v) {
                          _name = v;
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Password",
                        ),
                        obscureText:
                            true, // dont show typed text (show dots like password fields)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => _animateLogin = false);
                    Navigator.pushNamed(context, Routes.home);
                  },
                  // open home intent on top
                  child: !_animateLogin ? Icon(Icons.done) : Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    textScaleFactor: 2,
                  ),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(_animateLogin ? 10 : 80), // make edges a bit rounded
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                    minimumSize: Size(_animateLogin ? 200 : 20, 50), //200 width, 50 height
                    shadowColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
