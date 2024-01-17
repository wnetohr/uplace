class Consumer {
  String name;
  String authId;
  DateTime birthDate;

  Consumer({required this.name, required this.birthDate, required this.authId});

  factory Consumer.FromFirebase(Map<String, dynamic> json, String authId) {
    return Consumer(
      name: json["name"],
      birthDate: json["birthDate"].toDate(),
      authId: authId,
    );
  }

  @override
  String toString() {
    return 'Consumer('
        'name: $name, '
        'birthDate: $birthDate, '
        'authId: $authId)';
  }
}
