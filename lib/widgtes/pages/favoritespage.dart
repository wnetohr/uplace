import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/components/product_card.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoritesPage(),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.greenUplace, size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: const Text(
          'Configurações',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Number of Product Cards that we want to showcase
              itemBuilder: (context, index) {
                return const ProductCard(); // Substitua isso com seu ProductCard
              },
            ),
          ),
        ],
      ),
    );
  }
}
