import 'package:flutter/material.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/screens/productdetail_screen.dart';

class ProductScreen extends StatefulWidget {
  final List<Product> items;

  const ProductScreen({Key key, this.items}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                      for (Product i in widget.items)
                        _buildCard(i.name, i.price.toString(), i.image, context)
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String image, context) {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {},
        onLongPress: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                    image: image,
                    name: name,
                    price: price,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
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
                  price + '\$',
                  style: TextStyle(
                      color: Color.fromRGBO(44, 209, 172, 1),
                      fontFamily: 'Varela',
                      fontSize: 20),
                ),
                Text(
                  name,
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
