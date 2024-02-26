import 'package:flutter/material.dart';
import 'package:uplace/widgtes/themes/colors.dart';

void main() {
  runApp(ChatPage());
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueUplace,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white, // Definindo a cor do ícone como branca
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/247899/pexels-photo-247899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
              const SizedBox(width: 8),
              const Text(
                'Doces do Edu',
                style: TextStyle(
                  color: AppColors.greenUplace,
                ),
              ),
            ],
          ),
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ChatMessage(message: 'Olá, tudo bem?'),
              ChatMessage(message: 'Como vai você?'),
            ],
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message_rounded, // Substituí o ícone por 'message_rounded'
                  color: AppColors.blueUplace, // Definindo a cor do ícone como azul
                ),
                onPressed: () {
                  // Implementar ação para finalizar negociação
                },
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Digite sua mensagem...',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: AppColors.blueUplace,
                ),
                onPressed: () {
                  // Implementar ação para enviar mensagem
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;

  const ChatMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/247899/pexels-photo-247899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.greenUplace,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
