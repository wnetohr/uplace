import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:uplace/models/item.dart';
import 'package:uplace/models/items_to_buy.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ItemPage extends StatefulWidget {
  final Item item;
  final ItemsToBuy itemsToBuy;

  const ItemPage({Key? key, required this.item, required this.itemsToBuy})
      : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Decimal quantity = Decimal.fromInt(1);
  Decimal total = Decimal.fromInt(0);

  @override
  void initState() {
    super.initState();
    total = widget.item.price * quantity;
    widget.itemsToBuy.increment(widget.item, Decimal.zero);
  }

  void increaseQuantity() {
    setState(() {
      quantity += Decimal.one;
      total = widget.item.price * quantity;
    });
  }

  void decreaseQuantity() {
    setState(() {
      quantity -= Decimal.one;
      total = widget.item.price * quantity;
    });
  }

  void addToCart() {
    widget.itemsToBuy.increment(widget.item, quantity);
    Navigator.pop(context, widget.itemsToBuy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueUplace,
        title: const Text(
          'Adicionar ao carrinho',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.item.itemImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.item.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.item.description,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Quantidade: $quantity',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Visibility(
                    visible: quantity > Decimal.fromInt(1),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.blueUplace),
                      ),
                      onPressed: decreaseQuantity,
                      child: Icon(Icons.remove, color: AppColors.greenUplace),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.blueUplace),
                    ),
                    onPressed: increaseQuantity,
                    child: Icon(Icons.add, color: AppColors.greenUplace),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Total: \$ $total',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.blueUplace),
                ),
                onPressed: () {
                  addToCart();
                },
                child: Text('Adicionar ao Carrinho',
                    style: TextStyle(
                      color: AppColors.greenUplace,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
