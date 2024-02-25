import 'package:flutter/material.dart';
import 'package:uplace/controller/implementations/consumerController.dart';
import 'package:uplace/models/consumer.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/components/utils/error_alert.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userName = "Usuário";

  final ConsumerController _consumerController = ConsumerController();

  @override
  void initState() {
    super.initState();
    _consumerController.addContext(context);
    getConsumer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.blueUplace,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/12842333/pexels-photo-12842333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 50.0,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 34, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.blueUplace, // Cor de fundo do botão
                          ),
                          child: const Column(
                            children: [
                              Text(
                                'Tornar-se um vendedor',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white, // Cor do texto do botão
                                ),
                              ),
                              Text(
                                'Anuncie para outros compradores',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white, // Cor do texto do botão
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          RoutesFunctions.gotoSettingsPage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.blueUplace, // Cor de fundo do botão
                        ),
                        child: const Text(
                          'Configurações',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Cor do texto do botão
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.blueUplace, // Cor de fundo do botão
                        ),
                        child: const Text(
                          'Pedidos',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Cor do texto do botão
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          RoutesFunctions.gotoSettingsPage(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.blueUplace, // Cor de fundo do botão
                        ),
                        child: const Text(
                          'Alterar foto de perfil',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Cor do texto do botão
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: const NavigationUplaceBar(),
    );
  }

  void getConsumer() async {
    var response = await _consumerController.getConsumer();
    if (response.isValid) {
      setState(() {
        var consumer = response.data as Consumer;
        userName = consumer.name;
      });
    } else {
      ErrorAlert(context, errorMessage: response.error);
    }
  }
}
