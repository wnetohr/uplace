import 'package:uplace/backend/application/dtos/newUserDto.dart';
import 'package:uplace/backend/application/services/implementations/authService.dart';
import 'package:uplace/backend/controller/interfaces/baseController.dart';
import 'package:uplace/backend/handling/response.dart';

class AuthController extends BaseController {
  final AuthService _authService = AuthService();

  AuthController();

  Future<Response> emailSignUp() async {
    var newUser = NewUserDTO.FromDefaultEmail("gabrielr.nogueira2000@gmail.com",
        "123456", "123456", "gabriel", DateTime(2000, 1, 2));

    return awnser(await _authService.emailSignUp(newUser));
  }
}
