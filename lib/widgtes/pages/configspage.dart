import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';
import 'package:uplace/widgtes/routes/routes.dart';

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
      appBar: AppBar(  // Base structure AppBar for the ''Settings'' section
        iconTheme: const IconThemeData(color: AppColors.greenUplace, size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: const Text(
          'Configurações',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the 'About this version' button action
            },
            child:
                const Text('Sobre esta versão', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the 'Notifications' button action
            },
            child: const Text('Notificações', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the 'Frequently asked questions' button action
            },
            child: const Text('Dúvidas frequentes', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the 'Sign out of your account' button action
            },
            child: const Text('Sair da sua conta', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}