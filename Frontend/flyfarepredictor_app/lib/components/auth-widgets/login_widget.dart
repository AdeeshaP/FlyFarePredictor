import 'package:flyfarepredictor_app/screens/home_screen.dart';
import 'package:flyfarepredictor_app/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginDetailsWidget extends StatefulWidget {
  const LoginDetailsWidget({Key? key}) : super(key: key);

  @override
  _LoginDetailsWidgetState createState() => _LoginDetailsWidgetState();
}

class _LoginDetailsWidgetState extends State<LoginDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 60),
          Image.asset(
            "assets/images/aircraft.png",
            alignment: Alignment.center,
            height: 130,
            width: 130,
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(
              "FlyFarePredictor",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF3811D2),
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: 45,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Container(
            height: 45,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.0),
                ),
              ),
            ),
          ),
          Divider(thickness: 2, height: 40),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 45),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              child: Text(
                "LOGIN",
                style: TextStyle(
                  color: Color(0xFFFEF7F7),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
              ),
            ),
          ),
          SizedBox(height: 100),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: "Don't you have an account? ",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0E0101),
                  fontWeight: FontWeight.w800,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "REGISTER",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0E0101),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignUpScreen.routeName);
                      },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
