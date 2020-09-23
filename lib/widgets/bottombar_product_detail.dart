import 'package:flutter/material.dart';

class BottomBarProduct extends StatelessWidget {
  const BottomBarProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.white,
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 80,
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
                height: 80,
                width: MediaQuery.of(context).size.width / 6,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: Color.fromRGBO(44, 209, 172, 1),
                    size: 35,
                  ),
                )),
            FlatButton(
              color: Color.fromRGBO(44, 209, 172, 1),
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(44, 209, 172, 1)),
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width / 6 * 4,
                  child: Column(
                    children: [
                      Text(
                        '2x - ' + (3.99 * 2).toString() + '\$',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  )),
            ),
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 6,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Color.fromRGBO(44, 209, 172, 1),
                    size: 35,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
