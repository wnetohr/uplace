import 'package:flutter/material.dart';
import 'package:uplace/controller/implementations/sellerController.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/components/item_card.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/components/ImageCarousel.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.title});

  final String title;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final SellerController _sellerController = SellerController();
  late List<Seller> sellers;

  @override
  void initState() {
    super.initState();
    _sellerController.addContext(context);
  }

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
                  child: DecoratedBox(
                      decoration: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: AppColors.blueUplace, // Cor do sublinhado
                          width: 2.0, // Largura do sublinhado
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          RoutesFunctions.gotoProductPage(context);
                        },
                        child: const Text(
                          'Produtos',
                          style: TextStyle(
                            fontSize: 15.0, // Tamanho do texto
                            fontWeight: FontWeight.bold, // Peso da fonte
                            color: AppColors.blueUplace, // Cor do texto
                          ),
                        ),
                      )),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    RoutesFunctions.gotoServicePage(context);
                  },
                  child: const Text(
                    'Serviços',
                    style: TextStyle(
                      fontSize: 15.0, // Tamanho do text // Peso da fonte
                      color: Colors.black, // Cor do texto
                    ),
                  ),
                ))
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: ImageCarousel(images: [
              //Carrossel dos Produtos
              'https://images.pexels.com/photos/632470/pexels-photo-632470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              'https://images.pexels.com/photos/5088021/pexels-photo-5088021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              'https://images.pexels.com/photos/963276/pexels-photo-963276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
            ]),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<List<Seller>?>(
                      future: getProductCards(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Seller> sellers = snapshot.data!;
                          return Column(
                            children: List.generate(
                              sellers.length,
                              (index) {
                                return ItemCard(seller: sellers[index]);
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          // TODO: Adicionar indicacao de erro
                          print('${snapshot.error}');
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: const NavigationUplaceBar(),
    );
  }

  Future<List<Seller>?> getProductCards() async {
    var response = await _sellerController.getProductCards();
    if (response.isValid) {
      sellers = response.data as List<Seller>;
      return sellers;
    } else {
      ErrorAlert(context, errorMessage: response.error);
      return null;
    }
  }
}
