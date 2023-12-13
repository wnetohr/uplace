import 'package:uplace/backend/repository/firestore/collections/baseFSRepository.dart';

class UserFSRepository extends BaseFSRepository {
  static final UserFSRepository _firestoreProfileRepository =
      UserFSRepository._internal();

  factory UserFSRepository() {
    _firestoreProfileRepository.configure("user");
    return _firestoreProfileRepository;
  }

  UserFSRepository._internal();
}
