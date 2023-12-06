import 'package:flutter/material.dart';
import 'package:uplace/frontend/pages/homepage.dart';

class RoutesFunctions {
  static void gotoHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'uPlace')),
    );
  }
}
