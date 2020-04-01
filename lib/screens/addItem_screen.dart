
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:ui';

import 'package:hicoffee2/sqlite/database_helper.dart';


class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController description = TextEditingController();
  String category;
  int number = 1;
  bool condition = false;


  void _postAddItem()async{
    print("text: ${nameController.text}");
    print("price: ${priceController.text}");
    bool checkName = await DatabaseHelper().checkItemName(nameController.text); // False mean you can use that username

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
      }else if (nameController.text == ' ' || nameController.text == null ){
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
        Map<String, dynamic> myBody = {
          "name": nameController.text,
          "category": category,
          "number": number,
          "price": int.parse(priceController.text),
          "description": description.text,
          "image_url": "default.jpg",
        };
        String jsonBody = jsonEncode(myBody);

        Map<String, String> reqHeader = {"Content-type": "application/json", "Accept": "application/json"};

        Response response = await post("http://al1.best:89/api/add-item/", body: jsonBody, headers: reqHeader);

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
                        'ثبت شد',
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
          takeItems(myBody);
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


  void takeItems(Map<String, dynamic> myBody)async{
    //‌ If HTTP Header Was 'OK' Insert item it on local database
    if(condition){
//          Item item = Item.fromJson(myBody);
//          var result = await DatabaseHelper().insertItem(item);
//          print("Insert Result: $result");
    }
  }

  @override
  Widget build(BuildContext context) {
    int _currentValue = 1;

    return IconButton(
      icon: Icon(Icons.library_add),
      iconSize: 30.0,
      color: Colors.green[400],
      onPressed: (){
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
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomRadioButton(
                                horizontal: true,
                                enableShape: true,
                                elevation: 0.0,
                                buttonColor: Theme.of(context).canvasColor,
                                buttonLables: [
                                  "ماگ",
                                  "دونه قهوه",
                                  "نوشیدنی",
                                  "شکلات",
                                  "وسایل",
                                  "غیره",
                                ],
                                buttonValues: [
                                  "ماگ",
                                  "دونه قهوه",
                                  "نوشیدنی",
                                  "شکلات",
                                  "وسایل",
                                  "غیره",
                                ],
                                radioButtonValue: (value) => category = value,
                                selectedColor: Colors.blue[300],
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
                                      minValue: 1,
                                      maxValue: 100,
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
                                        _postAddItem();
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
//TODO : دونه ها باید بشن دانه