import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ShoppingCartBar extends StatelessWidget {
  final double itemCount;
  final VoidCallback onPressed;

  const ShoppingCartBar({
    Key? key,
    required this.itemCount,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Tornando o Material transparente
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.blueUplace, // Cor da barra do carrinho
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.shopping_cart, color: AppColors.greenUplace),
              SizedBox(width: 10.0),
              Text(
                'Carrinho ($itemCount)',
                style: TextStyle(color: AppColors.greenUplace, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
