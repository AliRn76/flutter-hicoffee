import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hicoffee2/models/item_model.dart';

import 'item_screen.dart';

class CategoryScreen extends StatefulWidget {
  // Catch Category
  final String category;
  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

// Item Counter
int itemsCounter(String category){
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
Item _mugItemBuilder(int index){
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
Item _beanItemBuilder(int index){
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
Item _drinkItemBuilder(int index){
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
Item _chocolateItemBuilder(int index){
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
Item _equipmenttemBuilder(int index){
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
Item _otherItemBuilder(int index){
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

  @override
  Widget build(BuildContext context) {
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
        itemCount: itemsCounter(widget.category),
        itemBuilder: (BuildContext context, int index){
          Item item;
          switch(widget.category){
            case "ماگ":
              item = _mugItemBuilder(index);
              break;
            case "دونه قهوه":
              item = _beanItemBuilder(index);
              break;
            case "نوشیدنی":
              item = _drinkItemBuilder(index);
              break;
            case "شکلات":
              item = _chocolateItemBuilder(index);
              break;
            case "وسایل":
              item = _equipmenttemBuilder(index);
              break;
            case "غیره":
              item = _otherItemBuilder(index);
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
                        padding: EdgeInsets.fromLTRB(30.0, 15.0, 10.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
//                                color: Colors.red,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: AssetImage("${item.imageUrl}"),
                      height: 86.0,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreenAccent[100],
      ),
//      ListView(
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//            child: Container(
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(10.0),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.black12,
//                    blurRadius: 6.0,
//                    offset: Offset(0.0, 2.0),
//                  ),
//                ],
//              ),
//
//              height: 100.0,
//              width: double.infinity,
//              child: Row(
//                children: <Widget>[
//                  Text(
//                    _mugItemBuilder(0).name,
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
    );
  }
}


//TODO: beshe item add kard
