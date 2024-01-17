import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers for textformfields
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

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
                  radius: 80.0,
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
                      labelText: 'Seu endereço de e-mail'),
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
                      labelText: '**********'),
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
                            20), // Container superior (ajuste a altura para empurrar o botão para baixo)
                    Container(), // Container inferior (pode ser ajustado para empurrar o botão para cima)
                    Container(
                      width:
                          180, // Ajuste a largura do botão conforme necessário
                      height:
                          60, // Ajuste a altura do botão conforme necessário
                      child: ElevatedButton(
                        onPressed: () {
                          RoutesFunctions.gotoHomePage(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.blueUplace), // Cor de fundo do botão
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
                                .lightblueUplace, // Cor do texto 'Entrar'
                            fontSize: 28, // Ajusta o tamanho do texto
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
}
