import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ConfirmPurchasePage extends StatefulWidget {
  const ConfirmPurchasePage({Key? key}) : super(key: key);

  @override
  _ConfirmPurchasePageState createState() => _ConfirmPurchasePageState();
}

class _ConfirmPurchasePageState extends State<ConfirmPurchasePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueUplace,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/247899/pexels-photo-247899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Doces do Jão',
                    style: TextStyle(
                      color: AppColors.greenUplace,
                    ),
                  ),
                ],
              ),
              const Text(
                'Pedido N° 1', // Mudará futuramente, só visual
                style: TextStyle(
                  fontSize: 16, // Tamanho menor do texto
                  color: AppColors.greenUplace, // Cor do texto
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://fastly.4sqi.net/img/general/600x600/56867240_97Zuuj05YE1ws9gohnxS_mOhktrANOdFoIl1zgSZ1aY.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.blueUplace,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Local: CEAGRI 2',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Você está comprando:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200, // Altura fixa para o ListView.builder
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: Text('Nome do Item $index'),
                      subtitle: Text('Descrição do Item $index'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            size: 30,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'WhatsApp',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greenUplace),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        RoutesFunctions.gotoChatPage(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message_rounded,
                            size: 30,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Chat',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greenUplace),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.telegram,
                            size: 30,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Telegram',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.greenUplace),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
