import 'package:flutter/widgets.dart';
import 'package:uplace/controller/handling/errorHandler.dart';
import 'package:uplace/controller/handling/response.dart';
import 'package:uplace/repository/implementations/authentication/firebaseAuthRepository.dart';
import 'package:uplace/repository/implementations/firestore/bannedUsersFSRepository.dart';
import 'package:uplace/repository/interfaces/authRepositoryInterface.dart';
import 'package:uplace/repository/interfaces/bannedUsersRepositoryInterface.dart';
import 'package:uplace/widgtes/routes/routes.dart';

class BaseController {
  final ErrorHandler _errorHandler = ErrorHandler();
  final BannedUsersRepositoryInterface _bannedUsersRepository =
      BannedUsersFSRepository();
  final AuthRepositoryInterface _firebaseAuthRepository =
      FirebaseAuthRepository();

  late BuildContext _context;

  BaseController();

  void _kickUser() {
    // TODO: deslogar usuario
    RoutesFunctions.gotoLoginPage(_context);
  }

  void addContext(BuildContext context) {
    _context = context;
  }

  Future<bool> validateLogedUser() async {
    var user = _firebaseAuthRepository.getUser();
    if (user == null) {
      _errorHandler.setError("Não foi possivel validar o login do seu usuário");
      return false;
    }

    var bannedUsers = await _bannedUsersRepository.getBannedUsers();
    if (bannedUsers != null &&
        bannedUsers.isNotEmpty &&
        bannedUsers.any((e) => e.email == user.email)) {
      _errorHandler.setError("Usuario banido");
      _kickUser();
      return false;
    }

    return true;
  }

  Response awnser(data) {
    String? error = _errorHandler.validateError();
    if (error != null) {
      return Response.error(error);
    }
    return Response.success(data);
  }
}
