import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hicoffee2/animations/slide_right_route.dart';

import 'package:hicoffee2/models/item_model.dart';
import 'package:hicoffee2/screens/category_screen.dart';




class HomeCategory extends StatefulWidget {

  final List<Item> getItems ;

  HomeCategory({this.getItems});

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {

  List<Item>category_detail = [
    Item(
      category: "دونه قهوه",
    ),
    Item(
      category: "ماگ",
    ),
    Item(
      category: "نوشیدنی",
    ),
    Item(
      category: "شکلات",
    ),
    Item(
      category: "وسایل",
    ),
    Item(
      category: "غیره",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[0].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAFEC4065), Color(0xAFE1306C)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.coffee,
                            size: 30.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "دونه قهوه",
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/14),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[1].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAFFD1D1D), Color(0xAFEC4065)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.coffee,
                            size: 30.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "ماگ",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[2].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAFC13584), Color(0xAF833AB4)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.mugHot,
                            size: 31.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "نوشیدنی",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/14),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[3].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAFE1306C), Color(0xAFC13584)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.mugHot,
                            size: 31.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "شکلات",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[4].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAF5851DB), Color(0xAF405DE6)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.blender,
                            size: 31.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "وسایل",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/14),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideLeftRoute(page: CategoryScreen(category: category_detail[5].category, items: widget.getItems,)),
                  ),
                  child: Container(
                    height: 55.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xAFC13584), Color(0xAF5851DB)],
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15.0,
                          top: 10.0,
                          child: Icon(
                            FontAwesomeIcons.beer,
                            size: 31.0,
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Text(
                            "غیره",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "BTitr_Bold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
