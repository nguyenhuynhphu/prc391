import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final String name;
  final double price;
  final int quantity;
  OrderItem(this.name, this.price, this.quantity);
  @override
  OrderItemState createState() => OrderItemState();
}

class OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black38)),
      child: Row(
        children: [
          //so luong
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(),
            child: Center(
              child: Text(
                widget.quantity.toString() + 'x',
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
            width: MediaQuery.of(context).size.width - 190,
            height: 80,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
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
                      'price: ' + widget.price.toString() + '\$',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    ),
                    Text(
                      'total: ' +
                          (widget.price * widget.quantity).toString() +
                          '\$',
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
          //gia va xoa
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
}
