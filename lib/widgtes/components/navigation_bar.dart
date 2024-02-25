import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/routes/routes.dart';

class NavigationUplaceBar extends StatelessWidget {
  const NavigationUplaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.blueUplace,
      selectedItemColor: AppColors.greenUplace,
      unselectedItemColor: AppColors.greenUplace,
      // Estilo do texto quando não selecionado
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        )
      ],

      onTap: (index) {
        switch (index) {
          case 0:
            RoutesFunctions.gotoHomePage(context);
            break;
          case 1:
            RoutesFunctions.gotoFavoritesPage(context);
            break;
          case 2:
            RoutesFunctions.gotoProfilePage(context);
            break;
        }
      },
    );
  }
}