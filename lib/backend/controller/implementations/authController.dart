import 'package:uplace/backend/application/dtos/newUserDto.dart';
import 'package:uplace/backend/application/services/implementations/authService.dart';

class AuthController {
  final AuthService _authService = AuthService();

  AuthController();

  void emailSignUp() {
    var newUser = NewUserDTO.FromDefaultEmail("gabrielr.nogueira2000@gmail.com",
        "123456", "123456", "gabriel", DateTime(2000, 1, 2));

    _authService.emailSignUp(newUser);
  }
}
