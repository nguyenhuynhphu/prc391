import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/product_Screen.dart';

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
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children: [
                            _ItemOrder('Cookie choco', 3.9, 1, context),
                            _ItemOrder('Cookie mint', 3.9, 2, context),
                            _ItemOrder('Cookie classic', 2, 4, context),
                          ],
                        ),
                      ),
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
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color:
                                              Color.fromRGBO(44, 209, 172, 1)),
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
                  )),
            )));
  }
}

Widget _ItemOrder(String name, double price, int quantity, context) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    decoration:
        BoxDecoration(border: Border.all(width: 1, color: Colors.black38)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //so luong
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(),
          child: Center(
            child: Text(
              quantity.toString() + 'x',
              style: TextStyle(
                  color: Color.fromRGBO(44, 209, 172, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        //chi tiet
        Container(
          width: MediaQuery.of(context).size.width - 200,
          height: 80,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'price: ' + price.toString() + '\$',
                    style: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 3,
        ),
        // xoa
        Container(
          margin: EdgeInsets.all(10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(color: Colors.redAccent),
          child: Center(
              child: Icon(
            Icons.delete_outline,
            color: Colors.white,
          )),
        )
      ],
    ),
  );
}
