import 'dart:ffi';

class Product {
  int id;
  String name;
  double price;
  String desc;
  String image;

  Product({
    this.id,
    this.name,
    this.price,
    this.desc,
    this.image,
  });

  Product.id({
    this.name,
    this.price,
    this.desc,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        price: json['price'],
        name: json['name'],
        desc: json['desc'],
        image: json['image']);
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'desc': desc,
        'image': image,
      };
}
