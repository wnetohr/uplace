import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uplace/models/items_to_buy.dart';
import 'package:uplace/models/seller.dart';
import 'package:uplace/widgtes/routes/routes.dart';
import 'package:uplace/widgtes/themes/colors.dart';

class ConfirmPurchasePage extends StatefulWidget {
  final Seller seller;
  final ItemsToBuy itemsToBuy;
  ConfirmPurchasePage({
    super.key,
    required this.seller,
    required this.itemsToBuy,
  });

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
                    style: const TextStyle(
                      color: AppColors.greenUplace,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Local: CEAGRI 2',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total da compra: R\$ ${widget.itemsToBuy.total}',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200, //TODO: Remover altura fixa
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.itemsToBuy.getLenght(),
                itemBuilder: (context, index) {
                  var item = widget.itemsToBuy.getByIndex(index);
                  var quantity = widget.itemsToBuy.getQuantityByItem(item);
                  var total = widget.itemsToBuy.getTotalByItem(item);
                  return ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: Text(item.name),
                    subtitle: Text('Quantidade: $quantity - Total R\$ $total'),
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
                const SizedBox(
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
                const SizedBox(
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
    );
  }
}
