import 'package:uplace/backend/application/dtos/newUserDto.dart';
import 'package:uplace/backend/application/services/implementations/authService.dart';
import 'package:uplace/backend/controller/interfaces/baseController.dart';
import 'package:uplace/backend/handling/response.dart';

class AuthController extends BaseController {
  final AuthService _authService = AuthService();

  AuthController();

  Future<Response> emailSignUp(NewUserDTO newUser) async {
    return awnser(await _authService.emailSignUp(newUser));
  }
}
