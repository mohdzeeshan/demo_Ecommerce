import 'package:dummy_ecommerce/helper/Cart.dart';
import 'package:dummy_ecommerce/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ProductTile extends StatelessWidget {
  Products product;
ProductTile({@required this.product});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      //margin: EdgeInsets.only(bottom: 2),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: product.image,
                height: 500,),
            ),
            Text(product.title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sale Price:  ${product.price.toString()}",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Spacer(),
                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Share.share(product.image);
                    }),

                IconButton(icon: Icon(Icons.add_shopping_cart_outlined, color:  Colors.black,), onPressed: (){
                  Provider.of<Cart>(context, listen: false).addToCart(product);
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Success"),
                      content: Text("Added to Cart"),
                    );
                  });

                }),

                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
