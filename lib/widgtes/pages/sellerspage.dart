import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/sellers_products.dart';
import 'package:uplace/widgtes/components/sellersbanner.dart';
import 'package:uplace/widgtes/components/shopping_cart.dart';
import 'package:uplace/widgtes/routes/routes.dart';

class SellersPage extends StatefulWidget {
  const SellersPage({super.key});

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
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
                  GestureDetector(
                    onTap: () {
                      RoutesFunctions.gotoAddToCart(
                          context,
                          'Brigadeiro',
                          'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                          4.50,
                          'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                    },
                    child: SellersProducts(
                        productName: 'Brigadeiro',
                        productPrice: 4.50,
                        productDesc:
                            'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                        imageLink:
                            'https://images.pexels.com/photos/9285196/pexels-photo-9285196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutesFunctions.gotoAddToCart(
                          context,
                          'Cupcake de Chocolate',
                          'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                          7.00,
                          'https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                    },
                    child: SellersProducts(
                        productName: 'Cupcake de Chocolate',
                        productPrice: 7.00,
                        productDesc:
                            'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                        imageLink:
                            'https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutesFunctions.gotoAddToCart(
                          context,
                          'Cupcake de Morango',
                          'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                          7.50,
                          'https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                    },
                    child: SellersProducts(
                        productName: 'Cupcake de Morango',
                        productPrice: 7.50,
                        productDesc:
                            'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                        imageLink:
                            'https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutesFunctions.gotoAddToCart(
                          context,
                          'Dunots',
                          'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                          5.50,
                          'https://images.pexels.com/photos/867452/pexels-photo-867452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                    },
                    child: SellersProducts(
                        productName: 'Donuts',
                        productPrice: 5.50,
                        productDesc:
                            'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                        imageLink:
                            'https://images.pexels.com/photos/867452/pexels-photo-867452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  GestureDetector(
                    onTap: () {
                      RoutesFunctions.gotoAddToCart(
                          context,
                          'Bolo floresta negra',
                          'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                          8.50,
                          'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
                    },
                    child: SellersProducts(
                        productName: 'Bolo floresta negra',
                        productPrice: 8.50,
                        productDesc:
                            'Brigadeiro de chocolate a base de leite, achocolatado e leite condensado',
                        imageLink:
                            'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  )
                ],
              ),
            ),
          )),
          ShoppingCartBar(
            itemCount: 3,
            onPressed: () {
              RoutesFunctions.gotoChatPage(context);
            },
          )
        ],
      ),
    );
  }
}
