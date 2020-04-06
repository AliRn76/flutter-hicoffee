
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:hicoffee2/screens/editItem_screen.dart';
import 'package:hicoffee2/screens/deleteItem_screen.dart';
import 'package:hicoffee2/models/item_model.dart';



class ItemDetail extends StatefulWidget {
  Item item;

  ItemDetail({this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {


  void updateAllList() async {

    print("************Item Screen");
    Item temp_item = widget.item;

    try {
      print("NAEEMMMMMMMMEEE");
      print(widget.item.name);
      Response response = await get(
        "http://al1.best:89/api/show-item/${widget.item.name}",);
      if (response.statusCode != 404){
        Map data = jsonDecode(utf8.decode(response.bodyBytes));

        print("dataaaaaaaaaaaaaaaaa");
        print(data);
        // Serialize data
        temp_item = Item.fromJson(data);

        // Set Default Image & Description For Item
        if (temp_item.image_url == "/media/default.jpg") {
          temp_item.image_url = widget.item.image_url;
        }
      }

    }

    on Exception catch (exception){
      print(exception);
      // Try Every 1 Sec, For Connecting To Server
      Future.delayed(Duration(seconds: 1));
      updateAllList();
    }

    print(temp_item.name);

//    setState(() {
      widget.item = temp_item;
//    });
  }


//  void goToEditItemScreen(Item item) async{
//    var result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => EditItemScreen(item: widget.item)),
//    );
//    print(result);
//    print(result.name);
//    if(result != null){
//      widget.item = result;
//    }
//  }


  @override
  Widget build(BuildContext context) {
    updateAllList();
    if (widget.item.description == "" || widget.item.description == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      EditItemScreen(item: widget.item),
//                      IconButton(
//                        color: Colors.grey[600],
//                        iconSize: 23.0,
//                        icon: Icon(FontAwesomeIcons.edit),
//                        onPressed: () {
//                          goToEditItemScreen(widget.item);
//                        },
//                      ),
                      Flexible(
                        child: Container(
                          height: 25.0,
                          child: Marquee(
                            text: widget.item.name,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: "BNazanin",
                              fontWeight: FontWeight.w600,
                            ),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            blankSpace: MediaQuery.of(context).size.width-150,
                            pauseAfterRound: Duration(seconds: 8),
                            startPadding: 10.0,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                      ),
                      DeleteItemScreen(item: widget.item),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "تعداد: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${widget.item.number}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "قیمت: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${widget.item.price}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
//                  IconButton(
//                  color: Colors.grey[600],
//                    iconSize: 23.0,
//                    icon: Icon(FontAwesomeIcons.edit),
//                    onPressed: () {
//                      goToEditItemScreen(widget.item);
//                    },
//                  ),
                  EditItemScreen(item: widget.item),
                  Flexible(
                    child: Container(
                      height: 25.0,
                      child: Marquee(
                        text: widget.item.name,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w600,
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: MediaQuery.of(context).size.width-150,
                        pauseAfterRound: Duration(seconds: 8),
                        startPadding: 10.0,
                        accelerationDuration: Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ),
                  DeleteItemScreen(item: widget.item),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "${widget.item.price}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " :قیمت",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "${widget.item.number}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " :تعداد",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "BNazanin",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
//                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                    child: Text(
                      widget.item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
