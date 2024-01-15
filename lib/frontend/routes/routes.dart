import 'package:flutter/material.dart';
import 'package:uplace/frontend/pages/homepage.dart';
import 'package:uplace/frontend/pages/productspage.dart';
import 'package:uplace/frontend/pages/sellerspage.dart';
import 'package:uplace/frontend/pages/servicespage.dart';
import 'package:uplace/frontend/pages/registerpage.dart';

class RoutesFunctions {
  static void gotoHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'uPlace')),
    );
  }
  static void gotoRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  static void gotoProductPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductPage(title: 'uPlace')),
    );
  }

  static void gotoServicePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServicePage(title: 'uPlace')),
    );
  }

  static void gotoSellerPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellersPage()),
    );
  }
}
