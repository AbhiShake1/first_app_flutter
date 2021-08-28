import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatelessWidget {
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
        body: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.scaleDown,
            ),
            Text(
              "Welcome!",
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
            ElevatedButton(
              onPressed: () => print("elevated button pressed"),
              child: Text(
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
                      BorderRadius.circular(10), // make edges a bit rounded
                ),
                backgroundColor: Colors.lightBlueAccent,
                minimumSize: Size(200, 50), //200 width, 50 height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
