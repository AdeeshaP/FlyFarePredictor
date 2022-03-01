import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flyfarepredictor_app/constants.dart';
import 'package:flyfarepredictor_app/screens/about_us_screen.dart';
import 'package:flyfarepredictor_app/screens/contact_us_screen.dart';
import 'package:flyfarepredictor_app/screens/home_screen.dart';
import 'package:flyfarepredictor_app/screens/login_screen.dart';
import 'package:flyfarepredictor_app/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: sideMenuBgColor,
      ),
      home: LoginScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
        ConatctScreen.routeName: (ctx) => ConatctScreen(),
      },
    );
  }
}
