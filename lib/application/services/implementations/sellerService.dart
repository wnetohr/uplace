import 'package:uplace/application/services/interfaces/baseService.dart';
import 'package:uplace/models/item.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/repository/implementations/firestore/sellerFSRepository.dart';
import 'package:uplace/repository/interfaces/sellerRepositoryInterface.dart';

class SellerService extends BaseService {
  final SellerRepositoryInterface _sellerRepository = SellerFSRepository();

  SellerService();

  Future<List<Seller>?> getFoodCards() async {
    var sellers = await _sellerRepository.getFoodSellers();
    if (sellers == null || sellers.isEmpty) {
      setError("Não há vendedores de alimentos cadastrado no plataforma");
      return null;
    }

    return sellers;
  }

  Future<List<Seller>?> getProductCards() async {
    var sellers = await _sellerRepository.getProductSellers();
    if (sellers == null || sellers.isEmpty) {
      setError("Não há vendedores de produtos cadastrado no plataforma");
      return null;
    }

    return sellers;
  }

  Future<List<Seller>?> getServiceCards() async {
    var sellers = await _sellerRepository.getServiceSellers();
    if (sellers == null || sellers.isEmpty) {
      setError("Não há vendedores de servicos cadastrado no plataforma");
      return null;
    }

    return sellers;
  }

  Future<List<Item>?> getSellerItems(String sellerId) async {
    var items = await _sellerRepository.getSellerItems(sellerId);
    if (items == null || items.isEmpty) {
      setError("Não foi possível obter os itens do vendendor");
      return null;
    }

    return items;
  }
}
