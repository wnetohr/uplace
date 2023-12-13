import 'package:flutter/material.dart';
import 'package:uplace/components/product_card.dart';
import 'package:uplace/components/uplace_theme.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart'; //firebase
import 'package:uplace/frontend/pages/loginpage.dart';
import 'backend/repository/firestore/firebase_options.dart'; //firebase

void main() async {
  // adicionei o async por conta do await do firebase
  WidgetsFlutterBinding
      .ensureInitialized(); //essa linha é necessária para corrigir um erro do android
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uPlace',
      theme: uPlaceTheme,
      home: const LoginPage(),
    );
  }
}
