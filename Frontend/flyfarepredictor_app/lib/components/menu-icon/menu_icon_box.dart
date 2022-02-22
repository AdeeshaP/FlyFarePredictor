import 'package:flutter/material.dart';

import '../../constants.dart';


class MenuIconBox extends StatelessWidget {
  const MenuIconBox({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey, super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 50),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: menuIconBgColor,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(Icons.menu,
              size: 25,
              color:
                  Colors.white), // change this size and style
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
    );
  }
}