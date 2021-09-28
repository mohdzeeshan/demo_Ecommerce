import 'dart:convert';
import 'package:dummy_ecommerce/models/products.dart';
import 'package:http/http.dart' as http;


class Data {
  List<Products> products = [];
  Future<void> getData()async{
    print("inside getData");
    String url ="https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {

      jsonData.forEach((element) {
         {
          Products productsData = Products.fromJson(element);
          products.add(productsData);
        }
      });
    }

  }
}