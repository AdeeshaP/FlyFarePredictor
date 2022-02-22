import 'package:flyfarepredictor_app/components/bottom-nav-bar/bottom_nav.dart';
import 'package:flyfarepredictor_app/components/clippers/main_ui_clipper.dart';
import 'package:flyfarepredictor_app/components/drawer/drawer_list.dart';
import 'package:flyfarepredictor_app/components/home-widget/home_body.dart';
import 'package:flyfarepredictor_app/components/menu-icon/menu_icon_box.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            HomeAppBar(scaffoldKey: _scaffoldKey),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
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
              "assets/images/airlines2.jpg",
              fit: BoxFit.fill,
              height: uiAppBarImageHeight,
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
                    "Home",
                    style: TextStyle(
                      fontSize: uiTitleFontSize,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
