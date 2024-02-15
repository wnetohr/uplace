import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.greenUplace, size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: const Text(
          'Configurações',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 360, // Defining width
              height: 60, // Defining height
              child: ElevatedButton(
                onPressed: () {
                  // Implement the 'Sobre esta versão' button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Button background color
                ),
                child: const Text(
                  'Sobre esta versão',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 360,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Implement the 'Notificações' button action 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Button background color
                ),
                child: const Text(
                  'Notificações',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 360,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Implement the 'Dúvidas frequentes' button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Button background color
                ),
                child: const Text(
                  'Dúvidas frequentes',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 360,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Implementar a ação do botão 'Sair da sua conta'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Button background color
                ),
                child: const Text(
                  'Sair da sua conta',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 320),
          ],
        ),
      ),
    );
  }
}