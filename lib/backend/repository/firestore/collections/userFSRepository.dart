import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uplace/backend/repository/firestore/collections/baseFSRepository.dart';
import 'package:uplace/backend/repository/models/user.dart';

class UserFSRepository extends BaseFSRepository {
  static final UserFSRepository _firestoreProfileRepository =
      UserFSRepository._internal();

  factory UserFSRepository() {
    _firestoreProfileRepository.configure("user");
    return _firestoreProfileRepository;
  }

  UserFSRepository._internal();

  Future<List<User>>? getAllUsers() async {
    QuerySnapshot usersQuery = await db.get();
    List<User> users = usersQuery.docs
        .map((e) => User.FromFirebase(e.data() as Map<String, dynamic>, e.id))
        .toList();
    return users;
  }
}
