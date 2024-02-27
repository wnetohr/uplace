import 'package:flutter/material.dart';
import 'package:uplace/models/item.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class SellersItem extends StatelessWidget {
  final Item item;
  final String imageLink;

  const SellersItem({super.key, required this.item, required this.imageLink});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String price = item.price.toStringAsFixed(2);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blueUplace,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: screenWidth * 75,
      height: screenHeight * 0.20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '$imageLink',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      textAlign: TextAlign.start,
                      item.category.name,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    item.name,
                    style: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: AppColors.greenUplace),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    'R\$ $price',
                    style: const TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      textAlign: TextAlign.start,
                      item.description,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
