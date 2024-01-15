import 'package:flutter/material.dart';
import 'package:uplace/frontend/colors.dart';
import 'package:uplace/frontend/routes/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              const Text("Nome",style: TextStyle(fontSize: 18),),
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greenUplace,
                    border: OutlineInputBorder(),
                    labelText: 'Insira seu nome'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("E-mail",style: TextStyle(fontSize: 18),),
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greenUplace,
                    border: OutlineInputBorder(),
                    labelText: 'Insira seu e-mail'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Senha",style: TextStyle(fontSize: 18),),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greenUplace,
                    border: OutlineInputBorder(),
                    labelText: 'Insira sua senha'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Confirme sua senha",style: TextStyle(fontSize: 18),),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.greenUplace,
                    border: OutlineInputBorder(),
                    labelText: 'Insira sua senha novamente'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 220, // Ajuste a largura do botão conforme necessário
                  height: 60, // Ajuste a altura do botão conforme necessário
                  child: ElevatedButton(
                    onPressed: () {
                      RoutesFunctions.gotoHomePage(context);
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
                        color: AppColors.lightblueUplace, // Cor do texto 'Entrar'
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
}
