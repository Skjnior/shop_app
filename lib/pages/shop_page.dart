import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/componets/my_produc_tile.dart';
import 'package:shop_app/main.dart';

import '../componets/my_drawer.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products  in shop
    final products = context.watch<Shop>().shop;


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
            "Shop Page",
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(
                Icons.shopping_cart_outlined,
              )
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25,),
          // shop title
          Center(
              child: Text("Pick from a selected list of premium products")),


          // shop subtitle


          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // get each individual product from
                final product = products[index];

                return MyProducTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
