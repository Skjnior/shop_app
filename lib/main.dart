import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/shop.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/intro_page.dart';
import 'package:shop_app/pages/shop_page.dart';
import 'package:shop_app/themes/light_mode.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page':(context) => const IntroPage(),
        '/shop_page':(context) => const ShopPage(),
        '/cart_page':(context) =>  CartPage(),
      },
    );
  }
}

