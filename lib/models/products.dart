// To parse this JSON data, do
//     final products = productsFromJson(jsonString);

import 'dart:convert';

class Products {
  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.quatity
  });

  String id;
  String title;
  double price;
  String description;
  String category;
  String image;
  int quatity;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"].toString(),
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
  );

}
