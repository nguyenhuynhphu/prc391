import 'package:flutter/material.dart';
import 'package:prc391/models/product/Product.dart';

class BottomBar extends StatefulWidget {
  final void Function() sub;
  final void Function() add;
  const BottomBar({Key key, this.sub, this.add}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.white,
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      widget.sub();
                    },
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: Color.fromRGBO(44, 209, 172, 1),
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      widget.add();
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Color.fromRGBO(44, 209, 172, 1),
                      size: 35,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
