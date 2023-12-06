import 'package:flutter/material.dart';
import 'package:uplace/components/product_card.dart';
import 'package:uplace/components/uplace_theme.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/pages/homepage.dart';

void main() {
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
      home: const MyHomePage(title: 'uPlace'),
    );
  }
}




