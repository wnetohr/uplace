class BannedUser {
  String email;

  BannedUser({required this.email});

  factory BannedUser.FromFirebase(Map<String, dynamic> json) {
    return BannedUser(
      email: json["email"],
    );
  }
}
