import 'package:flutter/material.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class SellersBanner extends StatelessWidget {
  final Seller seller;

  const SellersBanner({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Flexible(flex: 2, child: Image.network(seller.imageSellerBanner)),
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
                        Container(
                          height: 50,
                          width: 250,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              seller.shopName,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  color: AppColors.greenUplace),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Avaliação: ${seller.score}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.none,
                                    color: AppColors.greenUplace))),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          seller.imageSeller,
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
