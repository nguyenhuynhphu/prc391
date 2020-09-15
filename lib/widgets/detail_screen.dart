import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String heroTag;
  DetailScreen(this.heroTag);
  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: widget.heroTag,
      child: Image.network(
        'https://firebasestorage.googleapis.com/v0/b/prc391-2020.appspot.com/o/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?alt=media&token=872c3fb3-3000-4290-8f72-1918e462b76f',
      ),
    ));
  }
}
