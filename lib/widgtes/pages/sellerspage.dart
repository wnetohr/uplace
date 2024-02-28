import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:uplace/controller/implementations/sellerController.dart';
import 'package:uplace/models/item.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/components/sellers_item.dart';
import 'package:uplace/widgtes/components/sellersbanner.dart';
import 'package:uplace/widgtes/components/shopping_cart.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/pages/itempage.dart';
import 'package:uplace/widgtes/routes/routes.dart';

class SellersPage extends StatefulWidget {
  final Seller seller;

  SellersPage({super.key, required this.seller});

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  final SellerController _sellerController = SellerController();

  @override
  void initState() {
    super.initState();
    _sellerController.addContext(context);
  }

  Decimal _counter = Decimal.fromInt(0);

  void counterIncrement(Decimal value) {
    setState(() {
      _counter += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: SellersBanner(
            seller: widget.seller,
          )),
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<List<Item>?>(
                    future: getSellerItems(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Item> items = snapshot.data!;
                        return Column(
                          children: List.generate(
                            items.length,
                            (index) {
                              return GestureDetector(
                                  onTap: () async {
                                    navigateToItem(items[index]);
                                  },
                                  child: SellersItem(item: items[index]));
                            },
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // TODO: Adicionar indicacao de erro
                        print('${snapshot.error}');
                      }
                      return SizedBox();
                    },
                  )
                ],
              ),
            ),
          )),
          ShoppingCartBar(
            itemCount: _counter,
            onPressed: () {
              RoutesFunctions.gotoConfirmPurchasePage(context,widget.seller);
            },
          )
        ],
      ),
    );
  }

  Future<List<Item>?> getSellerItems() async {
    var response = await _sellerController.getSellerItems(widget.seller.id);
    if (response.isValid) {
      var items = response.data as List<Item>;
      return items;
    } else {
      ErrorAlert(context, errorMessage: response.error);
      return null;
    }
  }

  void navigateToItem(Item item) async {
    final Decimal? countValue = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemPage(item: item),
      ),
    );
    if (countValue != null) {
      counterIncrement(countValue);
    }
  }
}
