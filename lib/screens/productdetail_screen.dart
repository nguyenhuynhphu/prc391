import 'package:flutter/material.dart';
import 'package:prc391/models/cart/cart.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/widgets/bottombar.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product item;
  final Stream cartStream;
  final Cart cart;
  final void Function() addItem;
  final void Function() subItem;

  const ProductDetailScreen({
    Key key,
    this.item,
    this.cartStream,
    this.addItem,
    this.subItem,
    this.cart,
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity;
  @override
  void initState() {
    try {
      quantity = widget.cart.shopping_cart[widget.item.id].quantity;
    } catch (e) {
      quantity = 0;
    }
    super.initState();
  }

  void sub() {
    if (quantity == 0) {
      return;
    }
    int result = quantity - 1;

    setState(() {
      quantity = result;
    });
    widget.subItem();
  }

  void add() {
    setState(() {
      quantity += 1;
    });
    widget.addItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20, color: Color(0xFF545D68)),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              Hero(
                tag: widget.item.image,
                child: Image.network(
                  widget.item.image,
                  height: 150,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    widget.item.price.toString() + '\$',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description: ',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              Text(
                widget.item.description,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Color.fromRGBO(44, 209, 172, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 3,
            ),
            Icon(Icons.fastfood),
            SizedBox(
              height: 5,
            ),
            Text(
              quantity.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(add: add, sub: sub),
    );
  }
}
