import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/routes/routes.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({super.key});

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                RoutesFunctions.gotoHomePage(context);
              },
              child: const DecoratedBox(
                decoration: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.blueUplace, // Cor do sublinhado
                    width: 2.0, // Largura do sublinhado
                  ),
                ),
                child: Text(
                  'Alimentos',
                  style: TextStyle(
                    fontSize: 15.0, // Tamanho do texto
                    fontWeight: FontWeight.bold, // Peso da fonte
                    color: AppColors.blueUplace, // Cor do texto
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                RoutesFunctions.gotoProductPage(context);
              },
              child: Text(
                'Produtos',
                style: TextStyle(
                  fontSize: 15.0, // Tamanho do text // Peso da fonte
                  color: Colors.black, // Cor do texto
                ),
              ),
            ),
          ),
          Expanded(
              child: TextButton(
            onPressed: () {
              RoutesFunctions.gotoServicePage(context);
            },
            child: Text(
              'Serviços',
              style: TextStyle(
                fontSize: 15.0, // Tamanho do text // Peso da fonte
                color: Colors.black, // Cor do texto
              ),
            ),
          ))
        ],
      ),
    );
  }
}
