
import 'dart:ui';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';


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
  int _currentValue = 1;

  String dropdownValue = "ماگ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/add_item_background.jpg"),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment(0.2, 0),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10.0),
                                    Text(
                                      "دسته بندی: ",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      iconSize: 42,
                                      underline: SizedBox(),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'ماگ',
                                        'دونه قهوه',
                                        'نوشیدنی',
                                        'شکلات',
                                        "وسایل",
                                        "غیره",
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()),
                                ),
                              ],
                            ),
                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10.0),
                                    Text(
                                      "تعداد:",
                                      style: TextStyle(
                                          color: Colors.black54
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 35.0),
                                Container(
                                  height: 50,
                                  child: NumberPicker.horizontal(
                                      initialValue: _currentValue,
                                      minValue: 1,
                                      maxValue: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          border: Border.all(color: Colors.blue[400], width: 1.3, )
                                      ),
                                      onChanged: (newValue) =>
                                          setState(() => _currentValue = newValue)
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0),
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
//                                  _postAddItem();
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
