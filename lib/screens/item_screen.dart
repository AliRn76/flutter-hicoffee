import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hicoffee2/models/item_model.dart';
import 'package:numberpicker/numberpicker.dart';

class ItemScreen extends StatefulWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  int _currentValue = 2;


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
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)
                  ),
                  child: Image(
                    image: AssetImage(widget.item.imageUrl),
                    fit: BoxFit.cover,
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
                bottom: 17.0,
                right: 25.0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
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
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                  "${widget.item.name}",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "BNazanin",
                  fontWeight: FontWeight.w600,
                ),
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
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 00.0),
                  height: 100.0,
                  width: MediaQuery.of(context).size.width-20,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 0.0),
                    child: Text(
                      "از فلانی به قیمته ۱۰۰ تومن خریدم ، آدرسش توی خیابون سوم ، کوچه ی فلان ،گذاشتمش توی طبقه ی بالا",
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),

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
                      left: 65.0,
                      top: 15.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onPressed: (){
                            print("Forokhte shod");
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
                      right: 50.0,
                      top: -39.0,
                      child: Container(
                        child: NumberPicker.integer(
                          scrollDirection: Axis.horizontal,
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


//TODO: behse az DB item catch kard
//TODO: beshe edit kard
//TODO: if bezare ke age comment nadasht , chizi neshonesh nade