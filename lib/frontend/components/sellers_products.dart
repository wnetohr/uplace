import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';

class SellersProducts extends StatelessWidget {
  final String productName;
  final String productDesc;
  final double productPrice;
  final String imageLink;

  const SellersProducts(
      {super.key,
      required this.productName,
      required this.productDesc,
      required this.productPrice,
      required this.imageLink});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blueUplace,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
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
          SizedBox(
            width: 20,
          ),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    '$productName',
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: AppColors.greenUplace),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    '$productPrice',
                    style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      textAlign: TextAlign.start,
                      '$productDesc',
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 10,
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
