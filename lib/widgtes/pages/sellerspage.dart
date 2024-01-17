import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/sellers_products.dart';
import 'package:uplace/widgtes/components/sellersbanner.dart';

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
          sellerName: 'Doces do Edu',
          imageLink:
              'https://images.pexels.com/photos/13330673/pexels-photo-13330673.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          imageSeller:
              'https://images.pexels.com/photos/247899/pexels-photo-247899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          sellerRatting: 4.5,
        )),
        Expanded(
            child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SellersProducts(
                    productName: 'Brigadeiro',
                    productPrice: 4.50,
                    productDesc:
                        'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                    imageLink:
                        'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(
                    productName: 'Cupcake de Chocolate',
                    productPrice: 7.00,
                    productDesc:
                        'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                    imageLink:
                        'https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(
                    productName: 'Cupcake de Morango',
                    productPrice: 7.50,
                    productDesc:
                        'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                    imageLink:
                        'https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(
                    productName: 'Dunots',
                    productPrice: 5.50,
                    productDesc:
                        'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                    imageLink:
                        'https://images.pexels.com/photos/867452/pexels-photo-867452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                SellersProducts(
                    productName: 'Bolo floresta negra',
                    productPrice: 8.50,
                    productDesc:
                        'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                    imageLink:
                        'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
              ],
            ),
          ),
        ))
      ],
    );
  }
}
