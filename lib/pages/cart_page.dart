import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/componets/my_button.dart';
import 'package:shop_app/componets/my_produc_tile.dart';

import '../models/product.dart';
import '../models/shop.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});


  // Remove item in the cart
  void removeItemFromCart(BuildContext context, Product product) {
    // Show the dialogBox to remove item to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Remove this item to your cart"),
          actions: [

            // Cancel button to return
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            MaterialButton(
              onPressed: () {
                // pop dialog box
                Navigator.pop(context);

                //add to cart
                context.read<Shop>().removeToCart(product);
              },
              child: const Text("Yes"),
            ),
          ],
        )
    );
  }


  // Message for the payment
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>  AlertDialog(
          content: Text(
            "User wants to pay! Connect this app to your payment backend"
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            MaterialButton(
              onPressed: () {
                // pop dialog box
                Navigator.pop(context);

                //connect to the payment backend

              },
              child: const Text("Yes"),
            ),
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: const Text("Your cart is empty..."))
                : ListView.builder(
              itemCount: cart.length,
             itemBuilder: (context, index) {
               // Get individual item in cart
               final item = cart[index];

               // Return as a cart tile UI
               return ListTile(
                 title: Text(item.name),
                 subtitle: Text(item.price.toString()),
                 trailing: IconButton(
                     onPressed: () => removeItemFromCart(context, item),
                     icon: const Icon(
                       Icons.delete,
                       color: Colors.red,
                     )
                 ),
               );
             },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")
            ),
          )
        ],
      ),
    );
  }
}
