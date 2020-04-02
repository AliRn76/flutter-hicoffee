
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:hicoffee2/sqlite/database_helper.dart';
import 'package:hicoffee2/widgets/item_detail.dart';
import 'package:hicoffee2/models/item_model.dart';


class ItemScreen extends StatefulWidget {
  Item item;

  ItemScreen({this.item});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}



class _ItemScreenState extends State<ItemScreen> {

  int _currentValue = 1;
  bool condition = false;

  void sellItem() async{
    try{
      Map<String, dynamic> myBody = {
        "number": _currentValue,
        "name": widget.item.name,
      };

      String jsonBody = jsonEncode(myBody);
      Map<String, String> reqHeader = {"Content-type": "application/json", "Accept": "application/json"};
      Response response = await post("http://al1.best:89/api/sell-item/", body: jsonBody, headers: reqHeader);

      if(response.statusCode == 200){
        condition = true;
        showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black87),
                  ),
                  title: Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '$_currentValue عدد فروخته شد ',
                        style: TextStyle(
                          fontFamily: "BNazanin",
                          fontSize: 23.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.greenAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        );
      }else{
        showDialog(
            context: context,
            builder: (context) {
              Future.delayed(Duration(milliseconds: 700), () {
                Navigator.of(context).pop(true);
              });
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black87),
                  ),
                  title: Center(
                    child: Text(
                      '${response.statusCode} خطا ',
                      style: TextStyle(
                        fontFamily: "BNazanin",
                        fontSize: 23.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent[700],
                      ),
                    ),
                  ),
                ),
              );
            }
        );
      }

      Future.delayed(Duration(milliseconds: 700), () {
        soldItem(myBody);
      });

    }
    on Exception catch (exception){
      print(exception);
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(milliseconds: 700), () {
              Navigator.of(context).pop(true);
            });
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.black87),
                ),
                title: Center(
                  child: Text(
                    'خطا',
                    style: TextStyle(
                      fontFamily: "BNazanin",
                      fontSize: 23.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent[700],
                    ),
                  ),
                ),
              ),
            );
          }
      );
    }

  }

  void soldItem(Map<String, dynamic> myBody)async{
    //‌ If HTTP Header Was 'OK' Update item it on local database
    if(condition){
      Item item = Item.fromJson(myBody);
      var result = await DatabaseHelper().updateItem(item, widget.item.name);
      print("****************Sold Result: $result");
    }
    Navigator.of(context).pop(true);
  }
  _sellButton(int number){
    // Age Az Oon jens Mojood Nabood
    if(number == 0 || number == null){
      return Positioned(
        left: 50.0,
        top: 15.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.black87),
            ),
            color: Colors.greenAccent[400],
            onPressed: (){
              print("Nothing Will Happen");
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 5.0, 5.0, 5.0),
              child: Text(
                "فروخته شد",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "BNazanin",
                ),
              ),
            ),
          ),
        ),
      );
    }else{
      // Age Az Oon Jens Dashtan
      return Positioned(
        left: 50.0,
        top: 15.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.black87),
            ),
            color: Colors.greenAccent[400],
            onPressed: (){
              sellItem();
//              print("$_currentValue Forokhte shod");
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 5.0, 5.0, 5.0),
              child: Text(
                "فروخته شد",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "BNazanin",
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  _buildNumberScroller(int number){
    if (number == 0 || number == null){
      return Positioned(
        right: 70.0,
        top: 10.0,
        child: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.black26, width: 1.0, ),
          ),
          child: Center(
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }else if (number == 1){
      return Positioned(
        right: 70.0,
        top: 10.0,
        child: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.black26, width: 1.0, ),
          ),
          child: Center(
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }else{
      return Positioned(
        right: 20.0,
        top: 10.0,
        child: Container(
          height: 50,
          child: NumberPicker.horizontal(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.black26, width: 1.0, )
              ),
              initialValue: _currentValue,
              minValue: 1,
              maxValue: number,
              onChanged: (newValue) =>
                  setState(() => _currentValue = newValue)
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width-60,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.item.image_url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "http://al1.best:89${widget.item.image_url}",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
//                      fadeInCurve: Curves.easeIn,
                    ),
//                    child: Image(
////                    image: AssetImage(widget.item.imageUrl),
//                      image: NetworkImage("http://al1.best:89${widget.item.image_url}"),
//                      fit: BoxFit.cover,
//                    ),
                  ),
                ),
              ),
              Positioned(
                top: 35.0,
                left: 10.0,
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 100.0,
                          offset: Offset(7.0, 7.0)
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 23.0,
                right: 35.0,
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 60.0,
                          offset: Offset(7.0, 7.0)
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 17.0,
                right: 25.0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    // Item Category
                    widget.item.category,
                    style: TextStyle(
                      fontFamily: "BTitr_Bold",
                      fontSize: 26.0,
                      letterSpacing: 5.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 20.0,
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 60.0,
                          offset: Offset(7.0, 7.0)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ItemDetail(item: widget.item),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      ),
                    ),
                    _sellButton(widget.item.number),
                    _buildNumberScroller(widget.item.number),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//TODO: beshe edit kard
//TODO: beshe delete kard


