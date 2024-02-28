import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ConfirmPurchasePage extends StatefulWidget {
  final Seller seller;
  ConfirmPurchasePage({super.key, required this.seller});

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.seller.imageSeller),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.seller.shopName,
                    style: TextStyle(
                      color: AppColors.greenUplace,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.95,
                child: Container(
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
              ),
              FractionallySizedBox(
                widthFactor: 0.90,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.blueUplace,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 30),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            size: 20,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 4),
                          FittedBox(
                            fit: BoxFit
                                .scaleDown, // Redimensiona o texto para caber dentro do widget
                            child: Text(
                              'WhatsApp',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.greenUplace),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        RoutesFunctions.gotoChatPage(context, widget.seller);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message_rounded,
                            size: 20,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Chat',
                            style: TextStyle(
                                fontSize: 12, color: AppColors.greenUplace),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueUplace,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.telegram,
                            size: 20,
                            color: AppColors.greenUplace,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Telegram',
                            style: TextStyle(
                                fontSize: 12, color: AppColors.greenUplace),
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
