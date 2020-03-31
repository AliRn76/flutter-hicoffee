
//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
//import 'package:image_downloader/image_downloader.dart';

import 'package:loading/loading.dart';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:hicoffee2/models/item_model.dart';
import 'package:hicoffee2/sqlite/database_helper.dart';
import 'package:hicoffee2/screens/home_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<Item> items;

  // Take Items
  void takeItems()async{
    try{
      Response response = await get("http://al1.best:89/api/show-all-items/");
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      // Serialize data
      items = data.map((m) => Item.fromJson(m)).toList();

      // Set Default Image & Description For Item
      for(int i=0 ; i<items.length ; i++){
        if(items[i].image_url == null){
          items[i].image_url = "/$i image.jpg";
        }
        if(items[i].description == null){
          items[i].description = " ";
        }
      }

// Download Images (Should be delete)

//      List<String> list = [];
//      List<File> files = [];
//
//      for(int i=0 ; i<items.length ; i++){
//        list.add("http://al1.best:89${items[i].image_url}") ;
//      }
//
//      for (var url in list) {
//        try {
//          print(url);
//          var imageId = await ImageDownloader.downloadImage(url,
//            destination: AndroidDestinationType.custom()
//              ..inExternalFilesDir()
//              ..subDirectory(url.substring(31)),
//          );
//          if (imageId == null) {
//            continue;
//          }
//          var path = await ImageDownloader.findPath(imageId);
//          print("Path: $path");
//          files.add(File(path));
//        } catch (error) {
//          print(error);
//        }
//      }

// END Download Images (Should be delete)


      // Work with sqlite
      var delete_items = await DatabaseHelper().deleteItems();
      print(delete_items);
      var result = await DatabaseHelper().insertListItem(items);
      print(result);
      var all_items = await DatabaseHelper().selectItems();
      for(int i=0 ; i<all_items.length; i++){
        print(all_items[i]);
      }
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(all_items: items)),
//          MaterialPageRoute(builder: (context) => HomeScreen()),
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


// TODO : bayad image ro be soorate string (i think) save konm