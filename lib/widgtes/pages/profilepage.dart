import 'package:flutter/material.dart';
import 'package:uplace/widgtes/components/navigation_bar.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
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
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/12842333/pexels-photo-12842333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 50.0,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Usuário',
                    style: TextStyle(fontSize: 34, color: Colors.white),
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
                          child: Column(
                            children: [
                              const Text(
                                'Tornar-se um vendedor',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white, // Cor do texto do botão
                                ),
                              ),
                              const Text(
                                'Anuncie para outros compradores',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white, // Cor do texto do botão
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
}
