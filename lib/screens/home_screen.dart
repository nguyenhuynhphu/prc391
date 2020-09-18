import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/product_Screen.dart';
import 'package:prc391/screens/order_detail.dart';
import 'package:prc391/widgets/product_grid.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 9, right: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width -
                        15 * 2 -
                        7 * 1 -
                        1 * 2 -
                        50,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'example: cookie',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                        color: Color.fromRGBO(44, 209, 172, 1),
                      ),
                      child: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 240,
              width: MediaQuery.of(context).size.width,
              child: ProductScreen(),
            ),
            FlatButton(
                color: Colors.transparent,
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return OrderDetailScreen();
                    })),
                child: Hero(
                  tag: 'order',
                  child: Material(
                      type: MaterialType.transparency, // likely
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 40,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(44, 209, 172, 1)),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "33 items = 44.00 \$",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              right: 10,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )),
          ],
        ));
  }
}
