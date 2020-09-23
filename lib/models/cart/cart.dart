import 'package:prc391/models/product/Product.dart';
import 'item.dart';

class Cart {
  Map<int, Item> shopping_cart = new Map();
  double total = 0;
  int sumQuantity = 0;
  Cart({
    this.shopping_cart,
  });

  void addItem(Product product) {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    if (shopping_cart.containsKey(product.id)) {
      shopping_cart.update(product.id, (value) {
        value.quantity + 1;
        return value;
      });
    } else {
      shopping_cart[product.id] = new Item(product: product, quantity: 1);
    }
    totalPrice();
    totalQuantity();
  }

  void editQuantity(id, quantity) {}

  void deleteItem(int id) {
    shopping_cart.remove(id);
  }

  void totalPrice() {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    shopping_cart.forEach((key, value) {
      total += value.product.price * value.quantity;
    });
  }

  void totalQuantity() {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    shopping_cart.forEach((key, value) {
      sumQuantity += value.quantity;
    });
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        // id: json['id'],
        // price: json['price'],
        // name: json['name'],
        // desc: json['desc'],
        // image: json['image']
        );
  }

  Map toJson() => {
        // 'id': id,
        // 'name': name,
        // 'price': price,
        // 'desc': desc,
        // 'image': image,
      };
}
