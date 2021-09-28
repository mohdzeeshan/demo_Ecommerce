import 'package:dummy_ecommerce/helper/Cart.dart';
import 'package:dummy_ecommerce/views/CartTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cart c = new Cart();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Text("Your Cart"),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },),
        ],
      ),
      body: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: Provider.of<Cart>(context).cartProducts.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return CartTile(
                  product: Provider.of<Cart>(context).cartProducts[index],
                );
              }),


        ),
      ),
    );
  }
}
