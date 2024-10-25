import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/main.dart';

import '../models/product.dart';
import '../models/shop.dart';


class MyProducTile extends StatelessWidget {
  final Product product;
  MyProducTile({super.key, required this.product});


  // add to card methode
  void addToCart(BuildContext context) {
    // Show the dialogBox to ask user to confirm to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Add this item to your cart"),
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
                context.read<Shop>().addToCart(product);
              },
              child: const Text("Yes"),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // product image
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [



             AspectRatio(
               aspectRatio: 1,
               child: Container(
                 decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.secondary,
                   borderRadius: BorderRadius.circular(25),
                 ),
                 width: double.infinity,
                 padding: const EdgeInsets.all(25),
                 child: Image.asset(product.imagePath)
               ),
             ),




             const SizedBox(height: 25,),




             // Product name
             Text(
               product.name,
               style: const TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
               ),
             ),



             const SizedBox(height: 10,),



             // product description
             Text(
               product.description,
               style: TextStyle(
                 color: Theme.of(context).colorScheme.inversePrimary,
               ),
             ),
           ],
         ),



          const SizedBox(height: 25,),



          // product price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+ product.price.toString()),

              // add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(
                      Icons.add
                    ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
