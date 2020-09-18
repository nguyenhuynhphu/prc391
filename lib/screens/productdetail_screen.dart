import 'package:flutter/material.dart';
import 'package:prc391/widgets/bottombar_product_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  final image, price, name;

  const ProductDetailScreen({Key key, this.image, this.price, this.name})
      : super(key: key);

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              Hero(
                tag: image,
                child: Image.asset(
                  image,
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
                    name,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    price,
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
                'Description: ' +
                    '''the cookie is in the cookie jar
the cookie is now a picture
the cookie monster tries to steal the cookie but''',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBarProduct(),
    );
  }
}
