import 'package:dummy_ecommerce/models/products.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dummy_ecommerce/helper/Cart.dart';
import 'package:transparent_image/transparent_image.dart';
class CartTile extends StatelessWidget {
  Cart c = new Cart();
  Products product;
  CartTile({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: product.image,),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "INR ${product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Color(0xFFFF7643)),
                        children: [
                          // TextSpan(
                          //     text: " x${cart.numOfItem}",
                          //     style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.delete), onPressed: (){
                      Provider.of<Cart>(context, listen: false).removeFromCart(product);
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Success"),
                          content: Text("Removed"),
                        );
                      });
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
