import 'package:flutter/material.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({super.key});

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  String selectedCategory = "Alimentos";
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
                setState(() {
                  selectedCategory = "Alimentos";
                });
                // RoutesFunctions.gotoHomePage(context);
              },
              child: selectedCategory == "Alimentos"
                  ? const DecoratedBox(
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
                    )
                  : const Text(
                      'Alimentos',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do texto
                        fontWeight: FontWeight.normal, // Peso da fonte
                        color: Colors.black, // Cor do texto
                      ),
                    ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedCategory = "Produtos";
                });
                // RoutesFunctions.gotoProductPage(context);
              },
              child: selectedCategory == "Produtos"
                  ? const DecoratedBox(
                      decoration: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: AppColors.blueUplace, // Cor do sublinhado
                          width: 2.0, // Largura do sublinhado
                        ),
                      ),
                      child: Text(
                        'Produtos',
                        style: TextStyle(
                          fontSize: 15.0, // Tamanho do texto
                          fontWeight: FontWeight.bold, // Peso da fonte
                          color: AppColors.blueUplace, // Cor do texto
                        ),
                      ),
                    )
                  : const Text(
                      'Produtos',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do texto
                        fontWeight: FontWeight.normal, // Peso da fonte
                        color: Colors.black, // Cor do texto
                      ),
                    ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedCategory = "Serviços";
                });
                // RoutesFunctions.gotoServicePage(context);
              },
              child: selectedCategory == "Serviços"
                  ? const DecoratedBox(
                      decoration: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: AppColors.blueUplace, // Cor do sublinhado
                          width: 2.0, // Largura do sublinhado
                        ),
                      ),
                      child: Text(
                        'Serviços',
                        style: TextStyle(
                          fontSize: 15.0, // Tamanho do texto
                          fontWeight: FontWeight.bold, // Peso da fonte
                          color: AppColors.blueUplace, // Cor do texto
                        ),
                      ),
                    )
                  : const Text(
                      'Serviços',
                      style: TextStyle(
                        fontSize: 15.0, // Tamanho do texto
                        fontWeight: FontWeight.normal, // Peso da fonte
                        color: Colors.black, // Cor do texto
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
