import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {

  final String category;

  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Text("Category : ${widget.category}"),
          ),
        ],
      ),
    );
  }
}
