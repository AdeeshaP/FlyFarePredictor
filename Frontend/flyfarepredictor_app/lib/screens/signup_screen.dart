import 'package:flyfarepredictor_app/components/auth-widgets/signup_widget.dart';
import 'package:flyfarepredictor_app/components/drawer/drawer_list.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: loginBgColor,
      drawer: AppDrawer(),
      key: _scaffoldKey,
      body: ListView(
        children: <Widget>[
          SignUpDetailsWidget(),
        ],
      ),
    );
  }
}
