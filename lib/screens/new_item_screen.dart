import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  NewItemScreen();
  @override
  NewItemScreenState createState() => NewItemScreenState();
}

class NewItemScreenState extends State<NewItemScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "new",
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 260,
                          margin: EdgeInsets.only(bottom: 25),
                          child: Image.asset(
                            'images/no_image.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                        Positioned.fill(
                          bottom: 50,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 15, right: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Text("Pick a picture"),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Name"),
                              ),
                              Expanded(
                                flex: 7,
                                child: TextField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1))),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Price"),
                              ),
                              Expanded(
                                flex: 7,
                                child: TextField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1))),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text("Description"),
                              ),
                              Expanded(
                                flex: 7,
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  44, 209, 172, 1),
                                              width: 1))),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: 150,
                        child: RaisedButton(
                          onPressed: () => {},
                          color: Color.fromRGBO(44, 209, 172, 1),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: 150,
                        child: RaisedButton(
                          onPressed: () => {},
                          color: Color.fromRGBO(44, 209, 172, 1),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
