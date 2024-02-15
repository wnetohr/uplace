import 'package:uplace/models/banned_user.dart';
import 'package:uplace/repository/interfaces/baseRepository.dart';

abstract class BannedUsersRepositoryInterface extends BaseRepository {
  Future<List<BannedUser>?> getBannedUsers();
}
