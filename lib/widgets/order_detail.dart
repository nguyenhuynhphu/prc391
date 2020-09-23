import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/widgets/order_item.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen();
  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Hero(
            tag: 'order',
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(44, 209, 172, 1),
                ),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            OrderItem('Cookie choco', 3.9, 1),
                            OrderItem('Cookie mint', 3.9, 2),
                            OrderItem('Cookie classic', 2, 4),
                            OrderItem('Cookie choco', 3.9, 1),
                            OrderItem('Cookie mint', 3.9, 2),
                            OrderItem('Cookie classic', 2, 4),
                            OrderItem('Cookie choco', 3.9, 1),
                            OrderItem('Cookie mint', 3.9, 2),
                            OrderItem('Cookie classic', 2, 4),
                          ],
                        )),
                    Positioned(
                      top: MediaQuery.of(context).size.height - 150,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 120,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total:',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '99.9\$',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Material(
                                  type: MaterialType.transparency, // likely
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(44, 209, 172, 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.payment,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
