import 'package:flutter/material.dart';
import 'package:hicoffee2/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        primaryColor: Colors.lightBlue[100],
        accentColor: Colors.pink[50],
      ),
      home: LoadingScreen(),
    );
  }
}
