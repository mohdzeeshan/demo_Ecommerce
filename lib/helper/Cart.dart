import 'package:dummy_ecommerce/models/products.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier{
  List<Products> cartProducts =[];

  void addToCart(Products product){
    cartProducts.add(product);
    notifyListeners();

  }
  void removeFromCart(Products product){
    cartProducts.remove(product);
    notifyListeners();
  }

  bool isCartEmpty(){
    if(cartProducts.length==0)
      return true;
    else
      return false;
  }
}