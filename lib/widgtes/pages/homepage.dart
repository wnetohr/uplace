import 'package:flutter/material.dart';
import 'package:uplace/controller/implementations/sellerController.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/components/ImageCarousel.dart';
import 'package:uplace/widgtes/components/category_menu.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/components/seller_card.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SellerController _sellerController = SellerController();

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
                  FutureBuilder<List<Seller>?>(
                      future: getFoodsCards(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Seller> sellers = snapshot.data!;
                          return Column(
                            children: List.generate(
                              sellers.length,
                              (index) {
                                return SellerCard(seller: sellers[index]);
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
          //Expanded(child: NavigationUplaceBar())
        ],
      ),
      bottomNavigationBar:
          const NavigationUplaceBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Seller>?> getFoodsCards() async {
    var response = await _sellerController.getFoodCards();
    if (response.isValid) {
      var sellers = response.data as List<Seller>;
      return sellers;
    } else {
      ErrorAlert(context, errorMessage: response.error);
      return null;
    }
  }
}
