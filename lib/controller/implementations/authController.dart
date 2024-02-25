import 'package:uplace/application/dtos/newUserDTO.dart';
import 'package:uplace/application/services/implementations/authService.dart';
import 'package:uplace/controller/baseController.dart';
import 'package:uplace/controller/handling/response.dart';

class AuthController extends BaseController {
  final AuthService _authService = AuthService();

  AuthController();

  Future<Response> emailSignUp(NewUserDTO newUser) async {
    return awnser(await _authService.emailSignUp(newUser));
  }

  Future<Response> emailLogin(String email, String password) async {
    return awnser(await _authService.emailLogin(email, password));
  }

  Future<Response> signOut() async {
    return awnser(await _authService.signOut());
  }
}
