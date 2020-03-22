import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hicoffee2/models/item_model.dart';
import 'package:hicoffee2/screens/category_screen.dart';
import 'package:hicoffee2/screens/item_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Item>sample = [
    Item(
      imageUrl: "assets/images/item0.png",
      category: "Coffee bean",
    ),
    Item(
      imageUrl: "assets/images/item1.png",
      category: "Mug",
    ),
    Item(
      imageUrl: "assets/images/item2.png",
      category: "Spresso",
    ),
    Item(
      imageUrl: "assets/images/item3.png",
      category: "Chocolate",
    ),
    Item(
      imageUrl: "assets/images/item0.png",
      category: "Mug",
    ),
    Item(
      imageUrl: "assets/images/item0.png",
      category: "Other",
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 30.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.chartLine),
                    iconSize: 30.0,
                    color: Colors.black87,
                  ),
                  Text(
                    "های کافی",
                    style: TextStyle(
                      fontFamily: "BTitr_Bold",
                      fontSize: 27.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[0].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[0].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[1].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[1].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[2].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[2].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[3].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[3].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[4].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[4].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CategoryScreen(category: sample[5].category)
                      )),
                  child: Container(
                    height: 120.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.lightBlue[50],
                        ),
                      ],
                    ),
                    child: Image(
                      image: AssetImage(sample[5].imageUrl),
                      height: 120.0,
                      width: 150.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "پر فروش ترین ها",
                style: TextStyle(
                  fontFamily: "BNazanin_outline",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          SizedBox(
            height: 270.0,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  Item item = items[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => ItemScreen(itemName: item.name)
                        )),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
                      child: Container(
                        width: 170.0,
                        height: 270.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 30.0,
                              child: Container(
                                height: 110.0,
                                width: 170.0,
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontFamily: "BNazanin",
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      'تعداد: ${item.number}',
                                      style: TextStyle(
                                        fontFamily: "BNazanin",
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${item.price} تومن ',
                                      style: TextStyle(
                                        fontFamily: "BNazanin",
                                        fontSize: 17.0,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image: AssetImage(item.imageUrl),
                                  fit: BoxFit.cover,
                                  height: 150.0,
                                  width: 150.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
