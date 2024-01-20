import 'package:uplace/repository/interfaces/item.dart';

class Service extends Item {
  Service({
    required super.id,
    required super.title,
    required super.photo,
    required super.units,
    required super.price,
    required super.description,
    required super.subTitle,
  });
}
