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
    return Material(
      color: context.backgroundColor,
      child: SingleChildScrollView(
        // wrapping in scroll view also avoids pixel/bottom overflow
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.white,
              ),
              VxArc(
                height: 35,
                arcType: VxArcType.CONVEY,
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              "Welcome $_name!"
                  .text
                  .bold
                  .color(context.accentColor)
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
                  VxTextField(
                    labelText: "Username",
                    hint: "Enter username",
                    style: TextStyle(
                      color: context.theme.focusColor,
                    ),
                    onChanged: (v) => setState(() => _name = v),
                    validator: (v) =>
                        v!.isEmpty ? "Username can not be empty" : null,
                  ),
                  VxTextField(
                    labelText: "Password",
                    hint: "Enter password",
                    // dont show typed text (show dots like password fields)
                    obscureText: true,
                    // show view password icon
                    isPassword: true,
                    style: TextStyle(
                      color: context.theme.focusColor,
                    ),
                    validator: (v) => v!.isEmpty
                        ? "Username can not be empty"
                        : v.length < 8
                            ? "Password must contain at least 8 letters"
                            : null,
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
                    await context.vxNav.clearAndPush(
                      Uri.parse(Routes.home),
                    );
                    //await Navigator.pushNamed(context, Routes.home);
                    // restore changed button props on back
                    //setState(() => _animateLogin = true);
                  }
                },
                // could remove check if we cant go back to login page with same state
                customBorder: _animateLogin ? CircleBorder() : StadiumBorder(),
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
              ).box.color(context.accentColor).rounded.make(),
            ],
          ),
        ),
      ),
    );
  }
}
