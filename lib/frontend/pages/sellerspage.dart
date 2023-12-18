import 'package:flutter/material.dart';
import 'package:uplace/components/product_card.dart';
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
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.network(
                          'https://images.pexels.com/photos/13330673/pexels-photo-13330673.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.blueUplace,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(5),
                      ))
                ],
              ),
            )),
        Expanded(
            flex: 1,
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
