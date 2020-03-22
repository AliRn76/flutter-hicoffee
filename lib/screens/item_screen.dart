import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  final String itemName;

  ItemScreen({this.itemName});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(widget.itemName)
      ),
    );
  }
}
