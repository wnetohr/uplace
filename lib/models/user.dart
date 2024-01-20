class User {
  int id;
  String name;
  String photo;
  List<int> activeOrders; // FK for chat ID - Where chat is active
  List<int> chatHistory; // FK for chat ID - Where chat is not active

  User({
    required this.id,
    required this.name,
    required this.photo,
    required this.activeOrders,
    required this.chatHistory,
  });
}
