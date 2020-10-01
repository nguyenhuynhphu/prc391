import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final Future<String> Function(String, String) signIn;

  LoginScreen(this.signIn);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 50, right: 50, top: 200),
      decoration: BoxDecoration(color: Colors.black87),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sign",
                        style: TextStyle(
                            fontSize: 34,
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                            ])),
                    Text("In",
                        style: TextStyle(
                            fontSize: 38,
                            fontFamily: "Roboto",
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w400,
                            shadows: [])),
                  ],
                )),
            Container(
                margin: new EdgeInsets.only(bottom: 10),
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
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
                      prefixIcon: Icon(Icons.account_box, color: Colors.white)),
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
                      contentPadding: EdgeInsets.all(14),
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
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 20,
                      )),
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
                        side: BorderSide(color: Colors.black)),
                    onPressed: () async {
                      await widget
                          .signIn(emailController.text, passwordController.text)
                          .whenComplete(() => setState(() {
                                isLogin = false;
                              }));
                    },
                    child:
                        Text('Login', style: TextStyle(color: Colors.black)))),
          ],
        ),
      ),
    ));
  }
}
