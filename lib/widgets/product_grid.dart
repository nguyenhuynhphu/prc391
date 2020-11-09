import 'package:flutter/material.dart';
import 'package:prc391/models/cart/cart.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/widgets/product_item.dart';

class ProductGrid extends StatefulWidget {
  final User currentUser;
  final void Function() refresh;
  final List<Product> items;
  final void Function(Product) addToCart;
  final void Function(int) subFromCart;
  final Cart cart;
  const ProductGrid(
      {Key key,
      this.items,
      this.addToCart,
      this.subFromCart,
      this.cart,
      this.refresh,
      this.currentUser})
      : super(key: key);
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 240,
            child: widget.items == null
                ? Center(
                    child: Text(
                      'List items is empty',
                      style: TextStyle(color: Colors.black45, fontSize: 30),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.8,
                    children: [
                      for (Product item in widget.items)
                        // _productItem(item, widget.addToCart, context)
                        ProductItem(
                            item: item,
                            addToCart: widget.addToCart,
                            subFromCart: widget.subFromCart,
                            cart: widget.cart,
                            refresh: widget.refresh,
                            currentUser: widget.currentUser)
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
