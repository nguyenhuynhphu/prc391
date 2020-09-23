import 'package:flutter/material.dart';
import 'package:prc391/widgets/bottombar.dart';

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
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(44, 209, 172, 1),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Hero(
              tag: image,
              child: Image.asset(
                image,
                height: 150,
                width: 100,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Color.fromRGBO(44, 209, 172, 1),
        child: Column(children: [
          Text(
            "2",
            style: TextStyle(fontSize: 19),
          ),
          Icon(Icons.fastfood)
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
