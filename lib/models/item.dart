import 'package:decimal/decimal.dart';

abstract class Item {
  int id;
  String title;
  String photo;
  int units;
  Decimal price;
  String description;
  String subTitle;

  Item({
    required this.id,
    required this.title,
    required this.photo,
    required this.units,
    required this.price,
    required this.description,
    required this.subTitle,
  });
}
