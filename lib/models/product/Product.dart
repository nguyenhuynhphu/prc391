import 'dart:ffi';

class Product {
  int id;
  String name;
  double price;
  String description;
  String image;

  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.image,
  });

  Product.id({
    this.name,
    this.price,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        price: json['price'],
        name: json['name'],
        description: json['desc'],
        image: json['image']);
  }

  Map toJson() => {
        'id': id,
        'price': price,
      };

  List<Product> searchProduct(name, items) {
    List<Product> result = [];
    for (Product item in items) {
      if (item.name.toLowerCase().contains(name)) {
        result.add(item);
      }
    }
    return result == [] ? null : result;
  }
}
