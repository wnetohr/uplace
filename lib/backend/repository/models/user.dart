class User {
  String profileId;
  String name;
  DateTime birthDate;

  User({
    required this.profileId,
    required this.name,
    required this.birthDate,
  });

  factory User.FromFirebase(Map<String, dynamic> json, String userId) => User(
        profileId: userId,
        name: json["name"],
        birthDate: json["birthdate"].toDate(),
      );
}
