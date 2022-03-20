import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyfarepredictor_app/components/drawer/drawer_list.dart';
import 'package:flyfarepredictor_app/models/user_model.dart';
import 'package:flyfarepredictor_app/screens/home_screen.dart';
import 'package:flyfarepredictor_app/screens/login_screen.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;

  String? errMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final userNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("User Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 5 Character)");
        }
        return null;
      },
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "User Name",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
        ),
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        userNameController.text = value!;
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

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Password is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password. (Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
        ),
      ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Password doesn't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Confirm Password",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
        ),
      ),
    );

    final signUpButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 45),
      child: MaterialButton(
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        color: buttonColor,
        child: Text(
          "SIGN UP",
          style: TextStyle(
            color: Color(0xFFFEF7F7),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        // style: ElevatedButton.styleFrom(
        //   primary: buttonColor,
        // ),
      ),
    );

    return Scaffold(
      backgroundColor: loginBgColor,
      drawer: AppDrawer(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
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
                Container(
                  height: 45,
                  child: userNameField,
                ),
                SizedBox(height: 7),
                Container(
                  height: 45,
                  child: emailField,
                ),
                SizedBox(height: 7),
                Container(
                  height: 45,
                  child: passwordField,
                ),
                SizedBox(height: 7),
                Container(
                  height: 45,
                  child: confirmPasswordField,
                ),
                Divider(thickness: 2, height: 35),
                signUpButton,
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
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        print(email);
        print(password);
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.userName = userNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "New User Created Successfully.) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
