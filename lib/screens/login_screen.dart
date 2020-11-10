import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc391/widgets/loading-circle.dart';

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
  bool isWait = false;
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
        padding: EdgeInsets.only(left: 50, right: 50, top: 0),
        decoration: BoxDecoration(color: Color.fromRGBO(44, 209, 172, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bobahub",
                        style: TextStyle(
                            fontSize: 48,
                            fontFamily: "DancingScript",
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 1.0,
                                color: Colors.black,
                              ),
                            ])),
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
                      setState(() {
                        isWait = true;
                      });
                      await widget
                          .signIn(emailController.text, passwordController.text)
                          .whenComplete(() => setState(() {
                                isLogin = false;
                               
                              }));
                        setState(() {
                        isWait = false;
                      });
                    },
                    child: isWait
                        ? LoadingCircle(30, Color.fromRGBO(44, 209, 172, 1))
                        : Text('Login',
                            style: TextStyle(
                                color: Color.fromRGBO(44, 209, 172, 1))))),
          ],
        ),
      ),
    );
  }
}
