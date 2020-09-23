import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/new_item_screen.dart';
import 'package:prc391/widgets/side_menu.dart';

import 'home_screen.dart';

typedef void onSignOut();

class MainScreen extends StatefulWidget {
  final void Function() onSignOut;
  MainScreen(this.onSignOut);

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
            "Check out",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Hero(
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
          ],
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        drawer: SideMenu(onSignOut),
        body: renderBody());
  }

  renderBody() {
    return HomeScreen();

    // if (snapshot.data == "home") {

    // } else if (snapshot.data == "campaign_newest") {
    //   return CampaignScreen(filterStatus);
    // } else if (snapshot.data == "profile") {
    //   return ProfileScreen();
    // } else {
    //   return
    //   Container(
    //     alignment: Alignment.center,
    //     child: LoadingCircle(20, Colors.black)
    //   );
    // }
  }
}
