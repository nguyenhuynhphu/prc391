import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/widgets/order_detail.dart';
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            ProductGrid(),
            FlatButton(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return OrderDetailScreen();
                    })),
                child: Hero(
                  tag: 'order',
                  child: Material(
                      type: MaterialType.transparency, // likely
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
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
                                  "33 items =  \$ 44.00",
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
