import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        backgroundColor: AppColors.blueUplace,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navegar de volta à página anterior
          },
        ),
        title: Text('Configurações'),
      ),
      body: Column(
        children: [
          // Seção com a seta e o título
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Configurações',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          // Botões
          ElevatedButton(
            onPressed: () {
              // Implementar a ação do botão 'Sobre esta versão'
            },
            child: Text('Sobre esta versão'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implementar a ação do botão 'Notificações'
            },
            child: Text('Notificações'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implementar a ação do botão 'Dúvidas frequentes'
            },
            child: Text('Dúvidas frequentes'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implementar a ação do botão 'Sair da sua conta'
            },
            child: Text('Sair da sua conta'),
          ),
        ],
      ),
    );
  }
}
