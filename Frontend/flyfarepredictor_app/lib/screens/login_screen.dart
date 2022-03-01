import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyfarepredictor_app/screens/home_screen.dart';
import 'package:flyfarepredictor_app/screens/signup_screen.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  String? errMessage;

  @override
  Widget build(BuildContext context) {
    // Widget for email form field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // regular expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Email",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
        ),
      ),
    );

    // Widget for password form field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
        ),
      ),
    );

    final loginButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 45),
      child: ElevatedButton(
        onPressed: () {
          signIn(emailController.text, passwordController.text);
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
    );

    return Scaffold(
      backgroundColor: loginBgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
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
                  child: emailField,
                ),
                SizedBox(height: 7),
                Container(
                  height: 45,
                  child: passwordField,
                ),
                Divider(thickness: 2, height: 40),
                loginButton,
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
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  )),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errMessage!);
        print(error.code);
      }
    }
  }
}
