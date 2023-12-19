import 'package:flutter/material.dart';
import 'package:uplace/frontend/components/category_menu.dart';
import 'package:uplace/frontend/components/navigation_bar.dart';
import 'package:uplace/frontend/components/product_card.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/routes/routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: AppColors.blueUplace,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
          CategoryMenu(),
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
