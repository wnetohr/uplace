import 'package:uplace/models/item.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/repository/interfaces/baseRepository.dart';

abstract class SellerRepositoryInterface extends BaseRepository {
  Future<List<Seller>?> getFoodSellers();
  Future<List<Seller>?> getProductSellers();
  Future<List<Seller>?> getServiceSellers();
  Future<List<Item>?> getSellerItems(String sellerId);
}
