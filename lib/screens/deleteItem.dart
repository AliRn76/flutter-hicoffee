
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:ui';

import 'package:hicoffee2/models/item_model.dart';

class DeleteItemScreen extends StatefulWidget {
  final Item item;

  DeleteItemScreen({this.item});

  @override
  _DeleteItemScreenState createState() => _DeleteItemScreenState();
}

class _DeleteItemScreenState extends State<DeleteItemScreen> {
  void _deleteItem() async {
    Navigator.of(context).pop(true);
    try{
      // Delete Request
      Map<String, String> reqHeader = {"Content-type": "application/json", "Accept": "application/json"};

      Response response = await delete("http://al1.best:89/api/delete-item/${widget.item.name}" , headers: reqHeader);

      print(response.statusCode);
      // Show Response Message
      if(response.statusCode == 200){
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
                    child: Text(
                      'حذف شد',
                      style: TextStyle(
                        fontFamily: "BNazanin",
                        fontSize: 23.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.greenAccent[700],
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
      // Collect Data Again
      Future.delayed(Duration(milliseconds: 700), () {
        Navigator.of(context).pop(true);
        Navigator.of(context).pop(true);
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

//    var result = await DatabaseHelper().deleteItem(widget.item);
//    print(result);
  }


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.trash),
      color: Colors.redAccent[400],
      iconSize: 21.0,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black87),
                  ),
                  content: SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "آیا از حذف اطمینان دارید؟",
                            style: TextStyle(
                              fontFamily: "BNazanin",
                              fontWeight: FontWeight.w600,
                              fontSize: 19.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(FontAwesomeIcons.check),
                                iconSize: 27.0,
                                color: Colors.greenAccent[200],
                                onPressed: (){
                                  _deleteItem();
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.times),
                                iconSize: 27.0,
                                color: Colors.redAccent[400],
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
