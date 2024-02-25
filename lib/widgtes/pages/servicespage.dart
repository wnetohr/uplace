import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/components/product_card.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/components/ImageCarousel.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key, required this.title});

  final String title;

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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
          Expanded(
            flex: 1,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      RoutesFunctions.gotoHomePage(context);
                    },
                    child: const Text(
                      'Alimentos',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do texto
                        fontWeight: FontWeight.bold, // Peso da fonte
                        color: Colors.black, // Cor do texto
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      RoutesFunctions.gotoProductPage(context);
                    },
                    child: const Text(
                      'Produtos',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do text // Peso da fonte
                        color: Colors.black, // Cor do texto
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    RoutesFunctions.gotoServicePage(context);
                  },
                  child: const DecoratedBox(
                    decoration: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.blueUplace, // Cor do sublinhado
                        width: 2.0, // Largura do sublinhado
                      ),
                    ),
                    child: Text(
                      'Serviços',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do texto
                        fontWeight: FontWeight.bold, // Peso da fonte
                        color: AppColors.blueUplace, // Cor do texto
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: ImageCarousel(images: [
              //Carrossel dos Serviços
              'https://media.istockphoto.com/id/1280363533/pt/foto/female-translator-working-on-a-document.jpg?b=1&s=612x612&w=0&k=20&c=_xuKyQ_IIW3WYlvxAUesQngKh-iF2QZ8mT0ioWe0tbc=',
              'https://media.istockphoto.com/id/491618768/pt/foto/de-línguas-estrangeiras-tradução-conceito-de-tradução-online.jpg?b=1&s=612x612&w=0&k=20&c=R60t0rhS3jPsUyMj-rGPhao__y9twWhqh9zqV7XN1-M=',
              'https://images.pexels.com/photos/1058461/pexels-photo-1058461.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
            ]),
          ),
          const Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: const NavigationUplaceBar(),
    );
  }
}
