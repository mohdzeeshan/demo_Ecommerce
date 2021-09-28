import 'package:dummy_ecommerce/helper/Data.dart';
import 'package:dummy_ecommerce/models/products.dart';
import 'package:dummy_ecommerce/views/CartScreen.dart';
import 'package:dummy_ecommerce/views/CartTile.dart';
import 'package:dummy_ecommerce/views/ProductTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Products> productList = [];
  bool _loading = true;
  bool addedToCart = false;
  Data newData = Data();


  Future<void> get() async{
    Data newData = Data();
    try{await newData.getData();}
    catch(e){print("Error is $e");}
    productList = newData.products;

    setState(() {
      _loading = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      get();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<bool>(
      create: (context)=> addedToCart,

      child: Scaffold(
        appBar: AppBar(
          elevation: 8,
          leading: Icon(Icons.menu),
          title: Text("Ecommerce Demo"),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },),
          ],
        ),
        body: _loading
      ? Center(
      child: Container(
      child: CircularProgressIndicator(),
      ),
        ) :
            Container(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: productList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductTile(
                      product: productList[index],
                    );
                  }),
            ),
      ),
    );
  }
}
