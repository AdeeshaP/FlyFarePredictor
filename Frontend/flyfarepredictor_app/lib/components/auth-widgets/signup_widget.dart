import 'package:flyfarepredictor_app/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../screens/home_screen.dart';

class SignUpDetailsWidget extends StatefulWidget {
  const SignUpDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpDetailsWidgetState createState() => _SignUpDetailsWidgetState();
}

class _SignUpDetailsWidgetState extends State<SignUpDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      // color: signupFormBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
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
          Text(
            "CREATE YOUR ACCOUNT",
            style: TextStyle(
              color: Colors.amberAccent[400],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Container(
                height: 45,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "User Name",
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(10.0),
                    //   ),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Container(
            height: 45,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
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
              keyboardType: TextInputType.visiblePassword,
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
          SizedBox(height: 7),
          Container(
            height: 45,
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Confirm Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.0),
                ),
              ),
            ),
          ),
          Divider(thickness: 2, height: 35),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 45),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              child: Text(
                "SIGN UP",
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
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: "Do you already have an account? ",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0E0101),
                  fontWeight: FontWeight.w800,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "LOGIN",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0E0101),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
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
