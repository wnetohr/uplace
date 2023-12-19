import 'package:flutter/material.dart';
import 'package:uplace/frontend/components/product_card.dart';
import 'package:uplace/frontend/components/sellers_products.dart';
import 'package:uplace/frontend/components/sellersbanner.dart';
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
              'https://i0.wp.com/culturalhistoryoftheinternet.com/wp-content/uploads/2020/11/cover2-1.jpg?fit=1919%2C1079&ssl=1',
          sellerRatting: 4.5,
        )),
        Expanded(
            child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(productName: 'Brigadeiro',productPrice: 4.50,productDesc: 'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado', imageLink: 'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
