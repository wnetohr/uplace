enum ItemCategory {
  food,
  product,
  service;

  String get name {
    switch (this) {
      case food:
        return 'Comida';
      case product:
        return 'Produto';
      case service:
        return 'Serviço';
      default:
        return 'Comida';
    }
  }
}
