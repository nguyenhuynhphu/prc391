import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prc391/screens/root_screen.dart';
import 'package:prc391/screens/store_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootScreen(),
    );
  }
}
