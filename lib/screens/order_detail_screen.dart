import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/cart/cart.dart';
import 'package:prc391/models/cart/item.dart';
import 'package:prc391/services/notify.dart';
import 'package:prc391/widgets/loading-circle.dart';

class OrderDetailScreen extends StatefulWidget {
  final Cart cart;
  final Stream<Cart> cartStream;

  OrderDetailScreen(this.cart, this.cartStream);

  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
  bool cartIsNotNull;
  bool isWait;

  @override
  void initState() {
    cartIsNotNull = widget.cart.isEmpty();
    isWait = false;
    super.initState();
  }

  void deleteFromCart(int id) {
    // widget.deleteFromCart(id);
    widget.cart.deleteItem(id);
    setState(() {
      cartIsNotNull = widget.cart.isEmpty();
    });
  }

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
                      !cartIsNotNull
                          ? StreamBuilder<Cart>(
                              stream: widget.cartStream,
                              initialData: widget.cart,
                              builder: (context, snapshot) {
                                return Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height:
                                      MediaQuery.of(context).size.height - 155,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    children: snapshot.data.shopping_cart.values
                                        .map<Widget>((e) => _ItemOrder(
                                            e, deleteFromCart, context))
                                        .toList(),
                                  ),
                                );
                              })
                          : Center(
                              child: Text(
                              'Nothing in cart',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
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
                              StreamBuilder<Cart>(
                                  stream: widget.cartStream,
                                  initialData: widget.cart,
                                  builder: (context, snapshot) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            widget.cart.total.toString() + '\$',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              Divider(
                                height: 1,
                                color: Colors.black,
                              ),
                              FlatButton(
                                onPressed: () {
                                  !cartIsNotNull
                                      ? checkOut(widget.cart.total.toString())
                                      : Navigator.pop(context);
                                },
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
                                      child: !cartIsNotNull
                                          ? Row(
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
                                                isWait
                                                    ? LoadingCircle(
                                                        30, Colors.white)
                                                    : Icon(
                                                        Icons.payment,
                                                        color: Colors.white,
                                                        size: 35,
                                                      ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Back to store",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center,
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

  Future<int> checkOut(String total) async {
    setState(() {
      isWait = true;
    });
    widget.cart.checkOut().then((value) => {
          if (value) {PushNotificationService.pushNotification(total)}
        });
    setState(() {
      isWait = false;
    });
    return 0;
  }
}

Widget _ItemOrder(Item item, Function(int) deleteFromCart, context) {
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
              item.quantity.toString() + 'x',
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
                item.product.name,
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
                    'price: ' + item.product.price.toString() + '\$',
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

        Container(
          margin: EdgeInsets.all(10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(color: Colors.redAccent),
          child: FlatButton(
            onPressed: () {
              deleteFromCart(item.product.id);
            },
            child: Center(
                child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            )),
          ),
        ),
        // )
      ],
    ),
  );
}
