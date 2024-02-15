class BannedUser {
  String userEmail;

  BannedUser({required this.userEmail});

  factory BannedUser.FromFirebase(Map<String, dynamic> json) {
    return BannedUser(
      userEmail: json["userEmail"],
    );
  }
}
