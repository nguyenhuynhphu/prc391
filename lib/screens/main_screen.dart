import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/screens/new_item_screen.dart';
import 'package:http/http.dart' as http;
import 'package:prc391/screens/register_screen.dart';
import 'package:prc391/services/api_handler.dart';
import 'package:prc391/services/auth.dart';
import 'package:prc391/widgets/loading-circle.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final void Function() onSignOut;
  MainScreen(this.onSignOut);

  @override
  _MainScreenState createState() => _MainScreenState(onSignOut);
}

class _MainScreenState extends State<MainScreen> {
  final void Function() onSignOut;
  User currentUser;
  _MainScreenState(this.onSignOut);

  @override
  void initState() {
    super.initState();
    this.currentUser = null;
    fetchUserByEmail();
  }

  @override
  Widget build(BuildContext context) {
    if (this.currentUser == null) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: LoadingCircle(50, Colors.black),
      );
    } else {
      print(this.currentUser.email);
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Bobahub",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              currentUser.roleId == 1
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
              currentUser.roleId == 1
                  ? Hero(
                      tag: 'newUser',
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
                                    builder: (context) => RegisterScreen())),
                            icon: Icon(Icons.supervised_user_circle),
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
          body: HomeScreen(currentUser));
    }
  }

  Future<User> fetchUserByEmail() async {
    print("Fetching");

    Auth auth = new Auth();
    auth.getCurrentUser().then((value) async {
      await http
          .get('${ApiHandler.GET_USER_BY_EMAIL}${value.email}')
          .then((value) {
        if (value.statusCode == 200) {
          var data = json.decode(value.body);
          this.setState(() {
            this.currentUser = User.fromJson(data);
          });
        }
      });
    }).whenComplete(() {
      print("DOne");
      print(this.currentUser.email);
    }).whenComplete(() => setState(() {}));
  }
}
