class Consumer {
  String name;
  String authId;
  String email;
  DateTime birthDate;

  Consumer(
      {required this.name,
      required this.birthDate,
      required this.email,
      required this.authId});

  factory Consumer.FromFirebase(Map<String, dynamic> json, String authId) {
    return Consumer(
      name: json["name"],
      birthDate: json["birthDate"].toDate(),
      email: json["email"],
      authId: authId,
    );
  }

  @override
  String toString() {
    return 'Consumer('
        'name: $name, '
        'birthDate: $birthDate, '
        'email: $email, '
        'authId: $authId)';
  }
}
