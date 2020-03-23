import 'package:flutter/material.dart';
import 'package:hicoffee2/models/item_model.dart';

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

//// Drink Item Builder
//Item _drinkItemBuilder(int index){
//  List<Item> _items = [];
//  Item item;
//  for (int i=0 ; i<items.length ; i++){
//    if (items[i].category == "نوشیدنی") {
//      _items.add(items[i]);
//    }
//  }
//  item = _items[index];
//  return item;
//}



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

          }

          return Text(
            item.name,
          );
        },
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
