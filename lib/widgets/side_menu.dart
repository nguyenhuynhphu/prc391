import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

typedef void onSignOut();

class SideMenu extends StatefulWidget {
  final void Function() onSignOut;
  SideMenu(this.onSignOut);

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.play_circle_filled),
            title: Text('Campaigns'),
            onTap: () {
              Navigator.of(context).pop();
            },
            //campaignTap(context)
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: this.widget.onSignOut,
          ),
        ],
      ),
    ));
  }
}
