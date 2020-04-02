
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:hicoffee2/sqlite/database_helper.dart';
import 'package:hicoffee2/models/item_model.dart';

class EditItemScreen extends StatefulWidget {
  final Item item;

  EditItemScreen({this.item});

  @override
  _EditItemScreenState createState() => _EditItemScreenState();
}


class _EditItemScreenState extends State<EditItemScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController description = TextEditingController();
  String image_url;
  String category;
  int _currentValue;
  int number = 1;
  bool condition = false;
  bool checkName;


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.name);
    priceController = TextEditingController(text: widget.item.price.toString());
    description = TextEditingController(text: widget.item.description);
    image_url = widget.item.image_url;
    _currentValue = widget.item.number;
  }


  void _updateItem() async{
//    widget.item.name = nameController.text;
//    widget.item.price =  int.parse(priceController.text);
//    number = number;
//    widget.item.description =  description.text;
//    widget.item.image_url =  image_url;
    if (nameController.text == widget.item.name){
      checkName = false;
    }else{
      checkName = await DatabaseHelper().checkItemName(nameController.text); // False mean you can use that username
    }

    if(nameController.text == ' ' || nameController.text == null || priceController.text == ' '|| priceController.text == null || checkName){
      if(checkName){
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
                      '.نام محصول تکراری است',
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
      }else if (nameController.text == " " || nameController.text == null ){
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
                      '.نام محصول را پر کنید',
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
                      '.قیمت را پر کنید',
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
    }else {
      Navigator.of(context).pop(true);
      try{
        // Post Request
        print(description.text);
        Map<String, dynamic> myBody = {
          "last_name": widget.item.name,
          "name": nameController.text,
          "number": number,
          "price": int.parse(priceController.text),
          "description": description.text,
          "image_url": image_url,
        };
        String jsonBody = jsonEncode(myBody);

        Map<String, String> reqHeader = {"Content-type": "application/json", "Accept": "application/json"};

        Response response = await put("http://al1.best:89/api/edit-item/", body: jsonBody, headers: reqHeader);

        // Show Response Message
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
                      child: Text(
                        'ویرایش شد',
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
          editItem(myBody);
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

  }


  void editItem(Map<String, dynamic> myBody)async{
    //‌ If HTTP Header Was 'OK' Update item it on local database
    if(condition){
      Item item = Item.fromJson(myBody);
      var result = await DatabaseHelper().updateItem(item, widget.item.name);
      print("****************Update Result: $result");
    }
    Navigator.pop(context, 'Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!Nope!');
//    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.grey[600],
      iconSize: 23.0,
      icon: Icon(FontAwesomeIcons.edit),
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
                    child: Form(
                      key: _formKey,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "BNazanin",
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "نام محصول",
                                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: priceController,
                                autofocus: false,
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                textInputAction: TextInputAction.go,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "BNazanin",
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  hintText: "قیمت",
                                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10.0),
                                Text(
                                  "تعداد: ",
                                  style: TextStyle(
                                      color: Colors.black54
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: NumberPicker.horizontal(
                                      initialValue: _currentValue,
                                      highlightSelectedValue: false,
                                      minValue: 0,
                                      maxValue: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          border: Border.all(color: Colors.blue[400], width: 1.3, )
                                      ),
                                      onChanged: (newValue) =>
                                          setState(() => number = newValue)
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.commentDots),
                                    iconSize: 26.0,
                                    color: Colors.blueGrey[500],
                                    splashColor: Colors.lightBlue[100],
                                    onPressed: (){
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
                                                title: Column(
                                                  children: <Widget>[
                                                    Center(
                                                      child: Directionality(
                                                        textDirection: TextDirection.rtl,
                                                        child: TextFormField(
                                                          controller: description,
                                                          keyboardType: TextInputType.text,
                                                          textInputAction: TextInputAction.newline,
                                                          maxLines: 4,
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontFamily: "BNazanin",
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                          decoration: InputDecoration(
                                                            hintText: "توضیحات",
                                                            contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                          ),

                                                        ),
                                                      ),
                                                    ),
                                                    FlatButton(
                                                      child: Text(
                                                        "ثبت",
                                                        style: TextStyle(
                                                          fontFamily: "BNazanin",
                                                          fontSize: 20.0,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.greenAccent[700],
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).pop(true);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.greenAccent[200],
                                    child: Text(
                                      "ثبت",
                                      style: TextStyle(
                                        fontFamily: "BNazanin",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        _updateItem();
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.image),
                                    iconSize: 26.0,
                                    color: Colors.blueGrey[500],
                                    splashColor: Colors.lightBlue[100],
                                    onPressed: (){print("ADD IMAGE");},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
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
