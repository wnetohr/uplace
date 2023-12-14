import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/frontend/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                const CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage(
                      'assets/user_icon_loginpage.png'), // Image path just for testing purposes
                ),
                const SizedBox(
                  height: 20,
                ),
                // Email Field
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Seu endereço de e-mail'),
                ),

                // Password Field
                const TextField(
                  decoration: InputDecoration(labelText: '**********'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Forgot Password
                TextButton(
                  onPressed: () {
                    // Add logic for forgot password
                  },
                  child: const Text('Esqueci minha senha'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Sign In Button
                ElevatedButton(
                  onPressed: () {
                    RoutesFunctions.gotoHomePage(context);
                  },
                  child: const Text('Entrar'),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Login Social
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: IconButton(
                      icon: const Icon(
                        Icons.facebook,
                        size: 40,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Add logic for Facebook login
                      },
                    )),
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
                  height: 20,
                ),
                // Sign Up Button
                TextButton(
                  onPressed: () {
                    // Add logic for sign up
                  },
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
