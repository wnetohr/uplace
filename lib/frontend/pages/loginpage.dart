import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';

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

            // Email Field
            const TextField(
              decoration: InputDecoration(labelText: 'Seu endereço de e-mail'),
            ),

            // Password Field
            const TextField(
              decoration: InputDecoration(labelText: '**********'),
            ),

            // Forgot Password
            TextButton(
              onPressed: () {
                // Add logic for forgot password
              },
              child: const Text('Esqueci minha senha'),
            ),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Add logic for sign in
              },
              child: const Text('Entrar'),
            ),

            // Login Social
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add logic for Facebook login
                    },
                    icon: const Icon(Icons.facebook),
                    label: const Text('Facebook'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add logic for Twitter login
                    },
                    icon: const Icon(Icons.star),
                    label: const Text('Twitter'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add logic for Google login
                    },
                    icon: const Icon(Icons.abc),
                    label: const Text('Google'),
                  ),
                )
              ],
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
    );
  }
}
