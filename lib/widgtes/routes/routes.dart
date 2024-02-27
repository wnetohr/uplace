import 'package:flutter/material.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/pages/chatpage.dart';
import 'package:uplace/widgtes/pages/confirmpurchase.dart';
import 'package:uplace/widgtes/pages/favoritespage.dart';
import 'package:uplace/widgtes/pages/homepage.dart';
import 'package:uplace/widgtes/pages/loginpage.dart';
import 'package:uplace/widgtes/pages/itempage.dart';
import 'package:uplace/widgtes/pages/productspage.dart';
import 'package:uplace/widgtes/pages/profilepage.dart';
import 'package:uplace/widgtes/pages/registerpage.dart';
import 'package:uplace/widgtes/pages/sellerspage.dart';
import 'package:uplace/widgtes/pages/servicespage.dart';
import 'package:uplace/widgtes/pages/configspage.dart';

class RoutesFunctions {
  // static void gotoAddToCart(BuildContext context, String name,
  //     String description, double price, String imageLink) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ItemScreen(
  //         productName: name,
  //         description: description,
  //         price: price,
  //         imageLink: imageLink,
  //       ),
  //     ),
  //   );
  // }

  static void gotoHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'uPlace')),
    );
  }

  static void gotoLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  static void gotoRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  static void gotoProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  static void gotoFavoritesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesPage()),
    );
  }

  static void gotoProductPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ProductPage(title: 'uPlace')),
    );
  }

  static void gotoServicePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ServicePage(title: 'uPlace')),
    );
  }

  static void gotoSellerPage(BuildContext context, Seller seller) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellersPage(seller: seller)),
    );
  }

  static void gotoSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  static void gotoChatPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
  }

 static void gotoConfirmPurchasePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmPurchasePage()),
    );
  }

}
