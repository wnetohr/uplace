import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/firestore/collections/baseFSRepository.dart';
import 'package:uplace/backend/repository/models/seller.dart';

class SellerFSRepository extends BaseFSRepository {
  static final SellerFSRepository _firestoreProfileRepository =
      SellerFSRepository._internal();

  factory SellerFSRepository() {
    _firestoreProfileRepository.configure("seller");
    return _firestoreProfileRepository;
  }

  SellerFSRepository._internal();

  Future<List<Seller>>? getAllUsers() async {
    QuerySnapshot sellersQuery = await db.get();
    List<Seller> sellers = sellersQuery.docs
        .map((e) => Seller.FromFirebase(e.data() as Map<String, dynamic>, e.id))
        .toList();
    return sellers;
  }
}
