import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/models/User.dart';

class Seller {
  String sellerId;
  String shopname;
  DocumentReference userId;
  User? user;

  Seller({
    required this.sellerId,
    required this.shopname,
    required this.userId,
  });

  factory Seller.FromFirebase(Map<String, dynamic> json, String sellerId) =>
      Seller(
        sellerId: sellerId,
        shopname: json["shopname"],
        userId: json["userId"],
      );
}
