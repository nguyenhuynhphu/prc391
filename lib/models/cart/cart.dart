import 'package:prc391/models/product/Product.dart';
import 'item.dart';

class Cart {
  Map<int, Item> shopping_cart = new Map();
  double total = 0;
  int sumQuantity = 0;
  Cart({
    this.shopping_cart,
  });
  bool isEmpty() {
    return shopping_cart == null || shopping_cart.isEmpty;
  }

  void addItem(Product product) {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    if (shopping_cart.containsKey(product.id)) {
      shopping_cart.update(product.id, (value) {
        value.quantity += 1;
        return value;
      });
    } else {
      shopping_cart[product.id] = new Item(product: product, quantity: 1);
    }
    // totalQuantity();
    // totalPrice();
    sumQuantity += 1;
    total += product.price;
  }

  void subItem(int id) {
    if (shopping_cart == null) {
      return;
    }
    if (shopping_cart.containsKey(id)) {
      bool flag = false;
      shopping_cart.update(id, (value) {
        if (value.quantity != 0) {
          value.quantity -= 1;
          sumQuantity -= 1;
          if (value.quantity == 0) {
            flag = true;
          }
          return value;
        }
      });
      if (flag) {
        deleteItem(id);
      }
    }
    totalPrice();
  }

  void editQuantity(id, quantity) {}

  void deleteItem(int id) {
    shopping_cart.remove(id);
    totalPrice();
    totalQuantity();
  }

  void totalPrice() {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    total = 0;
    shopping_cart.forEach((key, value) {
      total += value.product.price * value.quantity;
    });
  }

  void totalQuantity() {
    if (shopping_cart == null) {
      shopping_cart = new Map();
    }
    sumQuantity = 0;
    shopping_cart.forEach((key, value) {
      sumQuantity += value.quantity;
    });
  }
}
