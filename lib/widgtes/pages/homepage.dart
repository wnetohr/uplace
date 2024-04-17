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
  late Future<List<Seller>?> sellerCards;
  late ImageCarousel carousel;

  List<String> get foodImages {
    return [
      //Carrossel dos Alimentos
      'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/718742/pexels-photo-718742.jpeg?auto=compress&cs=tinysrgb&w=400'
    ];
  }

  List<String> get serviceImages {
    return [
      //Carrossel dos Serviços
      'https://media.istockphoto.com/id/1280363533/pt/foto/female-translator-working-on-a-document.jpg?b=1&s=612x612&w=0&k=20&c=_xuKyQ_IIW3WYlvxAUesQngKh-iF2QZ8mT0ioWe0tbc=',
      'https://media.istockphoto.com/id/491618768/pt/foto/de-línguas-estrangeiras-tradução-conceito-de-tradução-online.jpg?b=1&s=612x612&w=0&k=20&c=R60t0rhS3jPsUyMj-rGPhao__y9twWhqh9zqV7XN1-M=',
      'https://images.pexels.com/photos/1058461/pexels-photo-1058461.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ];
  }

  List<String> get productImages {
    return [
      //Carrossel dos Produtos
      'https://images.pexels.com/photos/632470/pexels-photo-632470.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/5088021/pexels-photo-5088021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/963276/pexels-photo-963276.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ];
  }

  @override
  void initState() {
    super.initState();
    sellerCards = getFoodsCards();
    carousel = ImageCarousel(images: foodImages);
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
          CategoryMenu(
            onSelectedCategory: (String category) async {
              switch (category) {
                case "Alimentos":
                  sellerCards = getFoodsCards();
                  carousel = ImageCarousel(images: foodImages);
                  break;
                case "Produtos":
                  sellerCards = getProductCards();
                  carousel = ImageCarousel(images: productImages);
                  break;
                case "Serviços":
                  sellerCards = getServiceCards();
                  carousel = ImageCarousel(images: serviceImages);
                  break;
                default:
              }
              setState(() {});
            },
          ),
          Expanded(
            flex: 2,
            child: carousel,
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<List<Seller>?>(
                      future: sellerCards,
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

  Future<List<Seller>?> getProductCards() async {
    var response = await _sellerController.getProductCards();
    if (response.isValid) {
      var sellers = response.data as List<Seller>;
      return sellers;
    } else {
      ErrorAlert(context, errorMessage: response.error);
      return null;
    }
  }

  Future<List<Seller>?> getServiceCards() async {
    var response = await _sellerController.getServiceCards();
    if (response.isValid) {
      var sellers = response.data as List<Seller>;
      return sellers;
    } else {
      ErrorAlert(context, errorMessage: response.error);
      return null;
    }
  }
}
