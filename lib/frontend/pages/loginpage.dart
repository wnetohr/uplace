import 'package:flutter/material.dart';
import 'package:uplace/backend/repository/firestore/collections/sellerFSRepository.dart';
import 'package:uplace/backend/repository/firestore/collections/userFSRepository.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/frontend/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserFSRepository userRepository = UserFSRepository();
  SellerFSRepository sellerRepository = SellerFSRepository();

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
                SizedBox(
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
                SizedBox(
                  height: 20,
                ),
                // Forgot Password
                TextButton(
                  onPressed: () {
                    // Add logic for forgot password
                  },
                  child: const Text('Esqueci minha senha'),
                ),
                SizedBox(
                  height: 20,
                ),
                // Sign In Button
                ElevatedButton(
                  onPressed: () async {
                    var users = await userRepository.getAllUsers();
                    var sellers = await sellerRepository.getAllUsers();
                    RoutesFunctions.gotoHomePage(context);
                  },
                  child: const Text('Entrar'),
                ),
                SizedBox(
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
                        // Add logic for Twitter login
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
                        // Add logic for Twitter login
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
                SizedBox(
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
