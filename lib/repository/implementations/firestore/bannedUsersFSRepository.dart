import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/models/banned_user.dart';
import 'package:uplace/repository/interfaces/bannedUsersRepositoryInterface.dart';

class BannedUsersFSRepository extends BannedUsersRepositoryInterface {
  late CollectionReference db;
  static final BannedUsersFSRepository bannedUsersFSRepository =
      BannedUsersFSRepository._internal();

  @override
  void configure() {
    if (!configured) {
      db = FirebaseFirestore.instance.collection("banned_users");
      configured = true;
    }
  }

  BannedUsersFSRepository._internal();
  factory BannedUsersFSRepository() {
    bannedUsersFSRepository.configure();
    return bannedUsersFSRepository;
  }

  @override
  Future<List<BannedUser>?> getBannedUsers() async {
    var ssBannedUsers = await db.get();

    List<BannedUser> bannedUsers = ssBannedUsers.docs
        .map((d) => BannedUser.FromFirebase(d.data() as Map<String, dynamic>))
        .toList();

    return bannedUsers;
  }
}
