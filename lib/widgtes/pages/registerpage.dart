import 'package:flutter/material.dart';
import 'package:uplace/application/dtos/newUserDTO.dart';
import 'package:uplace/controller/implementations/authController.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Controllers for textformfields
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userConfirmPasswordController =
      TextEditingController();
  //Booleands for password and email verification
  bool _isPasswordValid = true;
  bool _isEmailValid = true;

  final AuthController _authController = AuthController();

  @override
  void initState() {
    super.initState();
    _authController.addContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.greenUplace, size: 35),
        backgroundColor: AppColors.blueUplace,
        centerTitle: true,
        title: const Text(
          'Registrar conta',
          style: TextStyle(color: AppColors.greenUplace),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nome",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: _userNameController,
                obscureText: false,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteUplace,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: 'Insira seu nome'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "E-mail",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: _userEmailController,
                obscureText: false,
                decoration: _isEmailValid
                    ? const InputDecoration(
                        filled: true,
                        fillColor: AppColors.whiteUplace,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        labelText: 'Insira seu e-mail')
                    : const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 155, 148),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        labelText: 'Digite um e-mail válido'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = _isValidEmail(value);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Senha",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: _userPasswordController,
                obscureText: true,
                decoration: _isPasswordValid
                    ? const InputDecoration(
                        filled: true,
                        fillColor: AppColors.whiteUplace,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        labelText: 'Insira sua senha')
                    : const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 252, 155, 148),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        labelText: 'A senha deve ter mais de 8 digitos'),
                onChanged: (value) {
                  setState(() {
                    _isPasswordValid = _isValidPassword(value);
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Confirme sua senha",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                controller: _userConfirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteUplace,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: 'Insira sua senha novamente'),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 220, // Ajuste a largura do botão conforme necessário
                  height: 60, // Ajuste a altura do botão conforme necessário
                  child: ElevatedButton(
                    onPressed: () async {
                      _createAccount();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.blueUplace), // Cor de fundo do botão
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                        color:
                            AppColors.greenUplace, // Cor do texto 'Entrar'
                        fontSize: 28, // Ajusta o tamanho do texto
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidRegister() {
    bool _isValid = false;
    if (_userNameController.text.isNotEmpty &&
        _userEmailController.text.isNotEmpty &&
        _userPasswordController.text.isNotEmpty &&
        _userConfirmPasswordController.text.isNotEmpty) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    return _isValid;
  }

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool _isValidPassword(String password) {
    return password.length >= 8 &&
        password.contains(RegExp(r'[a-zA-Z]')) &&
        password.contains(RegExp(r'[0-9]'));
  }

  void _createAccount() async {
    String senha = _userPasswordController.text;
    String confirmarSenha = _userConfirmPasswordController.text;
    bool _isValid = _isValidRegister();
    if (_isValid &&
        _isEmailValid &&
        _isPasswordValid &&
        senha == confirmarSenha) {
      var newUser = NewUserDTO.FromDefaultEmail(
          _userEmailController.text,
          _userPasswordController.text,
          _userConfirmPasswordController.text,
          _userNameController.text,
          DateTime(2000, 12, 19));
      var response = await _authController.emailSignUp(newUser);
      if (response.isValid) {
        RoutesFunctions.gotoHomePage(context);
      } else {
        ErrorAlert(context, errorMessage: response.error!);
      }
    } else {
      ErrorAlert(context,
          errorMessage: "Verifique se as informações estão válidas.");
    }
  }
}
