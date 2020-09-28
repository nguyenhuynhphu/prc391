import 'package:flutter/material.dart';
import 'package:prc391/models/cart/cart.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/screens/productdetail_screen.dart';

class ProductItem extends StatefulWidget {
  final void Function(Product) addToCart;
  final void Function(int) subFromCart;
  final Cart cart;
  final Product item;
  const ProductItem(
      {Key key, this.item, this.addToCart, this.subFromCart, this.cart})
      : super(key: key);
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void addItem() {
    widget.addToCart(widget.item);
  }

  void subItem() {
    widget.subFromCart(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {
          addItem();
        },
        onLongPress: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                  item: widget.item,
                  addItem: addItem,
                  subItem: subItem,
                  cart: widget.cart)));
        },
        child: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage(widget.item.image), fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ],
              color: Colors.white),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            margin: EdgeInsets.only(top: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.item.price.toString() + '\$',
                  style: TextStyle(
                      color: Color.fromRGBO(44, 209, 172, 1),
                      fontFamily: 'Varela',
                      fontSize: 20),
                ),
                Text(
                  widget.item.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Varela',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
