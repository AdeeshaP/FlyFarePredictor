import 'package:flyfarepredictor_app/screens/about_us_screen.dart';
import 'package:flyfarepredictor_app/screens/contact_us_screen.dart';
import 'package:flyfarepredictor_app/screens/home_screen.dart';
import 'package:flyfarepredictor_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SideMenuBarWidget extends StatelessWidget {
  const SideMenuBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: sideMenuBgColor,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home, color: menuIconColor),
            title: Text(
              "Home",
              style: TextStyle(
                  color: menuIconColor,
                  fontWeight: drawerFontweight,
                  fontSize: drawerFontSize),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: menuIconColor),
            title: Text(
              "Contact Us",
              style: TextStyle(
                  color: menuIconColor,
                  fontWeight: drawerFontweight,
                  fontSize: drawerFontSize),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ConatctScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: menuIconColor),
            title: Text(
              "About Us",
              style: TextStyle(
                  color: menuIconColor,
                  fontWeight: drawerFontweight,
                  fontSize: drawerFontSize),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AboutUsScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: menuIconColor),
            title: Text(
              "Logout",
              style: TextStyle(
                  color: menuIconColor,
                  fontWeight: drawerFontweight,
                  fontSize: drawerFontSize),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
        ],
      ),
    );
  }
}
