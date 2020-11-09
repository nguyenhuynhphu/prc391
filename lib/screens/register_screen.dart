import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/models/user/user.dart';
import 'package:prc391/services/api_handler.dart';
import 'package:prc391/services/auth.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(color: Color.fromRGBO(44, 209, 172, 1)),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User",
                        style: TextStyle(
                            fontSize: 42,
                            fontFamily: "DancingScript",
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ])),
                  ],
                )),
            Container(
                margin: new EdgeInsets.only(bottom: 10),
                height: 50,
                child: TextFormField(
                  controller: userNameController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Container(
                margin: new EdgeInsets.only(bottom: 10),
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    //border: Border.all(color: Colors.white, width: 1),
                  ),
                )),
            Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: passwordController,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: confirmPasswordController,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            ButtonTheme(
                buttonColor: Colors.transparent,
                focusColor: Colors.transparent,
                minWidth: 200.0,
                height: 40,
                hoverColor: Colors.transparent,
                child: RaisedButton(
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4),
                    ),
                    onPressed: () async {
                      registerAccount();
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Color.fromRGBO(44, 209, 172, 1),
                            fontSize: 14)))),
          ],
        ),
      ),
    ));
  }

  registerAccount() async {
    String username = userNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (password == confirmPassword) {
      Auth auth = new Auth();
      try {
        await auth.signUp(email, password).whenComplete(() async {
          User tmp = new User(
              deviceToken: null,
              email: email,
              name: username,
              roleId: 2,
              id: 0);
          String url = ApiHandler.NEW_USER;
          Map<String, String> headers = {"Content-type": "application/json"};
          String passingJson = jsonEncode(tmp);
          await post(url, headers: headers, body: passingJson);
          Navigator.pop(context);
        });
      } catch (e) {
        print(e);
      }
    } else {
      print("Password and Confirm Password not correct !");
    }
  }
}
