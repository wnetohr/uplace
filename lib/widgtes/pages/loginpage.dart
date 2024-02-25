import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/controller/implementations/authController.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers for textformfields
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    _authController.addContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteUplace,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // User Avatar
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.postimg.cc/yxrffDWf/user-icon-loginpage.png'),
                    radius: 90.0,
                    backgroundColor: AppColors.blueUplace,
                  ),
                const SizedBox(
                  height: 40,
                ),
                // Email Field
                TextField(
                  controller: _userEmailController,
                  obscureText: false,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.greenUplace,
                      border: OutlineInputBorder(),
                      labelText: 'Insira seu endereço de e-mail'),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password Field
                TextField(
                  controller: _userPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: AppColors.greenUplace,
                      border: OutlineInputBorder(),
                      labelText: 'Insira sua senha'),
                ),
                const SizedBox(
                  height: 5,
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Add logic for forgot password
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: const Text('Esqueci minha senha'),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Sign In Button
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height:
                            20), // Top container (adjust the height by pushing the button down)
                    Container(), // Lower container (can be adjusted to push button up)
                    Container(
                      width: 180, // Adjust button width as needed
                      height: 60, // Adjust button height as needed
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.blueUplace), // Background button color
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: AppColors
                                .lightblueUplace, // 'Log in' text color
                            fontSize: 28, // Adjust text size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),

                // Login Social
                const Text(
                  'Logar com uma conta social',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 40,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // Add logic for Google login
                      },
                    )),
                    Expanded(
                        child: IconButton(
                      icon: const Icon(
                        Icons.facebook,
                        size: 50,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Add logic for Facebook login
                      },
                    )),
                    Expanded(
                        child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.xTwitter,
                        size: 40,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Add logic for Twitter login
                      },
                    ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Sign Up Button
                TextButton(
                  onPressed: () {
                    RoutesFunctions.gotoRegisterPage(context);
                    // Add logic for sign up
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: const Text('Registre via e-mail'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool _isValidPassword(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[a-zA-Z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }

  void _login() async {
    var email = _userEmailController.text;
    var password = _userPasswordController.text;

    if (!_isValidEmail(email)) {
      ErrorAlert(context, errorMessage: "Email invalido");
      return;
    }

    if (!_isValidPassword(password)) {
      ErrorAlert(context, errorMessage: "Senha invalido");
      return;
    }

    var response = await _authController.emailLogin(email, password);
    if (response.isValid) {
      RoutesFunctions.gotoHomePage(context);
    } else {
      ErrorAlert(context, errorMessage: response.error!);
    }
  }
}
