import 'package:flyfarepredictor_app/components/bottom-nav-bar/bottom_nav.dart';
import 'package:flyfarepredictor_app/components/clippers/main_ui_clipper.dart';
import 'package:flyfarepredictor_app/components/contactUs-widget/contact_us_body.dart';
import 'package:flyfarepredictor_app/components/drawer/drawer_list.dart';
import 'package:flyfarepredictor_app/components/menu-icon/menu_icon_box.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ConatctScreen extends StatefulWidget {
  const ConatctScreen({Key? key}) : super(key: key);
  static const routeName = '/contacts';

  @override
  _ConatctScreenState createState() => _ConatctScreenState();
}

class _ConatctScreenState extends State<ConatctScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: false,
      bottomNavigationBar: BottomNavBar(),

      backgroundColor: scaffoldBgColor,
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ContactUsAppBar(scaffoldKey: _scaffoldKey),
            ContactUsBody(size: size)
          ],
        ),
      ),
    );
  }
}

class ContactUsAppBar extends StatelessWidget {
  const ContactUsAppBar({
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
              "assets/images/airlines3.jpg",
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
                    "Contact Us",
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
