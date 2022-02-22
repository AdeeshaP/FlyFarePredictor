import '../clippers/drawer_clipper.dart';
import '../side-menu/side_menu_bar.dart';

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ClipPath(
              clipper: DrawerClipper(),
              child: Container(
                child: Image.asset(
                  "assets/images/airlines6.jpg",
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            SideMenuBarWidget(),
          ],
        ),
      ),
    );
  }
}
