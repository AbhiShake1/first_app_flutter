import 'package:first_app_flutter/util/Routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
          title: "Welcome".text.xl3.italic.bold.make(),
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
                "Welcome $_name!"
                    .text
                    .bold
                    .color(Colors.blueAccent)
                    .underline
                    .xl5
                    .textStyle(
                      TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 100,
                            color: Colors.purple,
                          )
                        ],
                      ),
                    )
                    .make(),
                30.heightBox,
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                      onChanged: (v) => setState(() => _name = v),
                      validator: (v) =>
                          v!.isEmpty ? "Username can not be empty" : null,
                    ),
                    TextFormField(
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
                  ],
                ).py20().px64(),
                20.heightBox,
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => _animateLogin = false);
                      await Future.delayed(
                        Duration(
                          seconds: 1,
                        ),
                      );
                      // do not push to stack, replace with previous screen
                      await context.navigator?.pushReplacementNamed(Routes.home);
                      //await Navigator.pushNamed(context, Routes.home);
                      // restore changed button props on back
                      //setState(() => _animateLogin = true);
                    }
                  },
                  // could remove check if we cant go back to login page with same state
                  customBorder:
                      _animateLogin ? CircleBorder() : StadiumBorder(),
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
                      child: !_animateLogin
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : "LOGIN"
                              .text
                              .scale(2)
                              .maxLines(1)
                              .white
                              .italic
                              .makeCentered()),
                ).box.blue500.rounded.make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
