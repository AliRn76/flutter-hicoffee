import 'package:flutter/material.dart';
import 'package:hicoffee2/sqlite/CreateDatabase.dart';

import 'package:loading/indicator/ball_pulse_indicator.dart';

import 'package:loading/loading.dart';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:hicoffee2/models/item_model.dart';

import 'package:hicoffee2/screens/home_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // Take Items
  void takeItems()async{
    try{
      Response response = await get("http://al1.best:89/api/show-all-items/");
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      // Serialize data
      List<Item> items = data.map((m) => Item.fromJson(m)).toList();

      // Set Default Image & Description For Item
      for(int i=0 ; i<items.length ; i++){
        if(items[i].image_url == null){
          print(items[i].image_url);
          items[i].image_url = "/$i image.jpg";
        }
        if(items[i].description == null){
          items[i].description = " ";
        }
      }

      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(getItems: items)),
      );
    }
    on Exception{
      // Try Every 1 Sec, For Connecting To Server
      Future.delayed(Duration(seconds: 1));
      takeItems();
    }
  }

  @override
  void initState() {
    super.initState();
    createDatabase();
    takeItems();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Loading(
          indicator: BallPulseIndicator(),
          size: 100.0,
          color: Colors.pink
        ),
      ),
    );
  }
}
