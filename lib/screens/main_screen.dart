import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/screens/new_item_screen.dart';

import 'home_screen.dart';

typedef void onSignOut();

class MainScreen extends StatefulWidget {
  final void Function() onSignOut;
  final User currentUser;
  MainScreen(this.onSignOut, this.currentUser);

  @override
  _MainScreenState createState() => _MainScreenState(onSignOut);
}

class _MainScreenState extends State<MainScreen> {
  final void Function() onSignOut;

  _MainScreenState(this.onSignOut);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bobahub",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            widget.currentUser.roleId == 1
                ? Hero(
                    tag: 'new',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => NewItemScreen())),
                          icon: Icon(Icons.add),
                          iconSize: 34,
                          color: Color.fromRGBO(68, 78, 94, 1),
                        ),
                      ),
                    ))
                : Container(),
            IconButton(
              onPressed: () => this.widget.onSignOut(),
              icon: Icon(Icons.undo),
            ),
          ],
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        body: HomeScreen(this.widget.currentUser));
  }
}
