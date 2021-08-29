import 'package:first_app_flutter/util/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _name = "", _animateLogin = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "First Flutter App",
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
          child: Form(
            key: _formKey,
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
                            setState(() => _name = v);
                          },
                          validator: (v) =>
                              v!.isEmpty ? "Username can not be empty" : null,
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Password",
                          ),

                          validator: (v) => v!.isEmpty
                              ? "Username can not be empty"
                              : v.length < 8
                                  ? "Password must contain at least 8 letters"
                                  : null,
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
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(_animateLogin ? 30 : 50),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _animateLogin = false);
                        await Future.delayed(
                          Duration(
                            seconds: 1,
                          ),
                        );
                        await Navigator.pushNamed(context, Routes.home);
                        // restore changed button props on back
                        setState(() => _animateLogin = true);
                      }
                    },
                    // could remove check if we cant go back to login page with same state
                    customBorder:
                        _animateLogin ? StadiumBorder() : CircleBorder(),
                    // size indicator during ripple
                    highlightColor: Colors.transparent,
                    // ripple effect color
                    splashColor: Colors.lightGreenAccent,
                    child: AnimatedContainer(
                      duration: Duration(
                        seconds: 1,
                      ),
                      width: _animateLogin ? 130 : 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: !_animateLogin
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "LOGIN",
                              textScaleFactor: 2,
                              maxLines: 1,
                              //prevent weird effect when returning back from home
                              style: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
