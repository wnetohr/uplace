import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/pages/sellerspage.dart';

class SellersBanner extends StatelessWidget {
  final String sellerName;
  final double sellerRatting;
  final String imageLink;
  final String imageSeller;

  const SellersBanner(
      {super.key,
      required this.sellerRatting,
      required this.imageLink,
      required this.sellerName,
      required this.imageSeller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Flexible(flex: 2, child: Image.network('$imageLink')),
          Flexible(
              flex: 1,
              child: Container(
                width: screenWidth * 75,
                decoration: BoxDecoration(
                    color: AppColors.blueUplace,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '$sellerName',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 30,
                                decoration: TextDecoration.none,
                                color: AppColors.greenUplace),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Avaliação: $sellerRatting',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: AppColors.greenUplace))),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          '$imageSeller',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
