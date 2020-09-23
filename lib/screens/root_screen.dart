// import 'package:donationsystem/repository/user_repository.dart';

import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/login/login_screen.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/screens/main_screen.dart';
import 'package:prc391/services/auth.dart';
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
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.onTokenRefresh.listen((data) {
      print('Refresh Token: $data');
    }, onDone: () => print('Refresh Token Done'));
  }

  setMessage() {
    this.setState(() {
      onMessage = false;
    });
  }

  // @override
  // Future<String> _updateToken(String id, String token) async {
  //   String url =
  //       'https://swdapi.azurewebsites.net/api/Campaign/tokenOfUser/$id/$token';
  //   Map<String, String> headers = {"Content-type": "application/json"};
  //   Response response = await put(url, headers: headers, body: token);
  //   int statusCode = response.statusCode;
  //   String body = response.body;
  //   return "OK";
  // }

  Future<User> fetchUserByEmail(String email) async {
    User user;
    final response = await http
        .get('https://swdapi.azurewebsites.net/api/user/CurrentUser/$email');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      user = User.fromJson(data[0]);
    }
    return user;
  }

  Future<String> signIn(String email, String password) async {
    try {
      auth.signIn(email, password);
      // userRepository
      //     .fetchUserByEmail(email.toString().trim())
      //     .then((value) => currentUser = value);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signOut() async {
    try {
      auth.signOut();
      // userRepository
      //     .fetchUserByEmail(email.toString().trim())
      //     .then((value) => currentUser = value);
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
                  String email;
                  Auth auth = new Auth();
                  // auth.getCurrentUser().then((value1) =>
                  //     fetchUserByEmail(value1.email).then((value2) =>
                  //         _firebaseMessaging.getToken().then((value3) =>
                  //             _updateToken(value2.id.toString(), value3))));

                  //return MainScreen(auth.signOut);
                  return MainScreen(signOut);
                } else {
                  return LoginScreen(signIn);
                }
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: LoadingCircle(50, Colors.black),
              );
            }));
  }
}
