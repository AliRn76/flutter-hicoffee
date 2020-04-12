
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:hicoffee2/screens/item_screen.dart';
import 'package:hicoffee2/models/item_model.dart';



class CategoryScreen extends StatefulWidget {
  // Catch Category
  final String category;
  final List<Item> items;
  int i;
  CategoryScreen({this.category, this.items});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

// Item Counter
int itemsCounter(String category, List<Item> items){
  List<Item> _items = [];
  int number;

  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == category) {
      _items.add(items[i]);
    }
  }
  number = _items.length;
  return number;
}

// Mug Item Builder
Item _mugItemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "ماگ") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}

// Bean Item Builder
Item _beanItemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "دونه قهوه") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}


// Drink Item Builder
Item _drinkItemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "نوشیدنی") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}

// Chocolate Item Builder
Item _chocolateItemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "شکلات") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}

// Equipment Item Builder
Item _equipmenttemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "وسایل") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}

// Other Item Builder
Item _otherItemBuilder(int index, List<Item> items){
  List<Item> _items = [];
  Item item;
  for (int i=0 ; i<items.length ; i++){
    if (items[i].category == "غیره") {
      _items.add(items[i]);
    }
  }
  item = _items[index];
  return item;
}



class _CategoryScreenState extends State<CategoryScreen> {

  void updateAllList()async{
    List<Item> items;
    try{
      Response response = await get("http://al1.best:89/api/show-all-items/");
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      // Serialize data
      items = data.map((m) => Item.fromJson(m)).toList();

      // Set Default Image & Description For Item
      for(int i=0 ; i<items.length ; i++){
        if(items[i].image_url == "/media/default.jpg"){
          items[i].image_url = "/$i-image.jpg";
        }
      }
      if(!mounted){
        return;
      }
      setState(() {
        widget.items.clear();
        for(int i=0 ; i<items.length ; i++){
          widget.items.add(items[i]);
        }
      });
    }
    on Exception{
      // Try Every 1 Sec, For Connecting To Server
      Future.delayed(Duration(seconds: 1));
      updateAllList();
    }

  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      print("* Refresh Category Screen");
      updateAllList();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              widget.category,
              style: TextStyle(
                fontFamily: "BTitr_Bold",
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
            SizedBox(width: 50.0),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: itemsCounter(widget.category, widget.items),
        itemBuilder: (BuildContext context, int index){
          Item item;
          switch(widget.category){
            case "ماگ":
              item = _mugItemBuilder(index, widget.items);
              break;
            case "دونه قهوه":
              item = _beanItemBuilder(index, widget.items);
              break;
            case "نوشیدنی":
              item = _drinkItemBuilder(index, widget.items);
              break;
            case "شکلات":
              item = _chocolateItemBuilder(index, widget.items);
              break;
            case "وسایل":
              item = _equipmenttemBuilder(index, widget.items);
              break;
            case "غیره":
              item = _otherItemBuilder(index, widget.items);
              break;

          }

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemScreen(item: item)),
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 20.0, 15.0, 0.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: 100.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(80.0, 15.0, 10.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 140.0,
                                  child: Text(
                                    "${item.name}",
                                    style: TextStyle(
                                      fontFamily: "BNazanin",
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.lightBlue[100],
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "تعداد: ",
                                        style: TextStyle(
                                          fontFamily: "BNazanin",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "${item.number}",
                                        style: TextStyle(
                                          fontFamily: "BNazanin",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(width: 70.0),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.pink[100],
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "قیمت: ",
                                        style: TextStyle(
                                          fontFamily: "BNazanin",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "${item.price}",
                                        style: TextStyle(
                                          fontFamily: "BNazanin",
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 27.0, 15.0, 0.0),
                  child: Hero(
                    tag: item.image_url,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: CachedNetworkImage(
                        imageUrl: "http://al1.best:89${item.image_url}",
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 86.0,
                        width: 110.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


