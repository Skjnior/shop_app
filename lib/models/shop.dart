import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/product.dart';

class Shop extends ChangeNotifier{
  // products for sal
  final List<Product> _shop = [
    // produc 1
    Product(
        name: "Mac book M1",
        price: 99.99,
        description: "Item description.. more description....",
        imagePath: "assets/images/M1.webp"
    ),
    // produc 2
    Product(
        name: "Mac book M3 Pro",
        price: 53.99,
        description: "Item description",
        imagePath: "assets/images/M3.jpeg"
    ),
    // produc 3
    Product(
        name: "T-Shirt",
        price: 72.09,
        description: "Item description",
        imagePath: "assets/images/shirt.jpeg"
    ),
    // produc 4
    Product(
        name: "Watch",
        price: 85.99,
        description: "Item description",
        imagePath: "assets/images/uncle.jpeg"
    ),
    Product(
        name: "Glass",
        price: 85.99,
        description: "Item description",
        imagePath: "assets/images/lunette.jpg"
    ),
  ];


  // user cart
List<Product> _cart = [];


  // get product list
List<Product> get shop => _shop;


// get user cart
List<Product> get cart => _cart;


// add item to cart
void addToCart(Product item) {
  _cart.add(item);
  notifyListeners();
}



// remove item cart
  void removeToCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }



}