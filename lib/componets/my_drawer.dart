import 'package:flutter/material.dart';

import 'my_listTile.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Drawer header
         Column(
           children: [
             DrawerHeader(
               child: Center(
                 child:  Container(
                     decoration: BoxDecoration(
                       color: Theme.of(context).colorScheme.secondary,
                       borderRadius: BorderRadius.circular(25),
                     ),
                     width: double.infinity,
                     padding: const EdgeInsets.all(5),
                     child: Image.asset("assets/images/IMG_9802.PNG")
                 ),
               ),
               decoration: BoxDecoration(
              color: Colors.transparent
               ),
             ),

             const SizedBox(height: 25,),

             // Shop tile
             MyListtile(
               text: "Shop",
               icon: Icons.home,
                 onTap: () => Navigator.pop(context),
             ),



             // Caet tile
             MyListtile(
               text: "Cart",
               icon: Icons.shopping_cart,
               onTap: () => Navigator.pushNamed(context, "/cart_page"),
             ),
           ],
         ),

          // exit shop
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListtile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, "/intro_page", (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
