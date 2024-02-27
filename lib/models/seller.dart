class Seller {
  String id;
  String shopName;
  String shopDescription;
  bool sellsFood;
  bool sellsProduct;
  bool sellsService;
  // bool sponsored;
  // int spotId; // FK for spot ID
  double score;
  String userId; // FK for user ID
  String imageSeller;
  bool isImageSellerBase64;
  String imageSellerBanner;
  bool isImageSellerBannerBase64;

  Seller({
    required this.id,
    required this.shopName,
    required this.shopDescription,
    required this.sellsFood,
    required this.sellsProduct,
    required this.sellsService,
    required this.score,
    required this.userId,
    required this.imageSeller,
    required this.isImageSellerBase64,
    required this.imageSellerBanner,
    required this.isImageSellerBannerBase64,
  });

  factory Seller.FromFirebase(Map<String, dynamic> json, String id) {
    return Seller(
      id: id,
      shopName: json["shopName"],
      shopDescription: json["shopDescription"],
      sellsFood: json["sellsFood"],
      sellsProduct: json["sellsProduct"],
      sellsService: json["sellsService"],
      score: json["score"],
      imageSeller: json["imageSeller"],
      isImageSellerBase64: json["isImageSellerBase64"],
      imageSellerBanner: json["imageSellerBanner"],
      isImageSellerBannerBase64: json["isImageSellerBannerBase64"],
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
