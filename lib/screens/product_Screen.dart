import 'package:flutter/material.dart';
import 'package:prc391/screens/productdetail_screen.dart';

class ProductScreen extends StatelessWidget {
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
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: [
                _buildCard('Cookie Choco', '\$3.99', 'images/cookiechoco.jpg',
                    false, context),
                _buildCard('Cookie Classic', '\$3.99',
                    'images/cookieclassic.jpg', true, context),
                _buildCard('Cookie Cream', '\$3.99', 'images/cookiecream.jpg',
                    true, context),
                _buildCard('Cookie Mint', '\$3.99', 'images/cookiemint.jpg',
                    true, context),
                _buildCard('Cookie Vanila', '\$3.99', 'images/cookievan.jpg',
                    true, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String price, String image, bool added, context) {
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
                  price,
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
