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
              width: 360, // Defina a largura desejada
              height: 60, // Defina a altura desejada
              child: ElevatedButton(
                onPressed: () {
                  // Implementar a ação do botão 'Sobre esta versão'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Cor de fundo do botão
                ),
                child: const Text(
                  'Sobre esta versão',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Cor do texto do botão
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
                  // Implementar a ação do botão 'Notificações'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Cor de fundo do botão
                ),
                child: const Text(
                  'Notificações',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Cor do texto do botão
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
                  // Implementar a ação do botão 'Dúvidas frequentes'
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueUplace, // Cor de fundo do botão
                ),
                child: const Text(
                  'Dúvidas frequentes',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Cor do texto do botão
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
                  backgroundColor: AppColors.blueUplace, // Cor de fundo do botão
                ),
                child: const Text(
                  'Sair da sua conta',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Cor do texto do botão
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