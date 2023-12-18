import 'package:flutter/material.dart';
import 'package:uplace/components/product_card.dart';
import 'package:uplace/components/sellersbanner.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/routes/routes.dart';

class SellersPage extends StatefulWidget {
  const SellersPage({super.key});

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SellersBanner(
          sellerName: 'Loja de doces',
          imageLink:
              'https://images.pexels.com/photos/13330673/pexels-photo-13330673.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          imageSeller:
              'https://i.pinimg.com/736x/81/4d/ff/814dff3c0c62be676e79875d14cca883.jpg',
          sellerRatting: 4.5,
        )),
        Expanded(
            child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
