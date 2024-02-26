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
                  color: Colors.white,
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

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatMessageModel> _messages = [
    ChatMessageModel(message: 'Olá, tudo bem?', isUser: false),
    ChatMessageModel(message: 'Como vai você?', isUser: false),
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessageModel(
          message: _controller.text,
          isUser: true,
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return ChatMessage(messageModel: _messages[index]);
            },
          ),
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.message_rounded,
                  color: AppColors.blueUplace,
                ),
                onPressed: () {
                  // Implementar ação para finalizar negociação
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
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
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChatMessageModel {
  final String message;
  final bool isUser;

  ChatMessageModel({required this.message, required this.isUser});
}

class ChatMessage extends StatelessWidget {
  final ChatMessageModel messageModel;

  const ChatMessage({required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: messageModel.isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!messageModel.isUser)
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/247899/pexels-photo-247899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
          if (!messageModel.isUser) const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: messageModel.isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: messageModel.isUser
                        ? AppColors.lightblueUplace
                        : AppColors.greenUplace,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    messageModel.message,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          if (messageModel.isUser) const SizedBox(width: 8),
          if (messageModel.isUser)
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/12842333/pexels-photo-12842333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ),
        ],
      ),
    );
  }
}
