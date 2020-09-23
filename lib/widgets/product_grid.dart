import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.amberAccent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 180,
          decoration: BoxDecoration(color: Colors.white),
          child: GridView.count(
            primary: false,
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                  onLongPress: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen('product');
                      })),
                  child: Hero(
                      tag: "product",
                      child: Material(
                        type: MaterialType.transparency, // likely needed
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: new DecorationImage(
                                image: new NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/prc391-2020.appspot.com/o/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?alt=media&token=872c3fb3-3000-4290-8f72-1918e462b76f'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: Color.fromRGBO(68, 78, 94, 1)),
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.1),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  "He'd have you all unravel at the",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ))),
            ],
          )),
    );
  }
}
