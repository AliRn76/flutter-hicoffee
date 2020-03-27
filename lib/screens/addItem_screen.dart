import 'dart:ui';

import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';


class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  final _formKey = GlobalKey<FormState>();

//  int _selectedIndex = 0;
//
//  List<IconData> _icons = [
//    FontAwesomeIcons.coffee,
//    FontAwesomeIcons.mugHot,
//  ];
//
//
//  Widget _buildIcon(int index){
//    return GestureDetector(
//      onTap: () {
//        setState(() {
//          _selectedIndex = index;
//        });
//      },
//      child: Container(
//        height: 30.0,
//        width: 30.0,
//        decoration: BoxDecoration(
//            color: _selectedIndex == index ? Color(0xFFD8ECF1) : Color(0xFFE7EBEE),
//            borderRadius: BorderRadius.circular(30.0)
//        ),
//        child: Icon(
//          _icons[index],
//          size: 25.0,
//          color: _selectedIndex == index ? Color(0xFF3EBACE) : Color(0xFFB4C1C4),
//        ),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {

    int _currentValue = 1;

    return IconButton(
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
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                textInputAction: TextInputAction.done,
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
                                radioButtonValue: (value) => print(value),
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
                                          setState(() => _currentValue = newValue)
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: RaisedButton(
                                color: Colors.greenAccent[200],
//                                elevation: 10.0,
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
                                    print(_currentValue);
                                    _formKey.currentState.save();
                                    Navigator.of(context, rootNavigator: true).pop();
                                    // INJA BAYAD POST KONM VA AGE OK SHOD , Hamono Print Konam
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
                                  }
                                },
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
      icon: Icon(Icons.library_add),
      iconSize: 30.0,
      color: Colors.green[400],
    );
  }
}
//TODO : دونه ها باید بشن دانه