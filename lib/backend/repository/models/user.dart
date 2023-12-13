class User {
  String idProfile;
  String name;
  DateTime birthDate;

  User({
    required this.idProfile,
    required this.name,
    required this.birthDate,
  });

  factory User.FromFirebase(Map<String, dynamic> json, String userId) => User(
        idProfile: userId,
        name: json["name"],
        birthDate: json["birthdate"].toDate(),
      );
}
