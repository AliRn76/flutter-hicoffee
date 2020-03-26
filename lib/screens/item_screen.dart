import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hicoffee2/models/item_model.dart';

import 'package:hicoffee2/wigets/item_detail.dart';

class ItemScreen extends StatefulWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}



class _ItemScreenState extends State<ItemScreen> {

  int _currentValue = 1;

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
                  tag: widget.item.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)
                    ),
                    child: Image(
//                    image: AssetImage(widget.item.imageUrl),
                      image: NetworkImage("http://al1.best:89${widget.item.imageUrl}"),
                      fit: BoxFit.cover,
                    ),
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
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.edit),
                  onPressed: (){print("clicked on edit");},
                  color: Colors.lightBlue[100],
                  iconSize: 23.0,
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
                    Positioned(
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
                            print("$_currentValue Forokhte shod");
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
                    ),
                    Positioned(
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
                            maxValue: 100,
                            onChanged: (newValue) =>
                                setState(() => _currentValue = newValue)
                        ),
                      ),
                    ),
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
//TODO: