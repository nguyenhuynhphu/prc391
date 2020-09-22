import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/product/Product.dart';
import 'package:prc391/models/temp_data.dart';
import 'package:prc391/screens/product_Screen.dart';
import 'package:prc391/screens/order_detail.dart';
import 'package:prc391/services/product_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> items = null;
  List<Product> view_items = null;
  ProductBloc productBloc = ProductBloc();

  final txtSearch = TextEditingController();

  @override
  void initState() {
    items = TEMP_DATA;
    view_items = items;
    super.initState();
  }

  @override
  void dispose() {
    txtSearch.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            print(flag);
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
                    return ProductScreen(
                      items: snapshot.data,
                    );
                  }),
            ),

            //--------Button thanh toan
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

//exetension function

}
