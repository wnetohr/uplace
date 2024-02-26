class Consumer {
  String name;
  String authId;
  String email;
  DateTime birthDate;
  DateTime createdOn;

  Consumer({
    required this.name,
    required this.birthDate,
    required this.email,
    required this.authId,
    required this.createdOn,
  });

  factory Consumer.FromFirebase(Map<String, dynamic> json, String authId) {
    return Consumer(
      name: json["name"],
      birthDate: json["birthDate"].toDate(),
      email: json["email"],
      authId: authId,
      createdOn: json["createdOn"].toDate(),
    );
  }

  @override
  String toString() {
    return 'Consumer('
        'name: $name, '
        'birthDate: $birthDate, '
        'email: $email, '
        'authId: $authId) '
        'createdOn: $createdOn';
  }
}
