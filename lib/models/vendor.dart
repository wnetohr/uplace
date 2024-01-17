class Vendor {
  int id;
  String storeName;
  bool sponsored;
  double score;
  List<int> sales;
  List<int> products;
  List<int> foods;
  List<int> services;
  int userId; // FK for user ID
  int spotId; // FK for spot ID

  Vendor({
    required this.id,
    required this.storeName,
    required this.sponsored,
    required this.score,
    required this.sales,
    required this.products,
    required this.foods,
    required this.services,
    required this.userId,
    required this.spotId,
  });
}
