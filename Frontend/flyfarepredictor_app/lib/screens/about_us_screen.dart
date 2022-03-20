// ignore: file_names
import 'package:flyfarepredictor_app/components/bottom-nav-bar/bottom_nav.dart';
import 'package:flyfarepredictor_app/components/clippers/main_ui_clipper.dart';
import 'package:flyfarepredictor_app/components/drawer/drawer_list.dart';
import 'package:flyfarepredictor_app/components/menu-icon/menu_icon_box.dart';

import '../components/about-us-widget/about_us_body.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  static const routeName = '/aboutUs';

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: scaffoldBgColor,
      bottomNavigationBar: BottomNavBar(),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AboutUsAppBar(scaffoldKey: _scaffoldKey),
            Divider(thickness: 5),
            AboutUsBody()
          ],
        ),
      ),
    );
  }
}

class AboutUsAppBar extends StatelessWidget {
  const AboutUsAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            child: Image.asset(
              "assets/images/airlines7.jpg",
              height: uiAppBarImageHeight,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MenuIconBox(scaffoldKey: _scaffoldKey),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: uiTitleFontSize,
                      color: Color.fromARGB(133, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
