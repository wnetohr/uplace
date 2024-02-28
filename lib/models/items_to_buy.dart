import 'package:decimal/decimal.dart';
import 'package:uplace/models/item.dart';

class ItemsToBuy {
  Map<Item, Decimal> _selectedItems = {};

  ItemsToBuy();

  void increment(Item newItem, Decimal quantity) {
    var adicionado = false;
    for (var existentItemEntry in _selectedItems.entries) {
      var existentItem = existentItemEntry.key;
      if (existentItem.id == newItem.id) {
        _selectedItems[existentItem] = _selectedItems[existentItem]! + quantity;
        adicionado = true;
      }
    }

    if (!adicionado) {
      _selectedItems[newItem] = quantity;
    }
  }

  Decimal getTotal() {
    Decimal total = Decimal.zero;
    for (var selectedItemsEntry in _selectedItems.entries) {
      total += selectedItemsEntry.key.price * selectedItemsEntry.value;
    }
    return total;
  }
}
