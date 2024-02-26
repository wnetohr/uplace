class Seller {
  String id;
  String shopName;
  String shopDescription;
  bool sellsFood;
  bool sellsProduct;
  bool sellsService;
  // bool sponsored;
  // double score;
  // List<int> sales;
  // List<int> products;
  // List<int> foods;
  // List<int> services;
  String userId; // FK for user ID
  // int spotId; // FK for spot ID

  Seller({
    required this.id,
    required this.shopName,
    required this.shopDescription,
    required this.sellsFood,
    required this.sellsProduct,
    required this.sellsService,
    required this.userId,
  });

  factory Seller.FromFirebase(Map<String, dynamic> json, String id) {
    return Seller(
      id: id,
      shopName: json["shopName"],
      shopDescription: json["shopDescription"],
      sellsFood: json["sellsFood"],
      sellsProduct: json["sellsProduct"],
      sellsService: json["sellsService"],
      userId: json["userAuthId"],
    );
  }

  @override
  String toString() {
    return 'Consumer('
        'shopName: $shopName, '
        'shopDescription: $shopDescription, '
        'userId: $userId';
  }
}
