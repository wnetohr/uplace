import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; //mouse acting as a touch
import 'package:firebase_core/firebase_core.dart';
import 'package:uplace/repository/implementations/firestore/firebase_options.dart';
import 'package:uplace/widgtes/components/uplace_theme.dart';
import 'package:uplace/widgtes/pages/loginpage.dart'; //firebase

//Class that allows the horizontal scroll works on the 3 subpages,
// since it was deprecated to use the mouse to act as a touch
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() async {
  // adicionei o async por conta do await do firebase
  WidgetsFlutterBinding
      .ensureInitialized(); //essa linha é necessária para corrigir um erro do android
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'uPlace',
      theme: uPlaceTheme,
      home: const LoginPage(),
    );
  }
}
