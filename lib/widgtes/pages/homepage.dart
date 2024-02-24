import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/ImageCarousel.dart';
import 'package:uplace/widgtes/components/category_menu.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/components/product_card.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueUplace,
        leading: Container(),
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: AppColors.greenUplace),
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: AppColors.greenUplace,
              ))
        ],
      ),
      body: Column(
        children: [
          const CategoryMenu(),
          const Expanded(
              flex: 2,
              child: ImageCarousel(images: [
                //Carrossel dos Alimentos
                'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400',
                'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=400',
                'https://images.pexels.com/photos/718742/pexels-photo-718742.jpeg?auto=compress&cs=tinysrgb&w=400'
              ])),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: ProductCard(),
                    onPressed: () {
                      // Adicione a lógica desejada quando o botão for pressionado
                      RoutesFunctions.gotoSellerPage(context);
                    },
                    style: ElevatedButton.styleFrom(
                      //backgroundColor: Colors.transparent, // Cor de fundo transparente
                      elevation: 0.0,
                      padding: EdgeInsets
                          .zero, // Remove o preenchimento padrão do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Bordas arredondadas do botão
                      ),
                    ),
                  ),
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
          ),
          //Expanded(child: NavigationUplaceBar())
        ],
      ),
      bottomNavigationBar:
          const NavigationUplaceBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
