import 'package:flutter/material.dart';
import 'package:uplace/widgtes/pages/homepage.dart';
import 'package:uplace/widgtes/pages/productspage.dart';
import 'package:uplace/widgtes/pages/profilepage.dart';
import 'package:uplace/widgtes/pages/registerpage.dart';
import 'package:uplace/widgtes/pages/sellerspage.dart';
import 'package:uplace/widgtes/pages/servicespage.dart';
import 'package:uplace/widgtes/pages/configspage.dart';

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
  static void gotoProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
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
        // CÓDIGO APENAS PARA TESTAR A configspage VISTO QUE A DE USUÁRIO VAI
        // CONTER A MESMA, DEPOIS SERÁ ALTERADO
  static void gotoSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
}
