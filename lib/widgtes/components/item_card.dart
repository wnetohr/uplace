import 'package:flutter/material.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ItemCard extends StatefulWidget {
  Seller? seller;

  ItemCard({super.key, required this.seller});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 330,
          child: Card(
            color: AppColors.blueUplace,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: AppColors.lightblueUplace,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.seller?.shopName ?? "Vendendor",
                          style: const TextStyle(
                              fontSize: 18.0, color: AppColors.greenUplace),
                        ),
                        Text(
                          widget.seller?.shopDescription ?? "Descricao",
                          style: const TextStyle(
                              fontSize: 12.0, color: AppColors.greenUplace),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        IconButton(
            onPressed: () {
              toggleFavorite();
            },
            icon: isFavorite ? const Icon(
              Icons.favorite,
              size: 40,
              color: AppColors.lightblueUplace,
            ) : const Icon(
              Icons.favorite_border_outlined,
              size: 40,
              color: AppColors.lightblueUplace,
            ))
      ],
    );

    return ElevatedButton(
      onPressed: () {
        // Adicione a lógica desejada quando o botão for pressionado
        RoutesFunctions.gotoSellerPage(context);
      },
      style: ElevatedButton.styleFrom(
        //backgroundColor: Colors.transparent, // Cor de fundo transparente
        elevation: 0.0,
        padding: EdgeInsets.zero, // Remove o preenchimento padrão do botão
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Bordas arredondadas do botão
        ),
      ),
      child: row,
    );
  }
}
