import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hicoffee2/models/item_model.dart';

class ItemScreen extends StatefulWidget {
  final Item item;

  ItemScreen({this.item});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
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
            ],
          ),
          Text(
              "${widget.item.name}"
          ),
          Text(
            "${widget.item.price}"
          ),
          Text(
            "${widget.item.number}"
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.edit),
            onPressed: (){},
            color: Colors.lightBlue,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.cartPlus),
            onPressed: (){},
            iconSize: 42.0,
            color: Colors.greenAccent[400],
          ),

        ],
      ),
    );
  }
}
