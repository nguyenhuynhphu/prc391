import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/cart/cart.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/screens/order_detail_screen.dart';
import 'package:prc391/services/api_handler.dart';
import 'package:prc391/widgets/loading-circle.dart';
import 'package:prc391/widgets/product_grid.dart';
import 'package:prc391/services/product_service.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final User currentUser;
  final void Function() refresh;
  HomeScreen(this.currentUser, this.refresh);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> items = null;
  List<Product> view_items = null;
  ProductBloc productBloc = ProductBloc();

  Cart cart;
  StreamController streamListController = StreamController<Cart>.broadcast();
  Stream<Cart> get cartStream => streamListController.stream;
  Sink get cartSink => streamListController.sink;

  final txtSearch = TextEditingController();

  void addToCart(Product product) {
    cart.addItem(product);
    cartSink.add(cart);
  }

  void subFromCart(int id) {
    cart.subItem(id);
    cartSink.add(cart);
  }

  void deleteFromCart(int id) {
    cart.deleteItem(id);
    cartSink.add(cart);
  }

  @override
  void initState() {
    fetchProduct();
    cart = new Cart();
    cartSink.add(cart);
    super.initState();
  }

  @override
  void dispose() {
    txtSearch.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (items == null)
      return Container(
        child: LoadingCircle(50, Colors.black),
      );
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            //thanh tim kiem
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
                      controller: txtSearch,
                      onChanged: (value) {
                        bool flag = productBloc.searchProduct(value, items);
                        //xu ly neu search ko ra
                      },
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
                          onPressed: () {
                            String name = txtSearch.text;
                            bool flag = productBloc.searchProduct(name, items);
                            //xu ly neu search ko ra
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )))
                ],
              ),
            ),

            //-------------list item
            Container(
              height: MediaQuery.of(context).size.height - 240,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<Object>(
                  stream: productBloc.productStream,
                  initialData: view_items,
                  builder: (context, snapshot) {
                    return ProductGrid(
                        currentUser: widget.currentUser,
                        items: snapshot.data,
                        addToCart: addToCart,
                        subFromCart: subFromCart,
                        cart: cart,
                        refresh: widget.refresh);
                  }),
            ),

            //--------Button thanh toan
            FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OrderDetailScreen(cart, cartStream)));
                },
                child: Hero(
                  tag: 'order',
                  child: Material(
                      type: MaterialType.transparency, // likely
                      child: StreamBuilder<Cart>(
                          initialData: cart,
                          stream: cartStream,
                          builder: (context, snapshot) {
                            return Container(
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
                                        snapshot.data.sumQuantity.toString() +
                                            " items = " +
                                            snapshot.data.total.toString() +
                                            " \$",
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
                            );
                          })),
                )),
          ],
        ));
  }

//exetension function
  Future<List<Product>> fetchProduct() async {
    List<Product> tmpList = null;
    try {
      final response = await http.get(ApiHandler.GET_PRODUCT);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        tmpList = new List();
        data.forEach((element) {
          tmpList.add(Product.fromJson(element));
        });
        setState(() {
          items = tmpList;
          view_items = tmpList;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
