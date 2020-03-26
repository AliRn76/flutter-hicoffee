import 'package:flutter/material.dart';

import 'package:hicoffee2/models/item_model.dart';

class ItemDetail extends StatefulWidget {
  final Item item;

  ItemDetail({this.item});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}
class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    if (widget.item.description == " "){
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
                  child: Text(
                    // Item Name
                    widget.item.name,
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
    }else{
      return Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                // Item Name
                widget.item.name,
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
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
//                  height: 100.0,
                  width: MediaQuery.of(context).size.width-20,
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

