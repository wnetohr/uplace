import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome da loja',
                          style: TextStyle(
                              fontSize: 18.0, color: AppColors.greenUplace),
                        ),
                        Text(
                          'Descrição da loja',
                          style: TextStyle(
                              fontSize: 12.0, color: AppColors.greenUplace),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              size: 40,
              color: AppColors.lightblueUplace,
            ))
      ],
    );
  }
}
