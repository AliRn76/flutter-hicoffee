import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hicoffee2/models/item_model.dart';
import 'package:hicoffee2/screens/item_screen.dart';
import 'package:hicoffee2/wigets/home_category.dart';




class HomeScreen extends StatefulWidget {

  final List<Item> getItems ;

  HomeScreen({this.getItems});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for(int i=0 ; i<widget.getItems.length ; i++){
      print(widget.getItems[i].imageUrl);
    }
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 30.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      print(widget.getItems[1].name);
                    },
                    icon: Icon(FontAwesomeIcons.chartLine),
                    iconSize: 30.0,
                    color: Colors.black87,
                  ),
                  Text(
                    "های کافی",
                    style: TextStyle(
                      fontFamily: "BTitr_Bold",
                      fontSize: 27.0,
                    ),
                  )
                ],
              ),
            ),
            HomeCategory(),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "تمام محصولات    ",
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
                  itemCount: widget.getItems.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    Item item = widget.getItems[index];
                    return GestureDetector(
//                      onTap: () => Navigator.push(
//                          context, SlideRightRoute(page: ItemScreen(item: item))
//                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemScreen(item: item)),
                      ),
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
                                bottom: 110,
                                child: Hero(
                                  tag: item.imageUrl,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
//                                    image: AssetImage(item.imageUrl),
                                      image: NetworkImage("http://al1.best:89${item.imageUrl}"),
                                      fit: BoxFit.cover,
                                      height: 150.0,
                                      width: 150.0,
                                    ),
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
      ),
    );
  }
}

//TODO: Container haye category --> shadow behesh add beshe
//TODO: font koodak, ezafe beshe
//TODO: price ha string beshe , va 12000 --> 12,000 beshe
//TODO: font weigh haye zire item haye por foroosh ha fix beshe