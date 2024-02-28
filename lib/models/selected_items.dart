import 'package:decimal/decimal.dart';
import 'package:uplace/models/item.dart';

class ItemsToBuy {
  Map<Item, int> _selectedItems = {};

  ItemsToBuy();

  void increment(ItemsToBuy newItems) {
    for (var itemEntry in newItems._selectedItems.entries) {
      var newItem = itemEntry.key;

      var adicionado = false;
      for (var existentItemEntry in _selectedItems.entries) {
        var existentItem = existentItemEntry.key;
        if (existentItem.id == newItem.id) {
          _selectedItems[existentItem] =
              _selectedItems[existentItem]! + newItems._selectedItems[newItem]!;
          adicionado = true;
        }
      }

      if (!adicionado) {
        _selectedItems[newItem] = newItems._selectedItems[newItem]!;
      }
    }
  }
}
