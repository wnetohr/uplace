import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/components/seller_card.dart';

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
      /*appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.greenUplace, size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),*/
      body: Column(
        children: [
          Container(
            height: 70,
            color: AppColors.blueUplace,
            child: Center(
              child: Text(
                'Favoritos',
                style: TextStyle(color: AppColors.greenUplace, fontSize: 26),
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.blueUplace,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.blueUplace,
                hintText: 'Search...',
                hintStyle: TextStyle(color: AppColors.greenUplace),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 4, // Number of Product Cards that we want to showcase
              itemBuilder: (context, index) {
                return SellerCard(
                    seller: null); // Substitua isso com seu ProductCard
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavigationUplaceBar(),
    );
  }
}
