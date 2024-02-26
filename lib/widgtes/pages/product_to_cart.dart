import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ProductScreen extends StatefulWidget {
  final String productName;
  final String description;
  final double price;
  final String imageLink;

  const ProductScreen(
      {Key? key,
      required this.productName,
      required this.description,
      required this.price,
      required this.imageLink})
      : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    total = widget.price * quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      total = widget.price * quantity;
    });
  }

  void decreaseQuantity() {
    setState(() {
      quantity--;
      total = widget.price * quantity;
    });
  }

  void addToCart() {
    Navigator.pop(context,total);
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
                    widget.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.productName,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.description,
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
                    visible: quantity > 1,
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
                onPressed: (){
                  Navigator.pop(context,total);
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
