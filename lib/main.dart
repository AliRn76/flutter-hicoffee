import 'package:flutter/material.dart';
import 'package:hicoffee2/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lime[50],
      ),
      home: HomeScreen(),
    );
  }
}
