// import 'package:donationsystem/repository/user_repository.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/login_screen.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/screens/main_screen.dart';
import 'package:prc391/services/auth.dart';
import 'package:prc391/services/notify.dart';
import 'package:prc391/widgets/loading-circle.dart';

class RootScreen extends StatefulWidget {
  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State {
  final Auth auth = new Auth();
  // UserRepository userRepository = new UserRepository();
  User currentUser;
  bool onMessage = false;
  String token;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    _firebaseMessaging.autoInitEnabled().then((bool enabled) => print(enabled));
    _firebaseMessaging.setAutoInitEnabled(true).then((_) => _firebaseMessaging
        .autoInitEnabled()
        .then((bool enabled) => print(enabled)));
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showDialog(
            message["notification"]["title"], message["notification"]["body"]);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.onTokenRefresh.listen((data) {
      token = data;
      print('Refresh Token: $data');
    }, onDone: () => print('Refresh Token Done'));
  }

  setMessage() {
    this.setState(() {
      onMessage = false;
    });
  }

  void _showDialog(String title, String content) {
    // flutter defined function
    print("asdfasdf");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("$title"),
          content: Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("images/list.png", fit: BoxFit.cover)),
              SizedBox(
                width: 15,
              ),
              Text("$content"),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> signIn(String email, String password) async {
    try {
      await auth.signIn(email, password).then((value) {
        if (value != null) {
          PushNotificationService.updateToken(email, token);
          return "success";
        } else {
          return "error";
        }
      });
    } catch (e) {
      print("errr: " + e.toString());
      return "error";
    }
  }

  Future<String> signOut() async {
    try {
      auth.signOut();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<String>(
            stream: auth.onAuthStateChanged,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return MainScreen(signOut);
                } else {
                  return LoginScreen(signIn);
                }
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white),
                child: LoadingCircle(50, Colors.black),
              );
            }));
  }
}
