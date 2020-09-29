import 'package:prc391/models/product/Product.dart';

class Item {
  Product product;
  int quantity = 0;
  Item({this.product, this.quantity});
  Map toJson() => {
        'product_id': product.id,
        'quantity': quantity,
      };
}
