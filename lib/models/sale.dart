import 'package:decimal/decimal.dart';

class Sale {
  int id;
  Decimal totalPrice;
  DateTime saleDate;
  String paymentForm;
  String status;
  List<int> items;
  int spotId; // FK for spot ID
  int vendorId; // FK for vendor ID
  int consumerId; // FK for consumer ID
  int chatId; // FK for chat Id

  Sale({
    required this.id,
    required this.totalPrice,
    required this.saleDate,
    required this.paymentForm,
    required this.status,
    required this.items,
    required this.spotId,
    required this.vendorId,
    required this.consumerId,
    required this.chatId,
  });
}
